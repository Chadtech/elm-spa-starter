module Types.Home exposing (..)


type alias Model =
    { count : Int }


init : Model
init =
    { count = 0 }


type Message
    = Increment
    | Decrement
