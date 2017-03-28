# Meet the Team project

This is an assignment. I was given 24 hours to write this smiple app and the only thing that was provided to me is `team.json` file. All links to photos were located in the file.
Another requirement was: not using storyboards or .XIB files to design UI. It has to be all done in code.

To launch the project, use `Meet the Team.xcworkspace` (not `Meet the Team.xcodeproj` because I am using Cocoapods)

## Screenshots
![screenshot1](/screenshots/screen1.png "screenshot1")
![screenshot2](/screenshots/screen2.png "screenshot2")

## Implementation notes:

I used following dependencies:

- [AlamofireImage](https://github.com/Alamofire/AlamofireImage) to download images over the network

- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) helps to work with JSON


The app works in Portrait & Landscape mode.

All the networking is placed in one struct `NetworkManager.swift` which has all the public API methods to handle networking calls througout the app. This abstractions patterns is preferred to forsee the possible changes of the server API.

`NetworkManagerError` handles possible networking errors and works together with `handleNetworkManagerErrors` extension to display errors in anything that inherits from `UIViewController` class.

Avatar images are downloaded asyncroniously and later stored in global property `imageCache` for reuse.

`TeamListTableViewCell` is being reused for both "MeetList" and "TeamMemberDetails" functionality.

## Design notes:
The app is Black-And-White to focus on functionality. But it can be easily splashed with your logo colors.

I used font `HelveticaNeue` and sizes are 14 and 20pts, which are proportional according "golden section rules".
