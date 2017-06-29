init = localStorage.getItem "elm-spa-starter"

app = Elm.Main.fullscreen (JSON.parse init)


app.ports.save.subscribe (payload) ->
    username = payload[0]
    count = payload[1]

    session =
        JSON.stringify
            username: username
            count: count

    localStorage.setItem "elm-spa-starter", session



app.ports.toJS.subscribe (thing) ->
    console.log thing


fromJS = (thing) ->
    app.ports.fromJS.send thing