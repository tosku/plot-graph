module Test.PlotAdjacencyListGraph where

import Data.Bifunctor
import Data.List

import TestHS

import qualified Data.Graph.AdjacencyList as AGR

import PlotAdjacencyListGraph

ioTests :: [IO Test]
ioTests = [ testplot1
          , testplot2
          ]


graphTest1 = 
  let vs = [1..7]
      neis = (\v -> let nei 1 = [2,5,6]
                        nei 2 = [5,3]
                        nei 3 = [4]
                        nei 4 = []
                        nei 5 = [4,7]
                        nei 6 = [7]
                        nei 7 = [4]
                     in nei v
             )
   in AGR.createGraph vs neis

-- | Test graph
testgraph = 
  let vs = [1..8]
      neis = (\v -> let nei 1 = [2,5,6]
                        nei 2 = [3,5]
                        nei 3 = [4,6]
                        nei 4 = [7]
                        nei 5 = [4,7]
                        nei 6 = [8,7]
                        nei 7 = []
                        nei 8 = [7]
                     in nei v
             )
   in AGR.createGraph vs neis
  
testplot1 :: IO Test
testplot1 = do
  let name = "plotting test graph 1"
      fn = "testgraph1"
  out <- plotGraph testgraph fn
  return $ case out == (fn <> ".png") of
              True -> testPassed name "successfuly created testgraph1.png!"
              False -> testFailed name $ (,) (fn) (show out)

testplot2 :: IO Test
testplot2 = do
  let name = "plotting test graph 2"
      fn = "testgraph2"
  out <- plotGraph graphTest1 fn
  return $ case out == (fn <> ".png") of
              True -> testPassed name "successfuly created testgraph2.png!"
              False -> testFailed name $ (,) (fn) (show out)
