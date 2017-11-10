module Types exposing (..)

-- Messages


type Msg
    = -- Navigation
      GoToNextSlide



-- Model


type alias Model =
    { slide : Int
    , title : String
    }
