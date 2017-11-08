module Styles exposing (..)

import Color exposing (..)
import Style exposing (..)
import Style.Border as Border
import Style.Color as Color
import Style.Font as Font
import Style.Sheet as Sheet
import Variables exposing (..)


-- 🍯


styles : StyleSheet Styles Variations
styles =
    Style.styleSheet
        [ Sheet.mix containers
        , Sheet.mix headers
        ]



-- Types


type Styles
    = -- Containers
      Root
      -- Headers
    | Header
    | H1
      --
    | NotStyled


type Variations
    = Default



-- 💁 Helpful things


type alias Bunch =
    List (Style Styles Variations)



-- Containers


containers : Bunch
containers =
    [ --
      -- Root
      --
      style Root
        [ Color.background colors.base07
        , Color.text colorDerivatives.text
        , Font.size (scaled -1)
        , Font.typeface [ defaultFont, Font.sansSerif ]
        ]
    ]



-- Headers


headers : Bunch
headers =
    [ --
      -- H1
      --
      style H1
        [ Border.bottom 1
        , Border.solid
        , Color.border colorDerivatives.border
        , Font.size (scaled 3)
        , Font.typeface [ headerFont, Font.serif ]
        , Font.weight 700
        ]
    ]
