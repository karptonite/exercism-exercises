<?php
class Clock
{
    private $hours;
    private $minutes;

    public function __construct( $hours, $minutes = 0 ) {
        $this->hours = $hours;
        $this->minutes = $minutes;
    }

    public function __toString() {
        return str_pad( $this->hours, 2, '0', STR_PAD_LEFT ) . ":" . str_pad( $this->minutes, 2, '0', STR_PAD_LEFT );
    }

    public function add( $minutes ) {
        $this->minutes += $minutes;
        $this->normalizeTime();
        return $this;
    }

    public function sub( $minutes ) {
        return $this->add( -$minutes );
    }

    private function normalizeTime() {
        $this->normalizeMinutes();
        $this->normalizeHours();
    }

    private function normalizeMinutes() {
        $this->hours += floor( $this->minutes / 60 );
        $this->minutes = $this->mod( $this->minutes, 60 );
    }

    private function normalizeHours() {
        $this->hours = $this->mod( $this->hours, 24 );
    }

    private function mod( $a, $b ){
        $a %= $b;
        if ( $a < 0 )
            $a += abs( $b );

        return $a;
    }
}
