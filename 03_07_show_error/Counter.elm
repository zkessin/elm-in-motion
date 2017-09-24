module Counter exposing (..)

import Html exposing (Html, br, div, h1, input, label, text)
import Html.Attributes as Attributes
import Html.Events as Events


type alias Model =
    { value : Int
    , error : Maybe ( String, String )
    }


type Msg
    = Change Int
    | Input String


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text <| toString model.value ]
        , div [ Events.onClick <| Change 1 ] [ text "+" ]
        , div [ Events.onClick <| Change -1 ] [ text "-" ]
        , div [ Events.onClick <| Change 3 ] [ text "+3" ]
        , label [] [ text "Set A value" ]
        , text " "
        , input
            [ Attributes.placeholder "Set a Value"
            , Events.onInput Input
            , Attributes.value <|
                case model.error of
                    Nothing ->
                        toString model.value

                    Just ( _, s ) ->
                        s
            ]
            []
        , case model.error of
            Nothing ->
                text ""

            Just ( error, value ) ->
                div [ Attributes.style [ ( "color", "red" ) ] ] [ text error ]
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change n ->
            { model | value = model.value + n }

        Input "" ->
            { model | error = Just ( "Please Enter a Number", "" ) }

        Input "-" ->
            { model | error = Just ( "Continue Entering a negative number", "-" ) }

        Input "+" ->
            { model | error = Just ( "Continue Entering a positive number", "+" ) }

        Input str ->
            case String.toInt str of
                Ok val ->
                    { value = val, error = Nothing }

                Err error ->
                    { model | error = Just ( error, str ) }


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = { value = 0, error = Nothing }
        , view = view
        , update = update
        }
