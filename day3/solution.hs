import Data.List
--getMatchImpl:: [[Integer]]->[Integer]->Int->[Integer]
getMatchImpl a  i
      | length a ==1 = head a
      | otherwise = getMatchImpl (filter (\x-> b == x!!i) a) (i+1)
      where _ = print b          
            b = if (sum ((transpose a)!!i))>=0 then 1 else 0

--getMatch:: [[Integer]] -> [Integer] ->[Integer]
getMatch a = getMatchImpl a 0



main:: IO ()
main = do
      content <- readFile "input.txt" 
      let entries = lines content
      let convLines = map (map (\a-> if a=='1' then 1 else -1) ) entries
      let mostCommonEnc= foldr1 (\a b ->[x+y| (x,y)<- zip a b]) convLines
      let mostCommon = map ( \a -> if a>0 then 1 else 0) mostCommonEnc
      let mostRare = map (1-) mostCommon
      let toBin x = foldl (\a b->a*2+b) 0 x
      let ans1= toBin mostCommon
      let ans2= toBin mostRare
     
      let mostCommon2 = map (\a -> if a>=0 then 1 else 0) mostCommonEnc
      let mostRare2= map (\a -> if a<0 then 1 else 0) mostCommonEnc

      print $ getMatch convLines


      print mostCommon2
      print ans1
      print mostCommon

      print mostRare2
      print ans2
      print mostRare

      print ("#1 solution = " ++ (show (ans1*ans2)))
       
      --print ("#2 solution = " ++ (show (oxyGenRate * co2ScrubRate)))
