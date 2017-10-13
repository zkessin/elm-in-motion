module Carousel exposing (..)

import Html exposing (..)
import Html.Attributes as Attributes
import Html.Events as Events


type alias Model a =
    { items : List a
    , current : Int
    }
