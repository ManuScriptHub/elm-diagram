module Basic exposing (..)

import Graph exposing (Graph, Node, NodeContext, NodeId, Edge, Adjacency)
import Html.App as App
import Visuals.GraphListView exposing (init, view, update)


sample : ( Graph String (), { b | label : a } -> a )
sample =
    ( Graph.fromNodeLabelsAndEdgePairs [ "21", "22", "23", "24" ]
        [ ( 0, 1 ), ( 0, 2 ), ( 2, 3 ), ( 0, 3 ) ]
    , (\x -> x.label)
    )


main : Program Never
main =
    let
        ( g, fn ) =
            sample
    in
        App.program
            { init = init g fn
            , view = view
            , update = update
            , subscriptions = (\_ -> Sub.none)
            }
