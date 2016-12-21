#!/usr/bin/env stack
-- stack --install-ghc runghc --package text --package megaparsec --package containers --package aeson

import           Control.Monad (void)
import           Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as Char8
import           Data.Map (Map)
import qualified Data.Map as M
import           Data.Text (Text)
import qualified Data.Text as T
import qualified Debug.Trace as T
import           Text.Megaparsec
import qualified Text.Megaparsec.Lexer as L
import           Text.Megaparsec.Text

type BatteryResult = Map Text Val
type KeyValuePair = (Text, Val)

data Val
    = VText Text
    | VBool Bool
    | VMap (Map Text Val)
    | VInteger Integer
    | VList [Val]
    | VUnknown Text

instance ToJSON Val where
    toJSON (VText t) = toJSON t
    toJSON (VBool v) = toJSON v
    toJSON (VMap v) = toJSON v
    toJSON (VInteger i) = toJSON i
    toJSON (VList xs) = toJSON xs
    toJSON (VUnknown t) = toJSON t

main :: IO ()
main = either (printError . show) run . parseInput . T.pack =<< getContents

printError :: String -> IO ()
printError e = do
    putStrLn "There was a problem parsing the input:\n"
    putStrLn e

run :: ToJSON a => a -> IO ()
run = putStrLn . Char8.unpack . encode

parseInput :: Text -> Either ParseError BatteryResult
parseInput = runParser (batteryResultParser <* eof) "" . T.strip

batteryResultParser :: Parser BatteryResult
batteryResultParser = do
    string "+-o" *> someTill anyChar newline
    results <- withinBrackets $ some (string "      " *> keyValuePairParser <* newline)

    return $ M.fromList results

withinBrackets :: Parser a -> Parser a
withinBrackets = between (string "    {" *> newline) (string "    }")

keyValuePairParser :: Parser KeyValuePair
keyValuePairParser = (,) <$> keyFromAssignmentParser <*> valueParser
  where
    keyFromAssignmentParser = stringParser <* assignmentParser

valueParser :: Parser Val
valueParser = try vIntParser
    <|> try vBoolParser
    <|> try vTextParser
    <|> try vMapParser
    <|> try vListParser
    <|> vUnknownParser

vTextParser :: Parser Val
vTextParser = VText <$> stringParser

vIntParser :: Parser Val
vIntParser = VInteger <$> L.integer

vBoolParser :: Parser Val
vBoolParser = yesParser <|> noParser
  where
    yesParser = string "Yes" *> return (VBool True)
    noParser = string "No" *> return (VBool False)

vMapParser :: Parser Val
vMapParser = (VMap . M.fromList) <$> brackets (keyValuePairParser `sepBy1` char ',')

vListParser :: Parser Val
vListParser = VList <$> parens (valueParser `sepBy1` char ',')

vUnknownParser :: Parser Val
vUnknownParser = (VUnknown . T.pack) <$> some (noneOf "\n")

assignmentParser :: Parser ()
assignmentParser = void $ space <* string "=" <* space

stringParser :: Parser Text
stringParser = T.pack <$> between (symbol "\"") (symbol "\"") (some $ noneOf "\"")

symbol :: String -> Parser String
symbol = L.symbol sc

brackets :: Parser a -> Parser a
brackets = between (symbol "{") (symbol "}")

parens :: Parser a -> Parser a
parens = between (symbol "(") (symbol ")")

sc :: Parser () -- space consumer
sc = L.space (void $ char ' ') lineComment blockComment
  where lineComment  = L.skipLineComment "//"
        blockComment = L.skipBlockComment "/*" "*/"
