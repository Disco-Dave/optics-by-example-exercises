module Chapter4 where

import           Control.Lens

{- Section 1 -}
data Vorpal a
question1 :: Lens (Vorpal a) (Vorpal b) a b
question1 = undefined

data Result e
question2 :: Lens (Result a) (Result b) (Either a String) (Either b String)
question2 = undefined

-- Question 4: Yes, if they are within the same focus.
-- For example if the focus was (Either e a)

newtype Predicate a = Predicate { fromPredicate :: a -> Bool }
predicate :: Lens (Predicate a) (Predicate b) (a -> Bool) (b -> Bool)
predicate = lens getter setter
 where
  getter = fromPredicate
  setter _ = Predicate

{- Section 2 -}
question21 :: String
question21 = view (_2 . _1 . _2) ("Ginerva", (("Galileo", "Waldo"), "Malfoy"))

{- Question 2 1
    mysteryDomino :: Lens' Eight Two
-}

-- question23 :: Lens Platypus BabySloth Armadillo Hedgehog
