<?php

function calculate( $problem )
{
    $operationFactory = new OperationFactory;
    $parser           = new ProblemParser( $operationFactory );
    $calculator       = new Calculator( $parser );
    return $calculator->calculate( $problem );
}

class Calculator
{
    private $parser;

    public function __construct( ProblemParser $parser )
    {
        $this->parser = $parser;
    }

    public function calculate( $problem )
    {
        $initialValue = $this->parser->parseInitial( $problem );
        $operations   = $this->parser->parseOperations( $problem );
        return array_reduce( $operations, [$this, 'operate'], $initialValue );
    }

    private function operate( $carry, Operation $operation )
    {
        return $operation->operate( $carry );
    }
}

class ProblemParser
{
    private $operationFactory;

    public function __construct( OperationFactory $operationFactory )
    {
        $this->operationFactory = $operationFactory;
    }

    public function parseInitial( $problem )
    {
        preg_match( "/([-\d]+)/", $problem, $matches );

        if( empty( $matches[1] ) )
            throw new InvalidArgumentException;

        return $matches[1];
    }

    public function parseOperations( $problem )
    {
        $operators = implode( $this->operationFactory->getOperators(), '|' );
        preg_match_all( "/({$operators}) ([-\d]+)/", $problem, $matches );

        if( !$matches[1] )
            throw new InvalidArgumentException;

        $operators = [];
        foreach( $matches[1] as $key => $name )
            $operators[] = $this->operationFactory->makeOperation( $name, $matches[2][$key] );

        return $operators;
    }
}

class OperationFactory
{
    private static $operators = [
        'plus'          => 'Plus',
        'minus'         => 'Minus',
        'multiplied by' => 'Multiply',
        'divided by'    => 'Divide'
    ];

    public function getOperators()
    {
        return array_keys( self::$operators );
    }
    
    public function makeOperation( $name, $value )
    {
        return new self::$operators[$name]( $value );
    }
}

interface Operation
{
    public function operate( $num );
}

abstract class AbstractOperation implements Operation
{
    protected $value;

    public function __construct( $value )
    {
        $this->value = $value;
    }
}

class Plus extends AbstractOperation
{
    public function operate( $num )
    {
        return $num + $this->value;
    }
}

class Minus extends AbstractOperation implements Operation
{
    public function operate( $num )
    {
        return $num - $this->value;
    }
}

class Multiply extends AbstractOperation
{
    public function operate( $num )
    {
        return $num * $this->value;
    }
}

class Divide extends AbstractOperation
{
    public function operate( $num )
    {
        return $num / $this->value;
    }
}

