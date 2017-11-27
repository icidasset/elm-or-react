module App exposing (main)

import Html
import State
import Types exposing (..)
import View


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = View.entry
        , update = State.update
        , subscriptions = State.subscriptions
        }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( State.initialModel flags
    , State.initialCommand
    )
