module View exposing (entry)

import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (onClick)
import Html exposing (Html)
import Styles exposing (..)
import SyntaxTheme
import Types exposing (..)
import Variables exposing (scaled)


-- Slides

import Slides.Content


-- 🍯


entry : Model -> Html Msg
entry model =
    [ top, middle, bottom, syntaxTheme ]
        |> List.map (\fn -> fn model)
        |> column Root [ height fill, padding (scaled 4) ]
        |> viewport Styles.styles



-- Top


top : Model -> Element Styles Variations Msg
top model =
    model.title
        |> text
        |> h1 H1 [ paddingBottom (scaled 4) ]
        |> header Zed []



-- Middle


middle : Model -> Element Styles Variations Msg
middle model =
    let
        slideIndex =
            max 0 (model.slide - 1)
    in
        Slides.Content.content
            |> List.drop slideIndex
            |> List.head
            |> Maybe.withDefault Element.empty
            |> section Slides [ height fill, padding (scaled 4) ]



-- Bottom


bottom : Model -> Element Styles Variations Msg
bottom _ =
    empty



-- Other stuff


syntaxTheme : Model -> Element Styles Variations Msg
syntaxTheme _ =
    html (Html.node "style" [] [ Html.text SyntaxTheme.theme ])
