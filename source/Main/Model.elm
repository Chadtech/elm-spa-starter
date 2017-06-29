module Main.Model exposing (Model)

import Types.Session exposing (Session)
import Types.Page exposing (Page(..))


type alias Model =
    { session : Maybe Session
    , page : Page
    }
