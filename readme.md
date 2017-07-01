# Elm Spa Starter

This is a little prototype of most any application you would want to make. Clone it and build your application off it. Using this repo eliminates the tedium of starting a new project.

It also might be useful to look at, if you are learning how to use Elm.

How to get going..
```
> git clone https://github.com/Chadtech/elm-spa-starter new-project
> cd new-project
> npm install
> elm package install --yes
> gulp

then open up http://localhost:2966
```


This repo is organized as ..
``` 
development/              -- Your development app
  index.html
source/                   -- Source files
  app.coffee              -- Loads your elm file, and handles ports
  Ports.elm               -- Javascript inter-operation ports
  Main.elm                -- Main Elm file
  Route.elm               -- Primary routing functions
  Util.elm                -- Functions that are generally useful
  Types/
  Styles/
    a.styl                -- Styles for buttons
    card.styl             -- Styles for cards
    form.styl             -- Styles for form stuff
    Main.styl             -- General stuff, like colors and body styling
    p.styl             
  Main/
    Init.elm              -- Where the initial state is determined
    Subscriptions.elm    
    Update.elm            -- Main update function
    View.elm              -- Main view function
    Model.elm             -- Where the model is defined
    Message.elm           -- Where messages are defined
  Types/
    Home.elm              -- Model and Message type for the home page
    Login.elm             -- Model and Message type for the login page
    Page.elm              -- The Page type used in the main model
    Route.elm             -- The Route type used in Route primarily
    Session.elm           -- The Sesson type, used in the main model
  Update/
    Login/
      HandleExternal.elm  -- A helper module to handle external messages
    Login.elm             -- The login page update function
    Home.elm              -- The home page update function
    Route.elm             -- Where routing is handled
  View/
    Home.elm              -- The home view
    Login.elm             -- The login view
    Logout.elm            -- the logout view


gulpFile.coffee
server.js
```


## Distribution

To compile to `distribution` type into your terminal..

```
gulp distribution
```

It will run the js command without debug on. Its pretty sparse in what it does, but if you have your own dist operations, you can put them in that gulp task.


## Elm Format

There is an [Elm-Format](https://github.com/avh4/elm-format) task in this gulp file. Its not on by default, but you can switch to it by uncommenting a little code. 