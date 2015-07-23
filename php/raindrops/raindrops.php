<?php
function raindrops( $value )
{
    $rainMaker = new RainMaker( $value );
    return $rainMaker->rain();
}

class Rainmaker
{
    static $rain = [
        'Pling' => 3,
        'Plang' => 5,
        'Plong' => 7 
    ];
    
    private $value;

    public function __construct( $value ){
        $this->value = $value;
    }

    public function rain(){
        return implode ( array_keys( array_filter( static::$rain, [$this, "callback"] ) ) ) ?: (string)$this->value;
    }

    private function callback( $divisor ) {
        return !( $this->value % $divisor );
    }
}
