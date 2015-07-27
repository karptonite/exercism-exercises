<?php

function isLeap( $year )
{
    if( $year % 400 === 0 )
        return true;
    if( $year % 100 === 0 )
        return false;
    return !( $year % 4 );
    
    // the solution below is more concise but not as clear
    // return !( $year % 4 ) && ( $year % 100 || !( $year % 400 ) );
}
