module Simple exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)


type alias Model =
    Int


type Msg
    = Change Int


view : Model -> Html Msg
view model =
    div []
        [ text <| toString model
        , div [ onClick <| Change 1 ] [ text "+" ]
        , div [ onClick <| Change -1 ] [ text "-" ]
        , div [ onClick <| Change 5 ] [ text "+ 5" ]
        , div [ onClick <| Change (model * 2) ] [ text "* 3" ]
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
