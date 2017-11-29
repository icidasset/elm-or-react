module Slides.Samples exposing (..)

-- React


react : String
react =
    """
    // React Component

    const App = connect(
      // copy all redux state into props:
      (state) => state,
      // add "event handlers" to props:
      actions
    )(
      (props) => {
        return <p onClick={props.changeGreeting}>{props.greeting}</p>;
      }
    );


    const actions = (dispatch) => {
      return {
        changeGreeting() {
          return dispatch({ type: "CHANGE_GREETING", greeting: "👩\x200D🔬" });
        }
      };
    };



    // State

    const initialState = {
      greeting: "👨\x200D🚀"
    };


    const reducer = (state = initialState, { greeting, type }) => {
      switch (type) {
        case "CHANGE_GREETING":     return { ...state, greeting };
        default:                    return state;
      }
    };



    // Join Forces

    render(
      <Provider store={createStore(reducer)}>
        <App />
      </Provider>,
      document.body
    );
    """


reactSideBySide : String
reactSideBySide =
    """
    // React Component

    const App = connect(
      // copy all redux state into props:
      (state) => state,
      // add "event handlers" to props:
      actions
    )(
      (props) => {
        return <p onClick={props.changeGreeting}>{props.greeting}</p>;
      }
    );


    const actions = (dispatch) => {
      return {
        changeGreeting() {
          return dispatch({ type: "CHANGE_GREETING", greeting: "👩\x200D🔬" });
        }
      };
    };



    // State

    const initialState = {
      greeting: "👨\x200D🚀"
    };


    const reducer = (state = initialState, { greeting, type }) => {
      switch (type) {
        case "CHANGE_GREETING":     return { ...state, greeting };
        default:                    return state;
      }
    };










    // Join Forces

    render(
      <Provider store={createStore(reducer)}>
        <App />
      </Provider>,
      document.body
    );
    """



-- Elm


elm : String
elm =
    """
    -- Elm View

    view : Model -> Html Msg
    view model =
        Html.p
            [ onClick (ChangeGreeting "👩\x200D🔬") ]
            [ text model.greeting ]



    -- State

    type Model =
        { greeting : String }


    type Msg
        = ChangeGreeting String


    initialModel : Model
    initialModel =
        { greeting = "👨\x200D🚀" }


    update : Msg -> Model -> (Model, Cmd Msg)
    update msg model =
        case msg of
            ChangeGreeting greeting ->
                (,) { model | greeting = greeting } Cmd.none



    -- Join Forces

    Html.program
        { init = (initialModel, Cmd.none)
        , view = view
        , update = update
        , subscriptions = \\_ -> Sub.none
        }
    """


elmSideBySide : String
elmSideBySide =
    """
    -- Elm View

    view : Model -> Html Msg
    view model =
        Html.p
            [ onClick (ChangeGreeting "👩\x200D🔬") ]
            [ text model.greeting ]

















    -- State

    type Model =
        { greeting : String }


    type Msg
        = ChangeGreeting String


    initialModel : Model
    initialModel =
        { greeting = "👨\x200D🚀" }


    update : Msg -> Model -> (Model, Cmd Msg)
    update msg model =
        case msg of
            ChangeGreeting greeting ->
                (,) { model | greeting = greeting } Cmd.none



    -- Join Forces

    Html.program
        { init = (initialModel, Cmd.none)
        , view = view
        , update = update
        , subscriptions = \\_ -> Sub.none
        }
    """
