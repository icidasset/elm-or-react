module State exposing (initialModel, initialCommand, update, subscriptions)

import Types exposing (..)


-- 💧


initialModel : Model
initialModel =
    { slide = 1
    , title = "Elm or React"
    }


initialCommand : Cmd Msg
initialCommand =
    Cmd.none



-- 🔥


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- 🌱


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
