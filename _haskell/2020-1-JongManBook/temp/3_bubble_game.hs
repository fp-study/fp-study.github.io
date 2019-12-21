
board = [
            "URLPM"
        ,   "XPRET"
        ,   "GIAET"
        ,   "XTNZY"
        ,   "XOQRS"
        ]


hasWord :: Int -> Int -> String -> Bool
hasWord y x word 
  | outOfRange y x                      = False
  | board!!y!!x /= head word            = False
  | length word == 1                    = True
  | search $ \(dx, dy) -> 
      hasWord (y+dy) (x+dx) (tail word) = True
  | otherwise                           = False

    where
        outOfRange y x = not $ 0 <= x && x < 5 && 0 <= y && y < 5
        search = (elem True) . (flip map $ zip dxs dys) 
        dxs = [-1, -1, -1, 1, 1, 1, 0, 0]
        dys = [-1,  0,  1,-1, 0, 1,-1, 1]


main :: IO ()
main = print $ hasWord 0 0 "URPAZRSYTTM"
