<?php

class Game
{
    private $roll = 0;
    private $rolls = array();

    public function roll( $pins ){
        $this->rolls[] = $pins;
    }

    public function score(){
        $score = 0;

        for( $i = 0 ; $i < 10 ; $i++ )
        {
            $score += $this->scoreFrame();
            $this->advanceFrame();
        }

        return $score;
    }

    private function scoreFrame()
    {
        $score = $this->nextTwoRolls();

        if( $this->allPinsDown() )
            $score += $this->bonusRoll();

        return $score;
    }

    private function bonusRoll(){
        return $this->rolls[ $this->roll + 2 ];
    }

    private function advanceFrame()
    {
        $this->roll += $this->isStrike() ? 1 : 2;
    }

    private function allPinsDown()
    {
        return $this->nextTwoRolls() >= 10;
    }

    private function nextTwoRolls()
    {
        return $this->rolls[ $this->roll ] + $this->rolls[ $this->roll+1 ];
    }

    private function isStrike()
    {
        return $this->rolls[ $this->roll ] == 10;
    }
}
