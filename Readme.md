# The Roundtable

>The bustling hub area that exists outside of the Lands Between. A place to mingle with other adventurerers, craftsmen, resupply and discover a trove of blessings and rooms of secrets. [Source](https://eldenring.wiki.fextralife.com/Roundtable+Hold)

An Elden Ring companion iOS application in SwiftUI. 
This is built using this perfect [API](https://eldenring.fanapis.com/api/graphql) from [this repository](https://github.com/deliton/eldenring-api). I can't thank [Deliton](https://github.com/deliton) enough who did all the hard work and motivated me to start this app.

## What is it? 
This is a companion application for the masterpiece of a video game that is Elden Ring.
In its complete state (one day) it'll feature a searchable index of all the items, sorceries, incantations, creatures, etc... from the game, alongside a map with some easy to use tools for notes taking. 
The ideas is not to spoil, but to help you organize your adventures in this vast open world.

## Tech
While being a useful app (well not really for now), this is also a good showcase of how I like to buid modern iOS application. 
We use a variant of this architecture at [Medium](https://jobs.lever.co/medium).

* Heavy usage of Swift packages. 
    * Why? It's easier to build and tests independant features / parts of the app.
    * A Networking package which wrap the [Apollo iOS](https://www.apollographql.com/docs/ios/) client into an async / await API. 
    * A codegen package which is based on [Apollo codegen](https://www.apollographql.com/docs/ios/swift-scripting/) example, which you can run from the Swift command line to generate all GraphQL models in ApolloModels package.
    * A SharedUI package which contains all the colors and shared components that are reusable across features packages + within the app. 
    * Various features oriented packages. (For now only the items feature).
* Fully in SwitUI. 
* Heavy use of new Swift features like Concurrency.
* Less is more, how to achieve a good amount of features with the less amount of code possible.

## How to use? 
For now you just have to clone the repository then build & run the main target. 

## How to contribute? 
At this stage it might be too early, but any contributions is more than welcome!

To generate newly added .graphql file: 

`cd Modules/ApolloCodegen`

`swift run ApolloCodegen all`