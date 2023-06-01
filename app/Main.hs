module Main(main) where

import System.Environment (getArgs)
import Lib

main :: IO ()
main = do
  args <- getArgs
  case args of
    [path, n] -> splitCSV path (read n)
    _ -> putStrLn "Usage: csv-splitter <file> <n>"
