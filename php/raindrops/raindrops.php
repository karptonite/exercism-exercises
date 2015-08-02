<?php
function raindrops( $value )
{
    $rainMaker = new RainMaker( $value );
    return $rainMaker->rain();
}

class Rainmaker
{
    static $sounds = [
        'Pling' => 3,
        'Plang' => 5,
        'Plong' => 7 
    ];
    
    private $value;

    public function __construct( $value ){
        $this->value = $value;
    }

    public function rain(){
        return implode ( $this->getSounds() ) ?: (string)$this->value;
    }

    private function getSounds()
    {
         return array_keys( array_filter( static::$sounds, [$this, "isFactor"] ) ); 
    }

    private function isFactor( $divisor )
    {
        return !( $this->value % $divisor );
    }
}
