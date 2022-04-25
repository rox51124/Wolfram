--
-- EPITECH PROJECT, 2022
-- B-FUN-400-TLS-4-1-wolfram-roxane.baert
-- File description:
-- Main
--

module Main where

import Lib
import System.Environment
import System.Exit

main :: IO ()
main = do
        args <- getArgs
        case getOpts defaultConf args of
            Nothing  -> exitWith (ExitFailure 84)
            Just a -> loop a (createStr a) 1 1