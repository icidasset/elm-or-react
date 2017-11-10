module App exposing (main)

import Html
import State
import Types exposing (..)
import View


main : Program (Maybe Model) Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = View.entry
        , update = State.update
        , subscriptions = State.subscriptions
        }


init : Maybe Model -> ( Model, Cmd Msg )
init maybeModelFromStorage =
    ( Maybe.withDefault State.initialModel maybeModelFromStorage
    , State.initialCommand
    )
