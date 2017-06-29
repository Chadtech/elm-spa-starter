module Types.Page exposing (..)

import Types.Login as Login
import Types.Home as Home
import Types.Session exposing (Session)


type Page
    = Login Login.Model
    | Logout
    | Home Home.Model
    | Blank
    | NotFound
