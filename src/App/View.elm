module View exposing (entry)

import Element exposing (..)
import Element.Attributes exposing (..)
import Html exposing (Html)
import Styles exposing (Styles(..))
import Types exposing (..)
import Variables exposing (scaled)


-- 🍯


entry : Model -> Html Msg
entry _ =
    layout
        Styles.styles
        (column
            Root
            [ padding (scaled 5)
            ]
            [ "Elm & React"
                |> text
                |> h1 H1 [ paddingBottom (scaled 3) ]
                |> header NotStyled []
            ]
        )
