port module Ports exposing (..)


port save : ( String, Int ) -> Cmd message


port deleteSession : () -> Cmd message


port toJS : String -> Cmd message


port fromJS : (String -> message) -> Sub message
