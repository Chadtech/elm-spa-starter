module Update.Login.HandleExternal exposing (handle)

import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import Types.Login exposing (ExternalMessage(..))
import Types.Page exposing (Page(..))
import Types.Home as Home


handle : Maybe ExternalMessage -> ( Model, Cmd Message ) -> ( Model, Cmd Message )
handle externalMessage ( model, cmd ) =
    case externalMessage of
        Just (SuccessfulLogin username password) ->
            { model
                | page = Home Home.init
                , session =
                    Just
                        { username = username }
            }
                ! [ cmd ]

        _ ->
            ( model, cmd )
