module Rotater exposing (..)

import Html exposing (Html)


type alias Rotater a =
    { elements : List a
    , current : Int
    , userName : String
    }


type Msg
    = Next
    | Prev


updateUserName : String -> Rotater a -> Rotater a
updateUserName newname rot =
    { rot | username = newname }


view : (a -> Html msg) -> Rotater a -> Html Msg
view viewOne rot =
    Debug.crash "NYI"


update : Msg -> Rotater a -> Rotater a
update msg r =
    case msg of
        Next ->
            { r | current = r.current + 1 }

        Prev ->
            { r | current = r.current - 1 }
