module Carousel exposing (..)

import Array exposing (Array)
import Html exposing (..)
import Html.Attributes as Attributes
import Html.Events as Events


type alias Model a =
    { items : Array a
    , current : Int
    }


type Msg
    = Next
    | Prev
    | Html ()


init : List a -> Model a
init items =
    Model (Array.fromList items) 0


display : Model a -> (a -> Html Msg) -> Html Msg
display model display =
    let
        current =
            Array.get model.current model.items
    in
    div []
        [ div [ Events.onClick Prev ] [ text "Prev" ]
        , div []
            [ case current of
                Just a ->
                    display a

                Nothing ->
                    text ""
            ]
        , div [ Events.onClick Next ] [ text "Next" ]
        ]


update : Msg -> Model a -> Model a
update msg model =
    case msg of
        Next ->
            { model
                | current =
                    if model.current + 1 == Array.length model.items then
                        0
                    else
                        model.current + 1
            }

        Prev ->
            case model.current of
                0 ->
                    { model | current = Array.length model.items - 1 }

                n ->
                    { model | current = model.current - 1 }

        Html _ ->
            model
