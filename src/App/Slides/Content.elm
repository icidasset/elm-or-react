module Slides.Content exposing (content)

import Element exposing (..)
import Element.Attributes exposing (..)
import List exposing (singleton)
import Styles exposing (..)
import Types exposing (Msg)


-- 🍯


content : List (Element Styles Variations Msg)
content =
    [ """
      Comparing Elm
      with React
      """
        |> properText
        |> h2 H2 [ vary Colored True ]

    --
    --
    , """
      From project setup
      until maintenance
      """
        |> properText
        |> h2 H2 [ vary Colored True ]

    --
    --
    , """
      Disclaimer:

      These are my opinions,
      feel free to disagree and comment.

      Even if there's only a single thing
      you agree with, then I'm already happy.
      """
        |> properText
        |> h3 H3 []

    --
    --
    , """
      React
      ~> Babel + ESLint + Webpack

      Elm
      ~> Nothing
      """
        |> properText
        |> h3 H3 []
    ]


properText : String -> Element Styles Variations Msg
properText string =
    string
        |> String.lines
        |> List.map String.trim
        |> List.map Element.text
        |> List.map List.singleton
        |> List.map ((::) (Element.node "br" <| text ""))
        |> List.map List.reverse
        |> List.concat
        |> Element.paragraph Zed []
