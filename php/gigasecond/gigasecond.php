<?php

function from( Datetime $dt )
{
    return $dt->add( DateInterval::createFromDateString( "1000000000 seconds" ) );
}
