module State exposing (initialModel, initialCommand, update, subscriptions)

import Keyboard
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
        -----------------------------------
        -- Navigation
        -----------------------------------
        GoToNextSlide ->
            (!) { model | slide = nextSlideNumber model.slide } []

        GoToPreviousSlide ->
            (!) { model | slide = previousSlideNumber model.slide } []

        -----------------------------------
        -- Other
        -----------------------------------
        NoOp ->
            (!) model []



-- 🔥 / Utilities


previousSlideNumber : Int -> Int
previousSlideNumber currentNumber =
    -- Go to the end if we reached the beginning
    if currentNumber - 1 < 1 then
        currentNumber
    else
        currentNumber - 1


nextSlideNumber : Int -> Int
nextSlideNumber currentNumber =
    -- Go back to the beginning if we reached the end
    if currentNumber + 1 > List.length Slides.Content.content then
        currentNumber
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
    Sub.batch
        [ Keyboard.downs onKeyPress ]


onKeyPress : Keyboard.KeyCode -> Msg
onKeyPress code =
    case code of
        37 ->
            GoToPreviousSlide

        39 ->
            GoToNextSlide

        _ ->
            NoOp
