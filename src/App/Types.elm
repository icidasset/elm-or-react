module Types exposing (..)

import Touch


-- Messages


type Msg
    = -- Navigation
      GoToNextSlide
    | GoToPreviousSlide
      -- Touch events
    | Swipe Touch.Event
    | SwipeEnd Touch.Event
      -- ...
    | NoOp



-- Model


type alias Model =
    { gesture : Touch.Gesture
    , slide : Int
    }



-- Program Flags


type alias Flags =
    { slide : Maybe Int }



-- Other


type Alignment
    = Left
    | Right
