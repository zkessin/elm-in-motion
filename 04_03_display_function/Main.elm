module Main exposing (..)

import Carousel
import Html exposing (..)
import Html.Attributes as Attributes
import Html.Events as Events


view model =
    div []
        [ Carousel.display model (toString >> text)
        , div [] [ text <| toString model ]
        ]


update msg model =
    model


main =
    Html.beginnerProgram
        { model = Carousel.init [ 1, 2, 3, 4, 5 ]
        , view = view
        , update = update
        }
