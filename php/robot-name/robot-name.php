<?php

class Robot
{
    private $name;
    private $letters;

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
    }
}

