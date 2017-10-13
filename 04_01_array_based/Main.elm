module Main exposing (..)

import Carousel
import Html exposing (..)
import Html.Attributes as Attributes
import Html.Events as Events


view model =
    div [] []


update msg model =
    model


main =
    Html.beginnerProgram
        { model = ()
        , view = view
        , update = update
        }
