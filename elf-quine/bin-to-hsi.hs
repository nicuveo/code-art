import qualified Data.ByteString  as BS
import           Data.Char
import           Data.List
import           Data.List.Split
import           Data.Maybe
import           Data.Traversable
import           Data.Word        (Word8)
import qualified Graphics.Image   as I
import           Safe
import           Text.Printf

main = do
  s <- BS.unpack <$> BS.readFile "elf-quine"

  -- print to the console
  for (chunksOf 16 s) $ \line -> do
    let text = take 16 $ line ++ repeat 0
    putStrLn $ intercalate " " $ printf "%3d" <$> text

  -- make base 16x10 image
  let value (r,c) = atMay s $ r*16 + c
      img = I.makeImageR I.VU (10,16) $ \x -> case value x of
        Just v  -> I.toPixelRGB $ I.PixelHSI v (50 + v) 250
        Nothing -> I.PixelRGB 0 0 0
  I.writeImage "elf-quine-base.png" img
