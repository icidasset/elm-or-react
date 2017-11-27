module Slides.Numbers exposing (..)

import Slides.Content


-- 👈


previous : Int -> Int
previous currentNumber =
    -- Go to the end if we reached the beginning
    if currentNumber - 1 < 1 then
        currentNumber
    else
        currentNumber - 1


prev : Int -> Int
prev =
    previous



-- 👉


next : Int -> Int
next currentNumber =
    -- Go back to the beginning if we reached the end
    if currentNumber + 1 > List.length Slides.Content.content then
        currentNumber
    else
        currentNumber + 1
