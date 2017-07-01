module Types.Session exposing (..)

import Json.Decode as Decode exposing (Decoder, Value)
import Json.Decode.Pipeline as Pipeline exposing (required)


type alias Session =
    { username : String }



-- DECODER --


decoder : Decoder Session
decoder =
    Pipeline.decode Session
        |> required "username" Decode.string


decode : Value -> Maybe Session
decode =
    Decode.decodeValue decoder >> Result.toMaybe
