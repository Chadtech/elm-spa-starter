module Update.Route exposing (..)

import Types.Route as Route exposing (Route(..))
import Types.Page as Page exposing (Page(..))
import Types.Home as Home
import Types.Login as Login
import Main.Model exposing (Model)
import Main.Message exposing (Message(..))


set : Maybe Route -> Model -> ( Model, Cmd Message )
set maybeRoute model =
    case maybeRoute of
        Nothing ->
            { model | page = Page.NotFound } ! []

        Just (Route.Home) ->
            case model.session of
                Just session ->
                    { model
                        | page =
                            Page.Home Home.init
                    }
                        ! []

                Nothing ->
                    { model
                        | page =
                            Page.Login Login.init
                    }
                        ! []

        Just (Route.Login) ->
            { model
                | page = Page.Login Login.init
                , session = Nothing
            }
                ! []

        Just (Route.Logout) ->
            { model
                | page = Page.Logout
                , session = Nothing
            }
                ! []
