<?php

$start = microtime( true );

$script = 'roman-numerals.php';
require( $script  );
for( $i = 1; $i <= 3000; $i++ )
{
    toRoman( $i );
}

echo microtime( true ) - $start;
