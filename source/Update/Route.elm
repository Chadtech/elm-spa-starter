module Update.Route exposing (..)

import Types.Route as Route exposing (Route(..))
import Types.Page as Page exposing (Page(..))
import Types.Home as Home
import Types.Login as Login
import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import Ports


set : Maybe Route -> Model -> ( Model, Cmd Message )
set maybeRoute model =
    case maybeRoute of
        Nothing ->
            { model | page = Page.NotFound } ! []

        Just (Route.Home) ->
            case ( model.session, model.page ) of
                ( Just session, Page.Home subModel ) ->
                    model ! []

                ( Just session, _ ) ->
                    { model
                        | page =
                            Page.Home Home.init
                    }
                        ! []

                _ ->
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
                ! [ Ports.deleteSession () ]

        Just (Route.Logout) ->
            { model
                | page = Page.Logout
                , session = Nothing
            }
                ! [ Ports.deleteSession () ]
