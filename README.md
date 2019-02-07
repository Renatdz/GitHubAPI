# GitHubAPI
This is a learning repository to apply all my studies

* ## Index
	* ### [Appearance](#appearance) 
        * ### [Installation](#installation)
        * ### [Tests & Coverage](#tests-&-coverage)
        * ### [Libs](#libs) 
        * ### [Comments](#comments)


## Appearance

![All Text](https://i.imgur.com/7CpvoGN.png)


## Installation

This project uses [Bundler](http://bundler.io) and [Carthage](https://cocoapods.org). So run the following commands to install it.

`brew install carthage`

`bundle`

`carthage update --platform iOS --no-use-binaries`

## Tests & Coverage

You can run all tests anytime. Just run the following command on your terminal.

`bundle exec fastlane test`

## Libs

This project uses the libraries below:

[Alamofire](https://github.com/Alamofire/alamofire) - Used on network layer

[Reusable](https://github.com/AliSoftware/Reusable) - Used to create cells in order to facilitate the 'Register/Dequeue'.

[SwiftLint](https://github.com/realm/SwiftLint) - Used to reinforces the good practices of the swift.

[Toast](https://github.com/scalessec/Toast-Swift) - Used to create alerts like the Toast alert on Android.

[UIInfiniteScroll](https://github.com/pronebird/UIScrollView-InfiniteScroll) - Used to create an infinite scroll in tableView.

[Quick](https://github.com/Quick/Quick) - Used to create more readable tests.

[Nimble](https://github.com/Quick/Nimble) - Used to create more readable tests.

[Nimble-Snapshots](https://github.com/ashfurrow/Nimble-Snapshots) - Used to record snapshots to identify changes in their layout.


## Comments

- Tests using Nimble-Snapshots must run on iPhone SE (12.1), because the tests were written to this setup.

- I used the MVP pattern because I was already studying it.
