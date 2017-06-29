module Types.Login exposing (..)


type alias Model =
    { username : String
    , password : String
    , errors : List ( Field, String )
    }


init : Model
init =
    { username = ""
    , password = ""
    , errors = []
    }


type Message
    = UpdateField Field String
    | AttemptSubmit


type ExternalMessage
    = SuccessfulLogin String String


type Field
    = Username
    | Password
