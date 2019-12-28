module Chapter7 where

import           Control.Lens
import           Data.Char

-- Section 1: --
{-
  Question 1:
    * fold
    * lens and traversal
    * lens, fold, and traversal
-}

-- Question 2:
q121 :: (String, String)
q121 = ("Jurassic", "Park") & both .~ "N/A"

q122 :: (String, String)
q122 = ("Jurassic", "Park") & both . each .~ 'x'

q123 :: (String, [String])
q123 = ("Malcolm", ["Kaylee", "Inara", "Jayne"]) & beside id traversed %~ take 3

q124 :: (String, [String])
q124 = ("Malcolm", ["Kaylee", "Inara", "Jayne"]) & _2 . element 1 .~ "River"

q125 :: [String]
q125 = 
  ["Die Another Day", "Live and Let Die", "You Only Live Twice"]
    & traversed . elementOf worded 1 . traversed .~ 'x' 

q126 :: ((Int, Int), (Int, Int))
q126 = ((1, 2), (3, 4)) & beside both both +~ 1

q127 :: (Integer, (Integer, [Integer]))
q127 = (1, (2, [3, 4])) & beside id (beside id each) +~ 1 

q128 :: ((Bool, String), (Bool, String), (Bool, String))
q128 = 
  ((True, "Strawberries"), (False, "Blueberries"), (True, "Blackberries"))
    & each . filtered fst . _2 . taking 4 traversed %~ toUpper

q129 :: (String, String, String)
q129 = 
  ((True, "Strawberries"), (False, "Blueberries"), (True, "Blackberries"))
    & each %~ snd
  

-- Section 2 --
q211 = view _1 (Nothing, "Rosebud")
q212 = 
