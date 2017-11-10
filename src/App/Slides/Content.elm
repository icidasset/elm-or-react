module Slides.Content exposing (content)

import Element exposing (..)
import Element.Attributes exposing (..)
import List exposing (singleton)
import Styles exposing (..)
import SyntaxHighlight
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
      What if I want a working app,
      but also nice valid code?

      <React>
      Babel + ESLint
      Webpack + PostCSS

      [Elm]
      One or two small libraries
      for HTML & CSS
      """
        |> properText
        |> h3 H3 []

    --
    --
    , """
      What if I wanted to focus more on
      the problem I'm trying to solve?

      - Immutability
      - Pure functions
      - Types (Maybe type)

      <React>
      ?

      [Elm]
      Built-in
      """
        |> properText
        |> h3 H3 []

    --
    --
    , """
      What if I made an important typo,
      when would I usually find out about it?

      <React>
      During runtime

      [Elm]
      During compile time
      """
        |> properText
        |> h3 H3 []

    -- TODO:
    -- Refactoring
    -- https://twitter.com/meb_michael/status/903445435594940416
    -- https://twitter.com/emmatcu/status/891141325814341632
    -- https://twitter.com/billperegoy/status/803366811219664896
    --
    -- https://twitter.com/availle/status/821783943217344517
    --
    -- https://twitter.com/marick/status/804090726640472064
    --
    -- Optimizing for performance
    -- Elm -> Html.lazy & keyed
    -- React -> ShouldComponentUpdate
    ]



-- ⚗️


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



-- ⚗️ / Code


code : SyntaxHighlight.HCode -> Element Styles Variations Msg
code hcode =
    hcode
        |> SyntaxHighlight.toBlockHtml Nothing
        |> Element.html


elmCode : String -> Element Styles Variations Msg
elmCode string =
    string
        |> SyntaxHighlight.elm
        |> Result.map code
        |> Result.withDefault Element.empty
