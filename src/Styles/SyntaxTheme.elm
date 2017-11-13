module SyntaxTheme exposing (theme)

import Color exposing (Color)
import Color.Convert exposing (colorToCssRgb)
import String.Interpolate
import Style exposing (Style)
import Variables exposing (colors)


theme : String
theme =
    interpolateColors
        themeColors
        """
        .elmsh { color: {1}; margin: 0 }
        .elmsh-hl {}
        .elmsh-add {}
        .elmsh-del {}
        .elmsh-comm { color: {0} }
        .elmsh1 { color: {2} }
        .elmsh2 { color: {3} }
        .elmsh3 { color: {5} }
        .elmsh4 { color: {5} }
        .elmsh5 { color: {4} }
        .elmsh6 { color: {2} }
        .elmsh7 { color: {0} }
        """


themeColors : List Color
themeColors =
    [ colors.base03
    , colors.base06
    , colors.base0A
    , colors.base0B
    , colors.base0C
    , colors.base0E
    ]


interpolateColors : List Color -> String -> String
interpolateColors colors css =
    colors
        |> List.map colorToCssRgb
        |> String.Interpolate.interpolate css
