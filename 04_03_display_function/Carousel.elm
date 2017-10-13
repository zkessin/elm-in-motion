module Carousel exposing (..)

import Array exposing (Array)
import Html exposing (..)
import Html.Attributes as Attributes
import Html.Events as Events


type alias Model a =
    { items : Array a
    , current : Int
    }


init : List a -> Model a
init items =
    Model (Array.fromList items) 0


display : Model a -> (a -> Html msg) -> Html msg
display model display =
    let
        current =
            Array.get model.current model.items
    in
    div []
        [ case current of
            Just a ->
                display a

            Nothing ->
                text ""
        ]
