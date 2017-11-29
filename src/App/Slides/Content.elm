module Slides.Content exposing (content)

import Element exposing (..)
import Element.Attributes exposing (..)
import List exposing (singleton)
import Slides.Samples
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

      This is fairly opinionated,
      feel free to disagree and comment.

      Even if there's only a single thing
      you agree with, then I'm already happy.
      """
        |> regularText

    --
    --
    , """
      So you probably know what React is,
      but what about Elm?

      Elm is a functional language
      that compiles to javascript.

      Mostly used for client-side
      applications, just like React.
      """
        |> regularText

    --
    --
    , """
      How would I setup a simple app
      with nice valid code?

      <React>
      Babel + ESLint
      Webpack + PostCSS
      Redux

      [Elm]
      two or three small libraries
      for HTML & CSS
      """
        |> regularText

    --
    --
    , """
      -----------
      -- React --
      -----------

      brew install nodejs

      npm install react react-dom react-redux redux lodash
      npm install babel eslint eslint-config-metalab
      npm install postcss webpack webpack-dev-server
      npm install loader-a loader-b loader-c
      ...

      ---------
      -- Elm --
      ---------

      brew install elm
      brew install devd
      brew install watchexec

      {- Pick one you like -}
      elm package install rtfeldman/elm-css
      elm package install mdgriffith/style-elements

      {- Maybe, if you want external CSS -}
      npm install ...
      """
        |> elmCode defaultCodeOptions

    --
    --
    , """
      Elm has less to setup
      and less to configure
      """
        |> bigText

    --
    --
    , """
      What would a super simple app look like?
      """
        |> regularText

    --
    --
    , javascriptCode { leadingSpaces = 4 } Slides.Samples.react

    --
    --
    , elmCode { leadingSpaces = 4 } Slides.Samples.elm

    --
    --
    , row
        Zed
        [ clip, spacing (scaled 16) ]
        [ -- React
          Slides.Samples.reactSideBySide
            |> javascriptCode { leadingSpaces = 4 }
            |> el Zed [ xScrollbar, clipY, width (percent 50) ]

        -- Elm
        , Slides.Samples.elmSideBySide
            |> elmCode { leadingSpaces = 4 }
            |> el Zed [ xScrollbar, clipY, width (percent 50) ]
        ]

    --
    --
    , """
      Elm is easier
      to think about?
      """
        |> bigText

    --
    --
    , column
        Zed
        []
        [ --
          """
          <!DOCTYPE html>
          <html>
          <head>
            <meta charset="utf-8">
            <title>Elm app</title>
          </head>
          <body>
            <div id="elm-app-container"></div>
            <script src="compiled-elm-code.js"></script>
            <script>
          """
            |> xmlCode defaultCodeOptions

        --
        , """
            // Start Elm application and render the output into this node
            var containerNode = document.body.querySelector("#elm-app-container");
            var app = Elm.App.embed(containerNode);
          """
            |> javascriptCode defaultCodeOptions

        --
        , """
            </script>
          </body>
          </html>
          """
            |> xmlCode defaultCodeOptions
        ]

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
      -- MISSING PATTERNS ---------------------------------------- ./src/App/State.elm

      This `case` does not have branches for all possibilities.

      46|>    case msg of
      47|>        -----------------------------------
      48|>        -- Other
      49|>        -----------------------------------
      50|>        NoOp ->
      51|>            (!) model []

      You need to account for the following values:

          Types.GoToNextSlide
          Types.GoToPreviousSlide

      Add branches to cover each of these patterns!

      If you are seeing this error for the first time, check out these hints:
      <https://github.com/elm-lang/elm-compiler/blob/0.18.0/hints/missing-patterns.md>
      The recommendations about wildcard patterns and `Debug.crash` are important!

      Detected errors in 1 module.
      """
        |> nonHighlightedCode defaultCodeOptions

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
      and might need new tests.

      [Elm]
      Continue until the compiler
      stops complaining and your
      application will work.
      """
        |> regularText

    --
    --
    , """
      Some quotes:

      > Refactoring in @elmlang gives me the freedom and confidence to make changes like I wouldn't dare in JavaScript. And it always works out!
      @meb_michael

      > OMG. I'm in love all over again. I thought functional languages were supposed to make users prove their worthiness, not help them.
      @marick

      > my fav thing about #elmlang is how i can get pulled away in the middle of a refactor and come back hours later and get right back to work
      @emmatcu
      """
        |> regularText

    --
    --
    , """
      Refactoring should be easy,
      cuz we need to do it a lot.
      """
        |> bigText

    --
    --
    , """
      How do I go about optimizing my code?
      (ie. Please don't re-render every time)

      <React>
      shouldComponentUpdate
      PureComponent
      memoized selectors (reselect)

      [Elm]
      Html.Keyed for lists
      Html.Lazy for single values

      Very similar, except that
      keyed lists are used by
      default in React (because of JSX).
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
      - Pattern matching

      Bad:
      - No native string interpolation
      (you need to use a function)
      - No server-side rendering
      (soon though, next version)
      """
        |> regularText

    --
    --
    , """
      The End
      """
        |> bigText
    ]



-- ⚗️


inTheMiddle : Element Styles Variations Msg -> Element Styles Variations Msg
inTheMiddle =
    section Zed [ center, verticalCenter ]



-- ⚗️ / Text


bigText : String -> Element Styles Variations Msg
bigText text =
    text
        |> properText
        |> h2 H2 [ vary Colored True ]
        |> inTheMiddle


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


type alias CodeOptions =
    { leadingSpaces : Int }


code : SyntaxHighlight.HCode -> Element Styles Variations Msg
code hcode =
    hcode
        |> SyntaxHighlight.toBlockHtml Nothing
        |> Element.html
        |> section Code
            [ height fill
            , paddingBottom (scaled 4)
            , paddingTop (scaled 4)
            , width fill
            ]


defaultCodeOptions : CodeOptions
defaultCodeOptions =
    { leadingSpaces = 6 }


trimCode : CodeOptions -> String -> String
trimCode options string =
    string
        |> String.lines
        |> List.drop 1
        |> List.map (String.dropLeft options.leadingSpaces)
        |> String.join "\n"



-- / Code kinds, Pt. 1


highlightedCode :
    (String -> Result parserError SyntaxHighlight.HCode)
    -> CodeOptions
    -> String
    -> Element Styles Variations Msg
highlightedCode highlighter options string =
    string
        |> trimCode options
        |> highlighter
        |> Result.map code
        |> Result.withDefault Element.empty


nonHighlightedCode : CodeOptions -> String -> Element Styles Variations Msg
nonHighlightedCode options string =
    string
        |> trimCode options
        |> text
        |> section Code
            [ height fill
            , paddingBottom (scaled 4)
            , paddingTop (scaled 4)
            , width fill
            ]



-- ⚗️ / Code kinds, Pt. 2


elmCode : CodeOptions -> String -> Element Styles Variations Msg
elmCode =
    highlightedCode SyntaxHighlight.elm


javascriptCode : CodeOptions -> String -> Element Styles Variations Msg
javascriptCode =
    highlightedCode SyntaxHighlight.javascript


xmlCode : CodeOptions -> String -> Element Styles Variations Msg
xmlCode =
    highlightedCode SyntaxHighlight.xml
