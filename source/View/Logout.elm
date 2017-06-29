module View.Logout exposing (view)

import Html exposing (Html, div, p, text)
import Html.Attributes exposing (class)
import Main.Message exposing (Message(..))


view : Html Message
view =
    div
        [ class "card solitary" ]
        [ p
            []
            [ text "You are now logged out" ]
        ]
