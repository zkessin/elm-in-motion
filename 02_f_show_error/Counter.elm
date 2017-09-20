module Counter exposing (..)

import Html exposing (Html, br, div, h1, input, label, text)
import Html.Attributes as Attributes
import Html.Events as Events


type alias Model =
    Int


type Msg
    = Change Int
    | Input String


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text <| toString model ]
        , div [ Events.onClick <| Change 1 ] [ text "+" ]
        , div [ Events.onClick <| Change -1 ] [ text "-" ]
        , div [ Events.onClick <| Change 3 ] [ text "+3" ]
        , label [] [ text "Set A value" ]
        , text " "
        , input [ Attributes.placeholder "Set a Value", Events.onInput Input ] []
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change n ->
            model + n

        Input str ->
            String.toInt str |> Result.withDefault model


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = 0
        , view = view
        , update = update
        }
