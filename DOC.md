# Thulani Pokedex Home assignment

## Instructions to run the app
==> FLutter version: stable 3.3.8
1. After cloning the repo, make sure you have the latest Flutter version installed (In this case v3.3.8).
2. After opening project on terminal run: "flutter pub get" to install dependencies.
3. To run unit tests, run: "flutter test" from the root of the project directory.
4. Now if you do not have any errors you must be ready to run. Please note that I have tested on IOS version 16.1 (iOS Simulator) and Pixel 3A Emulator (API v33) Android 13.
   
## Used libraries with versions:
http: ^0.13.5
percent_indicator: ^4.2.2
flutter_bloc: ^8.0.1
shared_preferences: ^2.0.15
equatable: ^2.0.5
intl: ^0.17.0
bloc_concurrency: ^0.2.0

## References
1. - https://petercoding.com/flutter/2022/02/27/using-bloc-pattern-in-flutter/
2. - https://bloclibrary.dev/#/flutterinfinitelisttutorial?id=presentation-layer
3. - https://medium.com/@diegoveloper/flutter-lets-know-the-scrollcontroller-and-scrollnotification-652b2685a4ac
4. [Cross-Platform UIs with Flutter - by Ryan Edge & Alberto Miola](https://www.packtpub.com/product/cross-platform-uis-with-flutter/9781801810494)

## Recommeded Improvements
If I had more time, I would have love to work on:
1. Using the clean architecture for a more managed folder and file structure for much more easier readability.
2. I would love to write more thourough tests for Widgets, right now its only has Unit tests for the repository.
3. Add an App Icon
4. Implement Splash Screen and Routing in a better standard than is now.
5. Used native Widgets so as to give the App a more native feel depending on the Operating System its running on.
6. Add a loader on "All Pokemon" screen when the app is fetching Pokemons from the next page and offset.
7. Spend a little more time on testing on a lot more different screens and OS versions.
