module Variables exposing (..)

import Color exposing (Color, rgb)
import Style exposing (Font)
import Style.Font as Font
import Style.Scale as Scale


-- Scales


scaled : Int -> Float
scaled =
    Scale.modular 16 1.125



-- Colors


colors =
    { base00 = rgb 41 45 62
    , base01 = rgb 68 66 103
    , base02 = rgb 50 55 77
    , base03 = rgb 103 110 149
    , base04 = rgb 135 150 176
    , base05 = rgb 149 157 203
    , base06 = rgb 149 157 203
    , base07 = rgb 255 255 255
    , base08 = rgb 240 113 120
    , base09 = rgb 247 140 108
    , base0A = rgb 255 203 107
    , base0B = rgb 195 232 141
    , base0C = rgb 137 221 255
    , base0D = rgb 130 170 255
    , base0E = rgb 199 146 234
    , base0F = rgb 255 83 112
    }


colorDerivatives =
    { border = colors.base02
    , text = colors.base06
    }



-- Fonts


codingFont : Font
codingFont =
    Font.importUrl
        { name = "Hack"
        , url = "https://cdn.jsdelivr.net/npm/hack-font/build/web/hack-subset.css"
        }


defaultFont : Font
defaultFont =
    Font.importUrl
        { name = "Permanent Marker"
        , url = "https://fonts.googleapis.com/css?family=Permanent+Marker"
        }


headerFont : Font
headerFont =
    Font.importUrl
        { name = "Spectral SC"
        , url = "https://fonts.googleapis.com/css?family=Spectral+SC:500"
        }
