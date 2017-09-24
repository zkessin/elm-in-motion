module Counter exposing (..)

import Html exposing (Html, br, div, h1, text)
import Html.Events as Events


type alias Model =
    Int


type Msg
    = Change Int


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text <| toString model ]
        , div [ Events.onClick <| Change 1 ] [ text "+" ]
        , div [ Events.onClick <| Change -1 ] [ text "-" ]
        , div [ Events.onClick <| Change 3 ] [ text "+3" ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change n ->
            model + n


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = 0
        , view = view
        , update = update
        }
