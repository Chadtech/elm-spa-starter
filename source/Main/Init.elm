module Main.Init exposing (init)

import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import Json.Decode exposing (Value)
import Navigation exposing (Location)
import Types.Page exposing (Page(..))
import Update.Route as Route
import Route


init : Value -> Location -> ( Model, Cmd Message )
init json location =
    Route.set (Route.fromLocation location)
        { page = Blank
        , session = Nothing
        }
