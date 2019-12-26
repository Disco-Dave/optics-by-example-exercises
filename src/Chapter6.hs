module Chapter6 where

import           Control.Lens

import           Data.Set                       ( Set )
import qualified Data.Set                      as Set

data Role
  = Gunner
  | PowderMonkey
  | Navigator
  | Captain
  | FirstMate
  deriving (Show, Eq, Ord)

data CrewMember = CrewMember
  { _name :: String
  , _role :: Role
  , _talents :: [String]
  } deriving (Show, Ord, Eq)
makeLenses ''CrewMember

roster :: Set CrewMember
roster = Set.fromList
  [ CrewMember "Grumpy Roger"     Gunner       ["Juggling", "Arbitrage"]
  , CrewMember "Long-John Bronze" PowderMonkey ["Origami"]
  , CrewMember "Salty Steve"      PowderMonkey ["Charcuterie"]
  , CrewMember "One-eyed Jack"    Navigator    []
  ]

beastSizes :: [(Int, String)]
beastSizes = [(3, "Sirens"), (882, "Kraken"), (92, "Ogopogo")]

quotes = [("Why", "So", "Serious?"), ("This", "is", "SPARTA")]

{- Question 1:
    a. Should be the same as before
    b. ["Sirens", "Kraken", "Ogopogo"]
    c. "SirensKrakenOgopogo"
    d. ["Sirens", "Kraken", "Ogopogo"]
    e. [1,2,3,4,5,6]
    g. "CaptainFirst Mate"
    f. "HelloIt's me"
    g. ["Why", "So", "Serious?"]
    h. 
-}

