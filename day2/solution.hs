
findCoordinates:: [String] -> (Integer,Integer)
findCoordinates instr 
              |dirn=="forward"= (0,read steps)
              |dirn=="down"=(read steps,0)
              |dirn=="up"=((negate(read steps)),0)
              |otherwise = (0,0)
              where dirn:steps:[]=instr

aimCalc:: (Integer,Integer,Integer)->(Integer,Integer)->(Integer,Integer,Integer)
aimCalc (aim,depth,pos) (ud,forward)= (aim +ud,depth+(aim*forward),pos+forward)

main::IO ()
main = do 
     contents <- readFile "input.txt" 
     let instrs= lines contents
     let worded= map words instrs
     let parsed = map findCoordinates worded
     let soln= foldl1 (\(a,b) (c,d)->(a+c,b+d)) parsed
     putStr "#1 Solution = " 
     putStrLn (show ( (fst soln) *(snd soln)))
     putStr "#2 Solution = "
     putStrLn (show ((\(a,b,c)->b*c)( foldl  aimCalc (0,0,0) parsed )))
