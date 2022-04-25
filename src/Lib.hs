--
-- EPITECH PROJECT, 2022
-- B-FUN-400-TLS-4-1-wolfram-roxane.baert
-- File description:
-- Lib
--

module Lib where
import Text.Read
import Data.Bits (Bits(xor))
import Rules (rule30, rule90, rule110)
import Data.List

data Conf = Conf {rule :: Maybe Int, start :: Int, line :: Maybe Int,
    window :: Int, move :: Int} deriving (Show)

defaultConf :: Conf
defaultConf = Conf {rule = Nothing, start = 0, line = Nothing
    , window = 80, move = 0}

getOpts :: Conf -> [ String ] -> Maybe Conf
getOpts cnf ("--rule":b:c) = getOpts cnf {rule = readMaybe b} c

getOpts cnf ("--start":b:c) = case readMaybe b of
                                Nothing -> Nothing
                                Just a -> getOpts cnf {start = a} c

getOpts cnf ("--lines":b:c) = getOpts cnf {line = readMaybe b} c

getOpts cnf ("--window":b:c) = case readMaybe b of
                                Nothing -> Nothing
                                Just a -> getOpts cnf {window = a} c

getOpts cnf ("--move":b:c) = case readMaybe b of
                                Nothing -> Nothing
                                Just a -> getOpts cnf {move = a} c
getOpts cnf [] = Just cnf

getOpts _ _ = Nothing

createStr :: Conf -> String
createStr Conf{window=window, move=move} = concat [replicate
    (move + div window 2) ' ', "*", replicate (div window 2 - move) ' ']

displayStr :: String -> Int -> IO ()
displayStr string window = putStrLn
    (take window (drop (div (length string) 2 - div window 2) string))

loop :: Conf -> String -> Int -> Int -> IO ()
loop cnf@Conf{rule=Just 30, start=start, line=Just line, window=window}
    str go nb
    | go <= start = loop cnf ("  " ++ rule30 str ++ "  ") (go+1) nb
    | nb <= line = displayStr str window >> loop cnf
    ("  " ++ rule30 str ++ "  ") go (nb+1)
    | otherwise = return ()
loop cnf@Conf{rule=Just 90, start=start, line=Just line, window=window}
    str go nb
    | go <= start = loop cnf ("  " ++ rule90 str ++ "  ") (go+1) nb
    | nb <= line = displayStr str window >> loop cnf
    ("  " ++ rule90 str ++ "  ") go (nb+1)
    | otherwise = return ()
loop cnf@Conf{rule=Just 110, start=start, line=Just line, window=window}
    str go nb
    | go <= start = loop cnf ("  " ++ rule110 str ++ "  ") (go+1) nb
    | nb <= line = displayStr str window >> loop cnf
    ("  " ++ rule110 str ++ "  ") go (nb+1)
    | otherwise = return ()
loop cnf@Conf{rule=Just 30, start=start, line=Nothing , window=window}
    str go nb
    | go <= start = loop cnf ("  " ++ rule30 str ++ "  ") (go+1) nb
    | otherwise = displayStr str window >> loop cnf
    ("  " ++ rule30 str ++ "  ") go (nb+1)
loop cnf@Conf{rule=Just 90, start=start, line=Nothing , window=window}
    str go nb
    | go <= start = loop cnf ("  " ++ rule90 str ++ "  ") (go+1) nb
    | otherwise = displayStr str window >> loop cnf
    ("  " ++ rule90 str ++ "  ") go (nb+1)
loop cnf@Conf{rule=Just 110, start=start, line=Nothing , window=window}
    str go nb
    | go <= start = loop cnf ("  " ++ rule110 str ++ "  ") (go+1) nb
    | otherwise = displayStr str window >> loop cnf
    ("  " ++ rule110 str ++ "  ") go (nb+1)
loop cnf str _ _ = return ()