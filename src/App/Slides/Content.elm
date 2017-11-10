module Slides.Content exposing (content)

import Element exposing (..)
import Element.Attributes exposing (..)
import List exposing (singleton)
import Styles exposing (..)
import Types exposing (Msg)


-- 🍯


content : List (Element Styles Variations Msg)
content =
    [ slide_1
    , slide_2
    ]



-- Slide 1


slide_1 : Element Styles Variations Msg
slide_1 =
    let
        items =
            [ text "From "
            , el Zed [] (text "project setup")
            , node "br" (text "")
            , text " until "
            , el Zed [] (text "maintenance")
            ]
    in
        items
            |> paragraph Zed []
            |> h2 H2 [ vary Colored True ]



-- Slide 2


slide_2 : Element Styles Variations Msg
slide_2 =
    "Slide 2"
        |> text
        |> singleton
        |> paragraph Zed []
