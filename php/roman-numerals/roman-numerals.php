<?php

function toRoman( $num )
{
    $romanTranslator = new RomanTranslator();
    return $romanTranslator->toRoman( $num );
}

class RomanTranslator
{
    private static $chunks = [
        1000 => 'M',
        900  => 'CM',
        500  => 'D',
        400  => 'CD',
        100  => 'C',
        90   => 'XC',
        50   => 'L',
        40   => 'XL',
        10   => 'X',
        9    => 'IX',
        5    => 'V',
        4    => 'IV',
        1    => 'I',
    ];

    public function toRoman( $num )
    {
        $nextChunk = $this->getnextChunk( $num );
        return $nextChunk ? $nextChunk['rnum'] . $this->toRoman( $num - $nextChunk['value'] ) : '';
    }

    private function getNextChunk( $num )
    {
        foreach( static::$chunks as $value => $rnum )
            if( $num >= $value )
                return compact( 'rnum', 'value' );

        return false;
    }
}
