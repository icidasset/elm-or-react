module State exposing (initialModel, initialCommand, update, subscriptions)

import Ports
import Slides.Content
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
    model
        |> updateWithMessage msg
        |> saveModelIfNecessary model


updateWithMessage : Msg -> Model -> ( Model, Cmd Msg )
updateWithMessage msg model =
    case msg of
        GoToNextSlide ->
            (!) { model | slide = nextSlideNumber model.slide } []



-- 🔥 / Utilities


nextSlideNumber : Int -> Int
nextSlideNumber currentNumber =
    -- Go back to the beginning if we reached the end
    if currentNumber + 1 > List.length Slides.Content.content then
        1
    else
        currentNumber + 1


saveModelIfNecessary : Model -> ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
saveModelIfNecessary oldModel ( newModel, command ) =
    -- If something's changed,
    -- save the new state in sessionStorage.
    -- (see `index.html` file)
    if newModel /= oldModel then
        (!) newModel [ command, Ports.saveModel newModel ]
    else
        (!) newModel [ command ]



-- 🌱


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
