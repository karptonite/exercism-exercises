<?php

function resultFor( $board )
{
    $game = new Hex( $board );
    return $game->results();
}

class Hex
{
    private $board;
    
    public function __construct( $board )
    {
        $this->board = $this->arrayBoard( $board );
    }

    private function arrayBoard( $board )
    {
        return array_map( 'str_split', $board );
    }

    public function results()
    {
        if( $this->whiteWins() ) {
            return 'white';
        }

        if( $this->blackWins() ) {
            return 'black';
        }

        return null;
    }

    private function whiteWins()
    {
        return $this->playerWins( $this->transpose( $this->board ), 'O' );
    }

    private function blackWins()
    {
        return $this->playerWins( $this->board, 'X' );
    }

    private function playerWins( $board, $char )
    {
        $playerBoard = new PlayerBoard( $board, $char );
        $judge       = new Judge( $playerBoard );
        return $judge->playerIsWinner();
    }

    private function transpose( $array ) {
        array_unshift( $array, null );
        return call_user_func_array( 'array_map', $array );
    }
}

class Coordinates
{
    public $column;
    public $row;
    private static $transformations = [
        [ 1, 0 ],
        [ 0, 1 ],
        [ -1, 1 ],
        [ -1, 0 ],
        [ 0, -1 ],
        [ 1, -1 ],
    ];

    public function __construct( $column, $row )
    {
        $this->column = $column;
        $this->row    = $row;
    }

    // This is user by array_unique() to remove duplicates from the network
    public function __toString()
    {
        return "$this->row $this->column";
    }

    private function transform( $transformation )
    {
        return new Coordinates( $this->column + $transformation[0], $this->row + $transformation[1] );
    }

    public function getNeighbors()
    {
        return array_map( [$this, 'transform'], self::$transformations );
    }
}

class PlayerBoard
{
    private $board;
    private $char;

    public function __construct( $board, $char )
    {
        $this->board = $board;
        $this->char = $char;
    }

    public function rowCount()
    {
        return count( $this->board );
    }

    private function lastColumn()
    {
        return count( $this->board[0] ) - 1;
    }

    public function positionOccupied( Coordinates $position )
    {
        return @$this->board[$position->row][$position->column] === $this->char;
    }

    public function positionIsAtFinishLine( Coordinates $position )
    {
        return $position->column == $this->lastColumn();
    }
}

class Judge
{
    public function __construct( PlayerBoard $playerBoard )
    {
        $this->playerBoard = $playerBoard;
    }

    public function playerIsWinner()
    {
        for ( $row = 0; $row < $this->playerBoard->rowCount() ; $row++ ) {
            if ( $this->rowConnects( $row ) ) {
                return true;
            }
        }
    }

    private function rowConnects( $row )
    {
        $startPosition = new Coordinates( 0, $row );
        $network = new Network( $this->playerBoard, $startPosition );
        return $network->reachesFinishLine( $network );
    }
}

class Network
{
    private $playerBoard;
    private $network = [];

    public function __construct( PlayerBoard $playerBoard, Coordinates $startPosition )
    {
        $this->playerBoard = $playerBoard;
        if( $this->playerBoard->positionOccupied( $startPosition ) ) {
            $this->constructFromStartPlacement( $startPosition );
        }
    }

    public function reachesFinishLine()
    {
        foreach( $this->network as $placement ) {
            if( $this->playerBoard->positionIsAtFinishLine( $placement ) ) {
                return true;
            }
        }
    }

    private function constructFromStartPlacement( $startPlacement )
    {
        $this->network[] = $startPlacement;
        while( $nextPlacements = $this->nextPlacements() ) {
            $this->network = array_merge( $this->network, $nextPlacements );
        }
    }


    private function nextPlacements()
    {
        $nextPlacements = [];
        foreach( $this->network as $placement ) {
            $nextPlacements =  array_merge( $nextPlacements, $this->newAdjacentPlacements( $placement ) );
        }

        return array_unique( $nextPlacements );
    }

    private function newAdjacentPlacements( Coordinates $placement )
    {
        $newPlacements = [];
        $neighbors = $placement->getNeighbors();
        return array_filter( $neighbors, [$this, 'newPlacementAtPosition'] );
    }

    private function newPlacementAtPosition( Coordinates $position )
    {
        return !in_array( $position, $this->network ) && $this->playerBoard->positionOccupied( $position );
    }
}
