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

      This is fairly opionated,
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
        |> elmCode

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
    , """
      // React Component

      const App = connect(
        // copy all state into props:
        (state) => state,
        // add "event handlers" to props:
        actions
      )(
        (props) => {
          return <p onClick={props.changeGreeting}>{props.greeting}</p>;
        }
      );


      const actions = (dispatch) => {
        return {
          changeGreeting() {
            return dispatch({ type: "CHANGE_GREETING", greeting: "👩\x200D🔬" });
          }
        };
      };



      // State

      const initialState = {
        greeting: "👨\x200D🚀"
      };


      const reducer = (state = initialState, { greeting, type }) => {
        switch (type) {
          case "CHANGE_GREETING":     return { ...state, greeting };
          default:                    return state;
        }
      };



      // Join Forces

      render(
        <Provider store={createStore(reducer)}>
          <App />
        </Provider>,
        document.body
      );
      """
        |> javascriptCode

    --
    -- An Elm program will always have a structure
    -- that is roughly in this form:
    --
    , """
      -- Elm View

      view : Model -> Html Msg
      view model =
          Html.p
              [ onClick (ChangeGreeting "👩\x200D🔬") ]
              [ text model.greeting ]



      -- State

      type Model =
          { greeting : String }


      type Msg
          = ChangeGreeting String


      initialModel : Model
      initialModel =
          { greeting = "👨\x200D🚀" }


      update : Msg -> Model -> (Model, Cmd Msg)
      update msg model =
          case msg of
              ChangeGreeting greeting ->
                  (,) { model | greeting = greeting } Cmd.none



      -- Join Forces

      Html.program
          { init = (initialModel, Cmd.none)
          , view = view
          , update = update
          , subscriptions = \\_ -> Sub.none
          }
      """
        |> elmCode

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
            <script src="compiled-elm-code.js"></script>
            <script>
          """
            |> xmlCode

        --
        , """
            // Start Elm application and render the output into this node
            var containerNode = document.body.querySelector("#elm-app-container");
            var app = Elm.App.embed(containerNode);
          """
            |> javascriptCode

        --
        , """
            </script>
          </body>
          </html>
          """
            |> xmlCode
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
    -- "https://cdn-images-1.medium.com/max/1600/1*PnXjacg1e5nIQ3v9eO4-MQ.png"
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
        |> nonHighlightedCode

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


trimCode : String -> String
trimCode string =
    string
        |> String.lines
        |> List.drop 1
        |> List.map (String.dropLeft 6)
        |> String.join "\n"



-- / Code kinds, Pt. 1


highlightedCode :
    (String -> Result parserError SyntaxHighlight.HCode)
    -> String
    -> Element Styles Variations Msg
highlightedCode highlighter string =
    string
        |> trimCode
        |> highlighter
        |> Result.map code
        |> Result.withDefault Element.empty


nonHighlightedCode : String -> Element Styles Variations Msg
nonHighlightedCode string =
    string
        |> trimCode
        |> text
        |> section Code
            [ height fill
            , paddingBottom (scaled 4)
            , paddingTop (scaled 4)
            , width fill
            ]



-- ⚗️ / Code kinds, Pt. 2


elmCode : String -> Element Styles Variations Msg
elmCode =
    highlightedCode SyntaxHighlight.elm


javascriptCode : String -> Element Styles Variations Msg
javascriptCode =
    highlightedCode SyntaxHighlight.javascript


xmlCode : String -> Element Styles Variations Msg
xmlCode =
    highlightedCode SyntaxHighlight.xml
