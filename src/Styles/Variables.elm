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
    { border = Color.rgb 243 243 243
    , text = colors.base02
    }



-- Fonts


defaultFont : Font
defaultFont =
    Font.importUrl
        { name = "Nunito Sans"
        , url = "https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,400i,700,900"
        }


headerFont : Font
headerFont =
    Font.importUrl
        { name = "Permanent Marker"
        , url = "https://fonts.googleapis.com/css?family=Permanent+Marker"
        }
