module Route exposing (..)

import UrlParser as Url exposing (parseHash, s, (</>), Parser)
import Navigation exposing (Location)
import Html exposing (Attribute)
import Html.Attributes as Attributes
import Types.Route exposing (Route(..))


route : Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home (s "")
        , Url.map Login (s "login")
        , Url.map Logout (s "logout")
        ]



-- INTERNAL --


routeToString : Route -> String
routeToString route =
    let
        pieces =
            case route of
                Home ->
                    []

                Login ->
                    [ "login" ]

                Logout ->
                    [ "logout" ]
    in
        "#/" ++ (String.join "/" pieces)



-- EXTERNAL HELPERS --


href : Route -> Attribute msg
href route =
    Attributes.href (routeToString route)


modifyUrl : Route -> Cmd msg
modifyUrl =
    routeToString >> Navigation.modifyUrl


fromLocation : Location -> Maybe Route
fromLocation location =
    if String.isEmpty location.hash then
        Just Home
    else
        parseHash route location
