module Main.Message exposing (Message(..))

import Types.Home as Home
import Types.Login as Login
import Types.Route exposing (Route(..))


type Message
    = HomeMessage Home.Message
    | LoginMessage Login.Message
    | HandlePort String
    | SetRoute (Maybe Route)
