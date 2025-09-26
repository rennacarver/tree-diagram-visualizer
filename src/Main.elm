module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }





type alias Model =
  { count : Int
  , rotation : Int
  }


init : Model
init =
  { count = 0
  , rotation = 0
  }



-- UPDATE


type Msg
  = Increment
  | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      { model
        | count = model.count + 1
        , rotation = model.rotation + 90
      }

    Decrement ->
      { model | count = model.count - 1 }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div
        [ style "display" "inline-block"
        , style "minWidth" "2ch"
        , style "textAlign" "center"
        , style "transformOrigin" "50% 50%"
        , style "transition" "transform 200ms ease"
        , style "transform" ("rotate(" ++ String.fromInt model.rotation ++ "deg)")
        ]
        [ text (String.fromInt model.count) ]
    , button [ onClick Increment, style "backgroundColor" "blue", style "color" "white" ] [ text "+" ]
    ]