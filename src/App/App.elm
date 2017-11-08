module App exposing (main)

import Html
import State
import Types exposing (..)
import View


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = View.entry
        , update = State.update
        , subscriptions = State.subscriptions
        }


init : ( Model, Cmd Msg )
init =
    ( State.initialModel
    , State.initialCommand
    )
