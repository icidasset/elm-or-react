module View exposing (entry)

import Element exposing (..)
import Element.Attributes exposing (..)
import Element.Events exposing (onClick)
import Html exposing (Html)
import Slides.Content
import Styles exposing (..)
import SyntaxTheme
import Touch
import Types exposing (..)
import Variables exposing (scaled)


-- Slides

import Slides.Content


-- 🍯


entry : Model -> Html Msg
entry model =
    [ top, middle, bottom, syntaxTheme ]
        |> List.map (\fn -> fn model)
        |> column Root rootAttributes
        |> viewport Styles.styles


rootAttributes : List (Attribute Variations Msg)
rootAttributes =
    [ height fill
    , padding (scaled 4)
    ]



-- Top


top : Model -> Element Styles Variations Msg
top model =
    let
        prev =
            navButton
                (model.slide > 1)
                "previous"
                Left
                GoToPreviousSlide

        title =
            "Elm or React"
                |> text
                |> h1 H1 [ center, paddingBottom (scaled 3), width fill ]

        next =
            navButton
                (model.slide < List.length Slides.Content.content)
                "next"
                Right
                GoToNextSlide
    in
        [ title ]
            |> row Zed []
            |> within [ prev, next ]
            |> header Header []



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
            |> section Slides middleAttributes


middleAttributes : List (Attribute Variations Msg)
middleAttributes =
    [ height fill
    , paddingBottom (scaled 4)
    , paddingTop (scaled 4)

    -- Touch events
    , toAttr (Touch.onStart Swipe)
    , toAttr (Touch.onMove Swipe)
    , toAttr (Touch.onEnd SwipeEnd)
    ]



-- Bottom


bottom : Model -> Element Styles Variations Msg
bottom _ =
    empty



-- Other stuff


navButton : Bool -> String -> Alignment -> Msg -> Element Styles Variations Msg
navButton requirement label alignment msg =
    if requirement then
        label
            |> text
            |> el Clickable []
            |> el H1
                [ case alignment of
                    Left ->
                        alignLeft

                    Right ->
                        alignRight
                , onClick msg
                , vary SlightySmaller True
                ]
    else
        empty


syntaxTheme : Model -> Element Styles Variations Msg
syntaxTheme _ =
    SyntaxTheme.theme
        |> Html.text
        |> List.singleton
        |> Html.node "style" []
        |> Element.html
