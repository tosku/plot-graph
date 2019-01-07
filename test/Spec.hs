import qualified TestHS as T
import Test.PlotAdjacencyListGraph as P

main :: IO ()
main = do
  putStrLn "\n"
  putStrLn $ "Test Begins"
  T.reportTestsIO $ 
    P.ioTests 
