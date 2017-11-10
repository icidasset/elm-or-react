module Types exposing (..)

-- Messages


type Msg
    = -- Navigation
      GoToNextSlide
    | GoToPreviousSlide
      -- ...
    | NoOp



-- Model


type alias Model =
    { slide : Int
    , title : String
    }
