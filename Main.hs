module Main where

import System.Environment

import Kaguya
import Parser
import Eval

entry :: [String] -> Term
entry args = Compound "main" $ map (\s -> Compound s []) args

main :: IO ()
main = do
  args <- getArgs
  text <- getContents
  case parse "" text of
    Left  e  -> print e
    Right cs -> print $ length (resolve cs (entry args)) /= 0
