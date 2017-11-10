port module Ports exposing (..)

import Types exposing (Model)


-- 💡


port saveModel : Model -> Cmd msg
