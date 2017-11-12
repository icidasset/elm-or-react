module Slides.Content exposing (content)

import Element exposing (..)
import Element.Attributes exposing (..)
import List exposing (singleton)
import Styles exposing (..)
import SyntaxHighlight
import Types exposing (Msg)
import Variables exposing (scaled)


-- 🍯


content : List (Element Styles Variations Msg)
content =
    [ """
      Comparing Elm
      with React
      """
        |> bigText

    --
    --
    , """
      From project setup
      until maintenance
      """
        |> bigText

    --
    --
    , """
      Disclaimer:

      These are my opinions,
      feel free to disagree and comment.

      Even if there's only a single thing
      you agree with, then I'm already happy.
      """
        |> regularText

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
        |> regularText

    --
    --
    , """
      # React
      # =====

      brew install nodejs

      npm install react react-dom lodash
      npm install babel eslint eslint-config-metalab
      npm install postcss webpack webpack-dev-server
      npm install loader-a loader-b loader-c ...

      # Elm
      # ===

      brew install elm
      brew install devd
      brew install watchexec

      # Pick one
      elm package install rtfeldman/elm-css
      elm package install mdgriffith/style-elements
      """
        |> elmCode

    --
    --
    , """
      Elm is easier
      to setup and has
      less to configure
      """
        |> bigText

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
        |> regularText

    --
    --
    , """
      Better predictability
      is a good thing
      """
        |> bigText

    --
    --
    , """
      What about refactoring,
      how easily can I change something?

      <React>
      With difficulty,
      you will definitely miss something
      and probably need new tests.

      [Elm]
      Continue until the compiler
      stops complaining and your
      application will work.
      """
        |> regularText

    --
    --
    , """
      Obviously you prefer Elm,
      so tell me the good and the bad.

      Good:
      - Immutability
      - Pure functions (no side effects)
      - Types (Maybe type instead of undefined/null)

      Bad:
      - No server-side rendering
      (soon though, next version)
      """
        |> regularText

    -- TODO:
    -- Refactoring
    -- https://twitter.com/meb_michael/status/903445435594940416
    -- https://twitter.com/emmatcu/status/891141325814341632
    -- https://twitter.com/billperegoy/status/803366811219664896
    -- https://twitter.com/availle/status/821783943217344517
    -- https://twitter.com/marick/status/804090726640472064
    --
    -- Optimizing for performance
    -- Elm -> Html.lazy & keyed
    -- React -> ShouldComponentUpdate
    ]



-- ⚗️


bigText : String -> Element Styles Variations Msg
bigText text =
    text
        |> properText
        |> h2 H2 [ vary Colored True ]
        |> inTheMiddle


inTheMiddle : Element Styles Variations Msg -> Element Styles Variations Msg
inTheMiddle =
    section Zed [ center, verticalCenter ]


properText : String -> Element Styles Variations Msg
properText string =
    string
        |> String.lines
        |> List.drop 1
        |> List.map String.trim
        |> List.map Element.text
        |> List.map List.singleton
        |> List.map ((::) (Element.node "br" <| text ""))
        |> List.map List.reverse
        |> List.concat
        |> Element.paragraph Zed []


regularText : String -> Element Styles Variations Msg
regularText text =
    text
        |> properText
        |> h3 H3 []
        |> inTheMiddle



-- ⚗️ / Code


code : SyntaxHighlight.HCode -> Element Styles Variations Msg
code hcode =
    hcode
        |> SyntaxHighlight.toBlockHtml Nothing
        |> Element.html
        |> inTheMiddle
        |> section Code [ height fill, padding (scaled 2), width fill ]


trimCode : String -> String
trimCode string =
    string
        |> String.lines
        |> List.drop 1
        |> List.map String.trim
        |> String.join "\n"



-- ⚗️ / Code kinds


elmCode : String -> Element Styles Variations Msg
elmCode string =
    string
        |> trimCode
        |> SyntaxHighlight.elm
        |> Result.map code
        |> Result.withDefault Element.empty


javascriptCode : String -> Element Styles Variations Msg
javascriptCode string =
    string
        |> trimCode
        |> SyntaxHighlight.javascript
        |> Result.map code
        |> Result.withDefault Element.empty
