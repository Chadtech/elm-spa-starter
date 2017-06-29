module Update.Home exposing (update)

import Types.Home exposing (Model, Message(..))


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
