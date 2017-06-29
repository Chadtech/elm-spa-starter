module Update.Login exposing (update)

import Validate exposing (ifBlank)
import Types.Login
    exposing
        ( Model
        , Message(..)
        , ExternalMessage(..)
        , Field(..)
        )


update : Message -> Model -> ( Model, Cmd Message, Maybe ExternalMessage )
update message model =
    case message of
        UpdateField field str ->
            let
                newModel =
                    case field of
                        Username ->
                            { model
                                | username = str
                            }

                        Password ->
                            { model
                                | password = str
                            }
            in
                ( newModel, Cmd.none, Nothing )

        AttemptSubmit ->
            let
                errors =
                    validate model

                newModel =
                    { model
                        | errors = errors
                    }
            in
                if List.isEmpty errors then
                    let
                        externalMessage =
                            SuccessfulLogin
                                newModel.username
                                newModel.password
                    in
                        ( newModel
                        , Cmd.none
                        , Just externalMessage
                        )
                    -- Do whatever needs to happen
                    -- to login here
                    -- whether that be a port
                    -- or an http request
                else
                    ( newModel
                    , Cmd.none
                    , Nothing
                    )



-- VALIDATIONS --


validate : Model -> List ( Field, String )
validate =
    Validate.all
        [ .username >> ifBlank ( Username, "Username field cant be blank" )
        , .password >> ifBlank ( Password, "Password field cant be blank" )
        ]
