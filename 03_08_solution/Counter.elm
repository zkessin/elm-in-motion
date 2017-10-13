module Counter exposing (..)

import Html
    exposing
        ( Html
        , br
        , div
        , h1
        , input
        , label
        , text
        )
import Html.Attributes as Attributes
import Html.Events as Events


type alias Model =
    { value : Int
    , error : Maybe String
    , input : String
    }


type Msg
    = Change Int
    | SetValue String


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text <| toString model.value ]
        , div [ Events.onClick <| Change 1 ] [ text "+" ]
        , div [ Events.onClick <| Change -1 ] [ text "-" ]
        , div [ Events.onClick <| Change 3 ] [ text "+3" ]
        , label [] [ text "Enter a Value " ]
        , input
            [ Attributes.placeholder "Enter a Value"
            , Events.onInput SetValue
            , Attributes.value model.input
            ]
            []
        , case model.error of
            Nothing ->
                text ""

            Just errmsg ->
                div
                    [ Attributes.style [ ( "color", "red" ) ]
                    ]
                    [ text "Error "
                    , text errmsg
                    ]
        ]


square x =
    x * x


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change n ->
            { model | value = model.value + n }

        SetValue "+" ->
            { model | error = Nothing, input = "+" }

        SetValue "-" ->
            { model | error = Nothing, input = "-" }

        SetValue newValue ->
            case String.toInt newValue of
                Ok value ->
                    Model value Nothing newValue

                Err errmsg ->
                    { model | error = Just errmsg, input = newValue }


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = Model 0 Nothing ""
        , view = view
        , update = update
        }
