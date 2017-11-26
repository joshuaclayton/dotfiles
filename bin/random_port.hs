#!/usr/bin/env stack
-- stack --install-ghc runghc --package text --package megaparsec --package containers --package mtl

import           Control.Monad (void, (<=<))
import           Control.Monad.IO.Class (liftIO)
import           Control.Monad.Reader (ReaderT, runReaderT, ask)
import           Data.List ((\\), nub, sort)
import           Data.Monoid ((<>))
import           Data.Text (Text)
import qualified Data.Text as T
import qualified System.Random as R
import           Text.Megaparsec
import qualified Text.Megaparsec.Lexer as L
import           Text.Megaparsec.Text

newtype User = User String deriving Show
data IPType = IPv4 | IPv6 deriving Show
data NodeType = TCP deriving Show

allAvailablePorts :: [Integer]
allAvailablePorts = [1024..65535]

data OpenFile = OpenFile
    { ofCommand :: String
    , ofPid :: Integer
    , ofUser :: User
    , ofFD :: String
    , ofType :: IPType
    , ofDevice :: String
    , ofSize :: String
    , ofNode :: NodeType
    , ofHost :: String
    , ofPort :: Integer
    } deriving Show

type WithGenerator = ReaderT R.StdGen IO

main :: IO ()
main = do
    g <- R.getStdGen
    either printError (flip runReaderT g . run) . parseInput . T.pack =<< getContents

printError :: ParseError -> IO ()
printError e = do
    putStrLn "There was a problem parsing the input:\n"
    print e

run :: [OpenFile] -> WithGenerator ()
run = print' <=< selectRandomAvailable . sort . nub . map ofPort
  where
    print' = liftIO . print

selectRandomAvailable :: [Integer] -> WithGenerator Integer
selectRandomAvailable portsInUse = do
    g <- ask
    return $ availablePorts !! randomIndex g
  where
    availablePorts = allAvailablePorts \\ portsInUse
    randomIndex g = fst $ R.randomR (0, length availablePorts - 1) g

parseInput :: Text -> Either ParseError [OpenFile]
parseInput = runParser (openFilesParser <* eof) "" . T.strip

openFilesParser :: Parser [OpenFile]
openFilesParser = headerParser *> openFileParser `sepBy1` newline

toEolParser :: Parser String
toEolParser = some (noneOf "\n")

headerParser :: Parser ()
headerParser = string "COMMAND" *> space *> string "PID" *> toEolParser *> newline *> return ()

openFileParser :: Parser OpenFile
openFileParser =
    OpenFile
    <$> withSpace commandParser
    <*> withSpace pidParser
    <*> withSpace userParser
    <*> withSpace fdParser
    <*> withSpace typeParser
    <*> withSpace deviceParser
    <*> withSpace sizeParser
    <*> withSpace nodeParser
    <*> (hostParser <* string ":")
    <*> (portParser <* toEolParser)
  where
    commandParser = someTill asciiChar spaceChar
    pidParser = L.integer
    userParser = User <$> many alphaNumChar
    fdParser = textParser
    typeParser = (string "IPv4" *> return IPv4) <|> (string "IPv6" *> return IPv6)
    deviceParser = string "0x" <<>> many hexDigitChar
    sizeParser = textParser
    nodeParser = string "TCP" *> pure TCP
    hostParser = anyHostParser <|> localhostParser
      where
        anyHostParser = string "*"
        localhostParser = string "[::1]" <|> string "127.0.0.1" <|> string "localhost"
    portParser = L.integer

textParser :: Parser String
textParser = many alphaNumChar

withSpace :: Parser a -> Parser a
withSpace p = p <* space

(<<>>) :: (Applicative f,Monoid a) => f a -> f a -> f a
(<<>>) a b = (<>) <$> a <*> b

infixl 6 <<>>
