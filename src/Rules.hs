--
-- EPITECH PROJECT, 2022
-- B-FUN-400-TLS-4-1-wolfram-roxane.baert
-- File description:
-- Rules
--

module Rules (rule30, rule90, rule110) where

rule30 :: String -> String
rule30 [_, _] = ""
rule30 "" = ""
rule30 ('*':' ':' ':xs) = '*':rule30(' ':' ':xs)
rule30 (' ':'*':'*':xs) = '*':rule30('*':'*':xs)
rule30 (' ':'*':' ':xs) = '*':rule30('*':' ':xs)
rule30 (' ':' ':'*':xs) = '*':rule30(' ':'*':xs)
rule30 (x:y:z:xs) = ' ':rule30(y:z:xs)
rule30 [_] = ""

rule90 :: String -> String
rule90 [_, _] = ""
rule90 "" = ""
rule90 ('*':'*':' ':xs) = '*':rule90('*':' ':xs)
rule90 ('*':' ':' ':xs) = '*':rule90(' ':' ':xs)
rule90 (' ':'*':'*':xs) = '*':rule90('*':'*':xs)
rule90 (' ':' ':'*':xs) = '*':rule90(' ':'*':xs)
rule90 (x:y:z:xs) = ' ':rule90(y:z:xs)
rule90 [_] = ""

rule110 :: String -> String
rule110 [_, _] = ""
rule110 "" = ""
rule110 ('*':'*':' ':xs) = '*':rule110('*':' ':xs)
rule110 ('*':' ':'*':xs) = '*':rule110(' ':'*':xs)
rule110 (' ':'*':'*':xs) = '*':rule110('*':'*':xs)
rule110 (' ':'*':' ':xs) = '*':rule110('*':' ':xs)
rule110 (' ':' ':'*':xs) = '*':rule110(' ':'*':xs)
rule110 (x:y:z:xs) = ' ':rule110(y:z:xs)
rule110 [_] = ""