<?php

class Robot
{
    private $name;
    private $letters;
    private static $names = [];

    public function __construct() {
        $this->letters = range( 'a', 'z' );
        $this->reset();
    }

    public function getName() {
        return $this->name;
    }

    public function reset() {
        $keys = array_flip( array_rand( $this->letters, 2 ) );
        $this->name = implode( array_intersect_key( $this->letters, $keys ) ) . rand( 100, 999 );
        if( in_array( $this->name, self::$names ) ) {
            $this->reset();
        } else {
            self::$names[] = $this->name;
        }
    }
}

