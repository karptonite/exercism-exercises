<?php

function toRna( $dna )
{
    return strtr( $dna, 'ATCG', 'UAGC' );
}
