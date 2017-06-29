module Update.Home exposing (..)

import Types.Home exposing (Model, Message(..))
import Types.Session exposing (Session)
import Ports


update : Message -> Model -> ( Model, Cmd Message )
update message model =
    case message of
        Increment ->
            { model
                | count = model.count + 1
            }
                ! []

        Decrement ->
            { model
                | count = model.count - 1
            }
                ! []



-- LOCAL STORAGE --


save : Maybe Session -> Int -> Cmd message
save maybeSession count =
    case maybeSession of
        Just { username } ->
            Ports.save ( username, count )

        Nothing ->
            Cmd.none
