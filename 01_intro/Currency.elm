module Currency exposing (..)


type Currency
    = Usd
    | Gbp
    | Ils
    | Eur
    | Cad
    | Sek
    | Jpy


show : Currency -> String
show currency =
    case currency of
        Usd ->
            "United States Dollars"

        Gbp ->
            "British Pounds"

        Ils ->
            "Israeli Shekels"

        Eur ->
            "Euros"

        Cad ->
            "Canadian Dollars"

        Sek ->
            "Swedish Krona"

        Jpy ->
            "Japanese Yen"
