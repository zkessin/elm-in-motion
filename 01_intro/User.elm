module User exposing (..)

import Currency exposing (Currency(..))


type Payment
    = Payment Int Currency


type alias Info =
    { name : String
    , email : String
    , age : Int
    , paid : Maybe Payment
    }


show : Info -> String
show info =
    let
        p =
            Maybe.map showPayment info.paid
                |> Maybe.withDefault "Unpaid"
    in
    info.name ++ " <" ++ info.email ++ "> " ++ toString info.age ++ " " ++ p


showPayment : Payment -> String
showPayment (Payment amt curr) =
    toString amt ++ " " ++ Currency.show curr
