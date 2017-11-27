module State exposing (..)

import Keyboard
import Ports
import Slides.Numbers
import Touch exposing (isLeftSwipe, isRightSwipe)
import Types exposing (..)


-- 💧


initialModel : Flags -> Model
initialModel flags =
    { gesture = Touch.blanco
    , slide = Maybe.withDefault 1 flags.slide
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
            { model | slide = Slides.Numbers.next model.slide } ! []

        GoToPreviousSlide ->
            { model | slide = Slides.Numbers.prev model.slide } ! []

        -----------------------------------
        -- Touch events
        -----------------------------------
        Swipe touch ->
            let
                gesture : Touch.Gesture
                gesture =
                    Touch.record touch model.gesture
            in
                { model | gesture = gesture } ! []

        SwipeEnd touch ->
            let
                gesture : Touch.Gesture
                gesture =
                    Touch.record touch model.gesture

                newSlideNumber : Int
                newSlideNumber =
                    if isRightSwipe touchSensitivity gesture then
                        Slides.Numbers.prev model.slide
                    else if isLeftSwipe touchSensitivity gesture then
                        Slides.Numbers.next model.slide
                    else
                        model.slide
            in
                { model | gesture = Touch.blanco, slide = newSlideNumber } ! []

        -----------------------------------
        -- Other
        -----------------------------------
        NoOp ->
            model ! []



-- 🔥 / Constants


{-| How much pixels do we need to swipe
to go to the previous or next slide?
-}
touchSensitivity : Float
touchSensitivity =
    250



-- 🔥 / Post Processing


{-| Save the slide number in the session storage,
but only if it's changed since last time.
-}
saveModelIfNecessary : Model -> ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
saveModelIfNecessary oldModel ( newModel, command ) =
    if newModel.slide /= oldModel.slide then
        (!) newModel [ command, Ports.saveSlideNumber newModel.slide ]
    else
        (!) newModel [ command ]



-- 🌱


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Keyboard.downs onKeyPress ]



-- 🌱 / Keyboard


onKeyPress : Keyboard.KeyCode -> Msg
onKeyPress code =
    case code of
        37 ->
            GoToPreviousSlide

        39 ->
            GoToNextSlide

        _ ->
            NoOp
