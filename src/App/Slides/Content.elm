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
      So you probably know what React is,
      but what about Elm?

      Elm is a functional language
      that compiles to javascript.

      Unlike using React,
      Elm produces almost no runtime errors.
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
      One or two small libraries
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
      npm install loader-a loader-b loader-c ...

      ---------
      -- Elm --
      ---------

      brew install elm
      brew install devd
      brew install watchexec

      {- Pick one -}
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
      What would a super simple app look like?
      """
        |> regularText

    --
    --
    , """
      // React Component

      const App = connect(
        state => state
      )(
        props => {
          const action          = { type: "CHANGE_GREETING", greeting: "👩\x200D🔬" };
          const changeGreeting  = () => props.dispatch(action);

          return <p onClick={changeGreeting}>{props.user.greeting}</p>;
        }
      );



      // State

      const initialState = {
        greeting: "👨\x200D🚀"
      };


      const reducers = {
        user: (state = initialState, { greeting, type }) => {
          switch (type) {
            case "CHANGE_GREETING":     return { ...state, greeting };
            default:                    return state;
          }
        }
      };



      // Render

      render(
        <Provider store={createStore(reducers)}>
          <App />
        </Provider>,
        document.body
      );
      """
        |> javascriptCode

    --
    --
    , """
      -- Elm View

      view : Model -> Html Msg
      view model =
          p
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
                  (!) { model | greeting = greeting } []



      -- Render

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
      Elm definitely looks
      simpler & easier
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
      - No native string interpolation
      (you need to use a function)
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
        |> section Code [ height fill, padding (scaled 4), width fill ]


trimCode : String -> String
trimCode string =
    string
        |> String.lines
        |> List.drop 1
        |> List.map (String.dropLeft 6)
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
