module Chapter3 where

import           Control.Lens

{-
  Question 1:
  Structure is (Bool, (Int, String))
  Focus is (Int)

  The lens is (_2 . _1)
-}

question2 :: Lens' (Char, Int) Char
question2 = _1

{-
  Question 3:
  * view - ^.
  * set - .~
  * over - %~ 
-}

question4 :: Char
question4 = view _3 ('a', 'b', 'c')

question4' :: Char
question4' = ('a', 'b', 'c') ^. _3

over5 :: Lens' (Bool, Int) Int -> (Int -> Int) -> (Bool, Int) -> (Bool, Int)
over5 = over


-- Records Part One 

{-
  Question 1: Structure is s and focus is f
  Question 2:
    * getter: (s -> f)
    * setter: (s -> f -> s)
-}

data Ship = Ship
  { _name :: String
  , _numCrew :: Int
  } deriving Show

makeLenses ''Ship
-- Question 3:
--name :: Lens' Ship String
--name = lens getter setter
 --where
  --getter = _name
  --setter ship newName = ship { _name = newName }

--numCrew :: Lens' Ship Int
--numCrew = lens getter setter
 --where
  --getter = _numCrew
  --setter ship newNumCrew = ship { _numCrew = newNumCrew }

purplePearl :: Ship
purplePearl = Ship { _name = "Purple Pearl", _numCrew = 38 }

{-
  Records part two questions

  Question 1:
  * wand :: Lens' Inventory Wand
  * book :: Lens' Inventory Book
  * potions :: Lens' Inventory [Potion]

  Question 2:
  * gazork :: Lens' Chumle Spuzz

  Question 3:
  * makeLenses ''Pet needs to be moved above getPetName
-}

data Pet = Pet
  { _petName :: String
  , _petType :: String
  }
makeLenses ''Pet

getPetName :: Pet -> String
getPetName = view petName

{-
  A virtual field is really just a lense.
-}


newtype Celsius = Celsius Float deriving Show
newtype Fahrenheit = Fahrenheit Float deriving Show

data Temperature = Temperature
  { _location :: String
  , _celsius :: Celsius
  } deriving Show

makeLenses ''Temperature

temp :: Temperature
temp = Temperature "Berlin" (Celsius 7.0)

fahrenheit :: Lens' Temperature Fahrenheit
fahrenheit = lens getter setter
 where
  getter = celsiusToFahrenheit . view celsius
  setter temp f = set celsius (fahrenheitToCelsius f) temp
  celsiusToFahrenheit (Celsius c) = Fahrenheit $ (c * (9 / 5)) + 32
  fahrenheitToCelsius (Fahrenheit f) = Celsius $ (f - 32) * (5 / 9)

data User = User
  { _firstName :: String
  , _lastName :: String
  , _userName :: String
  , _email :: String
  } deriving Show
makeLenses ''User

fullName :: Lens' User String
fullName = lens getter setter
 where
  getter user = user ^. firstName <> " " <> user ^. lastName
  setter user newFullName = case words newFullName of
    []             -> user { _firstName = "", _lastName = "" }
    [newFirstName] -> user { _firstName = newFirstName, _lastName = "" }
    (newFirstName : restOfName) ->
      user { _firstName = newFirstName, _lastName = unwords restOfName }
