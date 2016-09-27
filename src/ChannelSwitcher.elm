module ChannelSwitcher exposing (..)
-- Converted from 0.16 - 0.17
-- http://www.lambdacat.com/migrating-from-elm-0-16-to-0-17-from-startapp/

-- IMPORTS
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String
import Html.App as App

main : Program Never

main = App.program
    { init = init
    , update = update
    , view = view
    , subscriptions = \_ -> Sub.none
    }


-- MODEL
type alias Model =
  { channels: List String
  , selectedChannel: Int
  , query: String
  }

initialModel : Model
initialModel =
  { channels = ["Elm", "React.js", "Ember", "Angular 2", "Om", "OffTopic" ]
  , selectedChannel = -1
  , query = ""
  }


init : ( Model , Cmd Msg )
init = (initialModel, Cmd.none)

-- UPDATE
type Msg
  = NoOp
  | Filter String
  | Select Int

update: Msg -> Model -> ( Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      ( model, Cmd.none )

    Filter query ->
      ( { model | query = query }, Cmd.none)

    Select index ->
      ( { model | selectedChannel = index }, Cmd.none)


-- VIEW
filterChannels : List String -> String -> List String
filterChannels channels query =
  let
    containsCaseInsensitive str1 str2 =
      String.contains (String.toLower str1) (String.toLower str2)
  in
    List.filter (containsCaseInsensitive query) channels

renderChannel : String -> Html Msg
renderChannel name =
  li [ class "collection-item" ] [ text <| "#" ++ name ]

renderChannels : List String -> Html Msg
renderChannels channels =
  let
    channelItems = List.map renderChannel channels
  in
    ul [ class "collection" ] channelItems

view : Model -> Html Msg
view model =
  div [ class "card-panel" ] [
    input [ onInput Filter ] [],
    renderChannels (filterChannels model.channels model.query)
  ]
