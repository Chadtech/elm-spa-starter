module Types.Home exposing (..)

import Json.Decode as Decode exposing (Decoder, Value)
import Json.Decode.Pipeline as Pipeline exposing (required)


type alias Model =
    { count : Int }


init : Model
init =
    { count = 0 }


type Message
    = Increment
    | Decrement



-- DECODER --


decoder : Decoder Model
decoder =
    Pipeline.decode Model
        |> required "count" Decode.int


decode : Value -> Maybe Model
decode =
    Decode.decodeValue decoder >> Result.toMaybe
