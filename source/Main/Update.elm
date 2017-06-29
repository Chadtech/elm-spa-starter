module Main.Update exposing (update)

import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import Types.Page exposing (Page(..))
import Update.Route as Route
import Update.Home as Home
import Update.Login as Login
import Update.Login.HandleExternal as LoginExternal


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    case ( message, model.page ) of
        ( SetRoute maybeRoute, _ ) ->
            Route.set maybeRoute model

        ( LoginMessage subMessage, Login subModel ) ->
            let
                ( newSubModel, cmd, externalMessage ) =
                    Login.update subMessage subModel

                newModelAndCmd =
                    { model
                        | page = Login newSubModel
                    }
                        ! [ Cmd.map LoginMessage cmd ]
            in
                LoginExternal.handle
                    externalMessage
                    newModelAndCmd

        ( HomeMessage subMessage, Home subModel ) ->
            let
                ( newSubModel, cmd ) =
                    Home.update subMessage subModel

                cmds =
                    [ Cmd.map HomeMessage cmd
                    , Home.save model.session newSubModel.count
                    ]
            in
                { model
                    | page = Home newSubModel
                }
                    ! cmds

        _ ->
            model ! []
