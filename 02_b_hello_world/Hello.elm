module Hello exposing (..)

import Html exposing (..)
import Html.Attributes as Attributes


(=>) =
    (,)


main =
    div []
        [ h1
            [ Attributes.style
                [ "background-color" => "blue"
                , "font" => "Ariel"
                ]
            ]
            [ text "Hello World"
            ]
        , hr [] []
        , h2 [] [ text "How is it going?" ]
        ]
