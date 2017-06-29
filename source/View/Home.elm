module View.Home exposing (view)

import Html exposing (Html, div, p, a, br, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Types.Home exposing (Model, Message(..))
import Types.Session exposing (Session)
import Types.Route exposing (Route(..))
import Route


view : Session -> Model -> Html Message
view { username } { count } =
    div
        [ class "card solitary" ]
        [ p
            []
            [ text ("Welcome back " ++ username) ]
        , br [] []
        , p
            []
            [ text ("count = " ++ (toString count)) ]
        , br [] []
        , a
            [ onClick Increment ]
            [ text "+ 1" ]
        , a
            [ onClick Decrement ]
            [ text "- 1" ]
        , br [] []
        , br [] []
        , a
            [ Route.href Logout ]
            [ text "log out" ]
        ]
