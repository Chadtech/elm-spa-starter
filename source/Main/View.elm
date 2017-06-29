module Main.View exposing (view)

import Html exposing (Html, div, p, br, a, text)
import Html.Attributes exposing (class)
import Main.Model exposing (Model)
import Main.Message exposing (Message(..))
import View.Home as Home
import View.Login as Login
import Types.Page exposing (Page(..))
import Types.Route as Route
import Route


view : Model -> Html Message
view model =
    case ( model.session, model.page ) of
        ( Just session, Home subModel ) ->
            Html.map
                HomeMessage
                (Home.view session subModel)

        ( _, Login subModel ) ->
            Html.map
                LoginMessage
                (Login.view subModel)

        ( _, Blank ) ->
            div [ class "main" ] []

        _ ->
            div
                [ class "main" ]
                [ div
                    [ class "card solitary" ]
                    [ p
                        []
                        [ text "Sorry, this page doesnt exist." ]
                    , br [] []
                    , a
                        [ Route.href Route.Home ]
                        [ text "Go Home" ]
                    ]
                ]
