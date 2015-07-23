<?php

function squareOfSums( $value ){
    return square( array_sum( range( 1, $value ) ) );
}

function square( $value ){
    return pow( $value, 2 );
}

function sumOfSquares( $value ){
    return array_sum( array_map( 'square', range( 1, $value ) ) );
}

function difference( $value ){
    return  squareOfSums( $value ) - sumOfSquares( $value );
}
