import Control.Monad
import System.IO

countIncrements::[Integer]->Integer
countIncrements nums= sum [ if y>x then 1 else 0 | (x,y)<- zip nums (tail nums)]

makeSliding:: [Integer] -> [Integer]
makeSliding nums =[x+y+z | (x,y,z)<- zip3 nums (tail nums) (tail $ tail nums)]

main::IO ()
main = do 
     contents <- readFile "input.txt" 
     let nums= read <$> lines contents
     print $ countIncrements  nums
     print $ countIncrements $ makeSliding nums
