module Styles exposing (Styles(..), Variations(..), styles)

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
        [ Sheet.mix basics
        , Sheet.mix containers
        , Sheet.mix headers
        ]



-- Types


type Styles
    = -- Basics
      Black
    | Bold
      -- Containers
    | Root
    | Slides
      -- Headers
    | Header
    | H1
    | H2
      -- 💀
    | Zed


type Variations
    = Colored
      --
    | Default



-- Basics


basics : List (Style Styles Variations)
basics =
    [ --
      -- Font weights
      --
      style Black [ Font.weight 900 ]
    , style Bold [ Font.weight 700 ]
    ]



-- Containers


containers : List (Style Styles Variations)
containers =
    [ --
      -- Root
      --
      style Root
        [ Color.background colors.base07
        , Color.text colorDerivatives.text
        , Font.lineHeight 1.575
        , Font.size (scaled 1)
        , Font.typeface [ defaultFont, Font.sansSerif ]
        ]
    , --
      -- Slides
      --
      style Slides
        [ cursor "e-resize"
        ]
    ]



-- Headers


headers : List (Style Styles Variations)
headers =
    [ --
      -- H1
      --
      style H1
        [ Border.bottom 1
        , Border.solid
        , Color.border colorDerivatives.border
        , Color.text colors.base01
        , Font.center
        , Font.size (scaled 5)
        , Font.typeface [ headerFont, Font.sansSerif ]
        ]
    , --
      -- H2
      --
      style H2
        [ Color.text colors.base05
        , Font.lineHeight 1.05
        , Font.size (scaled 14)
        , Font.typeface [ headerFont, Font.sansSerif ]

        --
        , variation Colored
            [ Color.text colors.base08 ]
        ]
    ]
