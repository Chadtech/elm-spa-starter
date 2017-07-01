module Main.Init exposing (init)

import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import Json.Decode exposing (Value)
import Navigation exposing (Location)
import Types.Page exposing (Page(..))
import Types.Home as Home
import Types.Session as Session
import Update.Route as Route
import Route


init : Value -> Location -> ( Model, Cmd Message )
init json location =
    Route.set
        (Route.fromLocation location)
        (getModel json)


getModel : Value -> Model
getModel json =
    case ( Home.decode json, Session.decode json ) of
        ( Just model, Just session ) ->
            { page = Home model
            , session = Just session
            }

        _ ->
            { page = Blank
            , session = Nothing
            }
