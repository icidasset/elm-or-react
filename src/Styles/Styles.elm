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
        [ root

        --
        , Sheet.mix basics
        , Sheet.mix containers
        , Sheet.mix headers
        ]



-- Types


type Styles
    = -- 🚀
      Root
      -- Basics
    | Clickable
      -- Containers
    | Code
    | Header
    | Slides
      -- Headers
    | H1
    | H2
    | H3
      -- 💀
    | Zed


type Variations
    = Colored
      --
    | Default



-- 🚀


root : Style Styles Variations
root =
    style Root
        [ Color.background colors.base00
        , Color.selection colors.base03
        , Color.text colorDerivatives.text
        , Font.lineHeight 1.575
        , Font.size (scaled 1)
        , Font.typeface [ defaultFont, Font.sansSerif ]

        --
        , prop "-webkit-font-smoothing" "antialiased"
        , prop "-moz-font-smoothing" "grayscale"
        ]



-- Basics


basics : List (Style Styles Variations)
basics =
    [ -----------------------------------
      -- Clickable
      -----------------------------------
      style Clickable
        [ cursor "pointer" ]
    ]



-- Containers


containers : List (Style Styles Variations)
containers =
    [ -----------------------------------
      -- Code
      -----------------------------------
      style Code
        [ Color.text colors.base06
        , Font.lineHeight 1.425
        , Font.size (scaled 3)
        , Font.typeface [ codingFont, Font.monospace ]
        ]
    , -----------------------------------
      -- Header
      -----------------------------------
      style Header
        [ Border.bottom 1
        , Color.border colorDerivatives.border

        --
        , prop "-webkit-user-select" "none"
        , prop "-moz-user-select" "none"
        , prop "-ms-user-select" "none"
        , prop "user-select" "none"
        ]
    , -----------------------------------
      -- Slides
      -----------------------------------
      style Slides
        []
    ]



-- Headers


headers : List (Style Styles Variations)
headers =
    [ -----------------------------------
      -- H1
      -----------------------------------
      style H1
        [ Color.text colors.base01
        , Font.center
        , Font.size (scaled 2)
        , Font.typeface [ headerFont, Font.sansSerif ]
        , Font.weight 500
        ]
    , -----------------------------------
      -- H2
      -----------------------------------
      style H2
        [ Color.text colors.base05
        , Font.lineHeight 1.05
        , Font.size (scaled 13)

        --
        , variation Colored
            [ Color.text colors.base08 ]
        ]
    , -----------------------------------
      -- H3
      -----------------------------------
      style H3
        [ Color.text colors.base05
        , Font.lineHeight 1.05
        , Font.size (scaled 9)
        ]
    ]
