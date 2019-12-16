module Chapter5 where

import           Control.Lens
import           Data.Char                      ( toUpper )

data Gate = Gate
  { _open :: Bool
  , _oilTemp :: Float
  } deriving Show
makeLenses ''Gate

data Army = Army
  { _archers :: Int
  , _knights :: Int
  } deriving Show
makeLenses ''Army


data Kingdom = Kingdom
    { _name :: String
    , _army :: Army
    , _gate :: Gate
    } deriving Show
makeLenses ''Kingdom

duloc :: Kingdom
duloc = Kingdom { _name = "Duloc"
                , _army = Army { _archers = 22, _knights = 14 }
                , _gate = Gate { _open = True, _oilTemp = 10.0 }
                }

question1GoalA :: Kingdom
question1GoalA = duloc
  & over name (<> ": a perfect place")
  & set (army . knights) 42
  & set (gate . open) False

question1GoalB :: Kingdom
question1GoalB = duloc
  & over name (<> "instein")
  & set army (Army 17 26)
  & set (gate . oilTemp) 100.0

question1GoalC :: (String, Kingdom)
question1GoalC = duloc 
  & name <<>~ ": Home" 
  & over _2 (over name (<> " of the talking Donkeys") . set (gate . oilTemp) 5.0)

question1GoalC' :: (String, Kingdom)
question1GoalC' = duloc 
  & name <<>~ ": Home" 
  & _2 . name <>~ " of the talking Donkeys"
  & _2 . gate . oilTemp .~ 5.0

question2A :: (Bool, String)
question2A = (False, "opossums") & _1 ||~ True

question2B :: Int
question2B = 2 & id *~ 3

question3B :: ((Bool, String), Float)
question3B = ((True, "Dudley"), 55.0)
  & _1 . _2 <>~ " - the worst"
  & _2 -~ 15
  & _2 //~ 2
  & _1 . _2 %~ map toUpper
  & _1 . _1 .~ False

{- Question 3: (^.) takes only two arguments -}

{- Question 4: (%~) :: Lens s t a b -> (a -> b) -> s -> t -}
