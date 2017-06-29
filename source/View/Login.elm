module View.Login exposing (view)

import Html exposing (Html, Attribute, p, div, input, text, form, a)
import Html.Attributes exposing (class, type_, value, placeholder, hidden)
import Html.Events exposing (onInput, onClick, onSubmit)
import Types.Login exposing (Model, Message(..), Field(..))


view : Model -> Html Message
view model =
    let
        errorView_ : Field -> Html Message
        errorView_ =
            errorView model.errors
    in
        div
            [ class "card solitary" ]
            [ form
                [ onSubmit AttemptSubmit ]
                [ p [] [ text "Log In" ]
                , field
                    "Username"
                    [ value model.username
                    , onInput_ Username
                    ]
                , errorView_ Username
                , field
                    "Password"
                    [ value model.password
                    , type_ "password"
                    , onInput_ Password
                    ]
                  -- This input is here, because without it
                  -- the enter key does not cause submission
                , input
                    [ type_ "submit"
                    , hidden True
                    ]
                    []
                , a
                    [ onClick AttemptSubmit ]
                    [ text "Log in" ]
                ]
            ]



-- COMPONENT HTML --


field : String -> List (Attribute Message) -> Html Message
field name attributes =
    div
        [ class "field" ]
        [ p [] [ text name ]
        , input
            attributes
            []
        ]


errorView : List ( Field, String ) -> Field -> Html Message
errorView errors fieldType =
    let
        thisFieldsErrors =
            List.filter
                (Tuple.first >> (==) fieldType)
                errors
    in
        case thisFieldsErrors of
            [] ->
                Html.text ""

            error :: _ ->
                let
                    str =
                        Tuple.second error
                in
                    div
                        [ class "error-zone" ]
                        [ p [] [ text str ] ]



-- HELPERS --


onInput_ : Field -> Attribute Message
onInput_ =
    UpdateField >> onInput


valueIfShow : Bool -> String -> String
valueIfShow show str =
    if show then
        str
    else
        "********"
