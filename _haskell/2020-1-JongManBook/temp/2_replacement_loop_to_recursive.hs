
import Control.Monad

pick :: Int -> [Int] -> Int -> IO ()
pick _ picked 0 = print $ picked
pick n picked toPick = forM_ [smallest..n] $ \next -> pick n (picked ++ [next]) (toPick-1) 

    where
        smallest = case picked of 
                     [] -> 0
                     otherwise -> (last picked) + 1
                   

main :: IO ()
main = pick n [] toPick
    where
        n = 5
        toPick = 3

