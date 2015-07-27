<?php

function toDecimal( $trinaryString )
{
    // validate trinary number
    if( preg_match( "/[^012]/", $trinaryString ) )
        return 0;

    $result = 0;
    $trinaryArr = str_split( strrev( $trinaryString ) );

    foreach( $trinaryArr as $place => $digit ){
        $result += $digit * pow( 3, $place );
    }
    
    return $result;
}
