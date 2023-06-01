module Lib
  ( splitCSV,
  )
where

import Data.List.Split (chunksOf)

splitCSV :: FilePath -> Int -> IO ()
splitCSV path n = do
  contents <- readFile path
  let rows = lines contents
      chunks = chunksOf (length rows `div` n) rows
  mapM_ (\(index :: Int , chunk) -> writeFile (path ++ "_" ++ show index ++ ".csv") (unlines chunk)) (zip [1 ..] chunks)
