<img align="left" src="https://designercastle.com/wp-content/uploads/2023/08/aymen-ali-icon.png" width="480" height="440" />

<div>
  <a href="https://designercastle.com" align="left"><img src="https://designercastle.com/wp-content/uploads/2023/08/aymen-ali-icon.png"></a>
  <p>
    <h1 align="left">Message App</h1>
  </p>
  <p>
A Flutter-based messaging application demonstrating efficient use of Firebase for real-time data handling, including user authentication, messaging, and notifications. This template showcases clean architecture, responsive design, state management, dependency injection, and extensive testing (widget, unit, and integration tests), with added focus on Firebase integration for a complete messaging solution.
  </p>

---

  <p>
    <h4>
      Expert teams of digital product strategists, developers, and designers.
    </h4>
  </p>

  <div>
    <a href="https://designercastle.com" target="_blank">
      <img src="https://uploads-ssl.webflow.com/5ee36ce1473112550f1e1739/5f6ae88b9005f9ed382fb2a5_button_get_in_touch.svg" width="121" height="34">
    </a>
    <a href="https://github.com/aymentucker/" target="_blank">
      <img src="https://uploads-ssl.webflow.com/5ee36ce1473112550f1e1739/5f6ae88bb1958c3253756c39_button_follow_on_github.svg" width="168" height="34">
    </a>
  </div>

---

<span>We’re always looking for people who value their work, so come and join us. <a href="https://designercastle.com">We are hiring!</a></span>

</div>

![CI](https://github.com/wednesday-solutions/flutter_template/actions/workflows/ci.yml/badge.svg)

## Features

- Firebase Authentication: Secure user authentication.
- Cloud Firestore: Real-time database for messages and user data.
- Firebase Cloud Messaging (FCM): Push notifications to keep users engaged.
- Material 3 Dynamic Theming: Beautiful UI with dynamic theming capabilities.
- Continuous Integration (CI) and Continuous Deployment (CD): Automated workflows for efficient development cycles.

## Getting Started

Clone the repo and follow these steps to setup the project.

#### Environment
This application requires Flutter 3 or greater and Dart 2.19.2 or greater, with null safety support. Ensure you have Firebase set up for your project to utilize its services fully.

Set up your <a herf="https://docs.flutter.dev/get-started/install">Flutter environment</a> and <a herf="https://firebase.google.com/docs/flutter/setup?platform=android">add Firebase to your Flutter app</a> following these guides.

#### Flutter

First and foremost make sure you have Flutter 3 setup on your system.
You can check the version by running

```bash
flutter --version
```

You should see output similar to this. Check if the version is `3.x.x`.

```bash
Flutter 3.7.7 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 2ad6cd72c0 (13 days ago) • 2023-03-08 09:41:59 -0800
Engine • revision 1837b5be5f
Tools • Dart 2.19.4 • DevTools 2.20.1
```

If not run this command to update flutter to the latest version

```bash
flutter upgrade
```

#### Get Dependencies

```shell
flutter pub get
```
#### Flutter
Before running the app, you'll need to create a Firebase project and add your app's Android and iOS configurations:

1- Create a Firebase project: Visit the Firebase Console to create a new project.
2- Register your app with Firebase: Add your Android and iOS app details. Download the google-services.json and GoogleService-Info.plist files and add them to your app's respective directories.
3- Enable Firebase services: Make sure to enable Authentication, Firestore, and FCM in the Firebase Console.

## Running the app

With the setup done, we can get the app running.
```shell
flutter pub get
```

Then, launch your app with support for different flavors (dev, qa, prod) using:
```shell
flutter run --flavor dev -t lib/main_dev.dart
```

## Architecture

This app is built using a clean architecture approach to ensure separation of concerns and scalability. It includes the following layers:

- Presentation Layer (lib/presentation): Contains UI components like screens and widgets, managing state with Provider and Riverpod.
- Data Layer (lib/data): Handles data from Firebase and other external services.
- Service Layer (lib/services): Abstracts Firebase services for authentication, database, and notifications.

## Understanding the Presentation Layer

The presentation layer houses all the visual components and state management logic.

The [`base`](lib/presentation/base) directory has all the reusable and common elements used as building blocks for the UI like common widgets, app theme data, exceptions, base view models etc.

### View Model

State Management is done using the [`riverpod`](https://riverpod.dev/) along with [`state_notifier`](https://pub.dev/packages/state_notifier). The class that manages state is called the `View Model`.

Each `View Model` is a subclass of the `BaseViewModel`. The [`BaseViewModel`](lib/presentation/base/view_model_provider/base_view_model.dart) is a `StateNotifier` of [`ScreenState`](#screen-state). Along with the ScreenState it also exposes a stream of [`Effect`](#effect).

Implementations of the BaseViewModel can also choose to handle [`Intents`](#intent).

### Screen State

[`ScreenState`](lib/presentation/entity/screen/screen_state.dart) encapsulates all the state required by a [`Page`](#page). State is any data that represents the current situation of a Page.

For example, the [`HomeScreenState`](lib/presentation/destinations/weather/home/home_screen_state.dart) holds the state required by the [`HomePage`](lib/presentation/destinations/weather/home/home_page.dart).

### Widgets

Each destination has a `widgets` directory. It holds all the widgets that appear on a [`Page`](#page) excluding the page itself.

Each widget the requires access to data from the view model it split into two dart files. The `connector widget` communicates with the view model, and the `content widget` has the actual UI. The connector widget passes all the required data to the content widget. Thus the content widget never depends on the state managent solution used. This helps in easy replacement of state management solution if needed and also makes it easier to test widgets.

### Screen

A [`Screen`](lib/presentation/entity/screen/screen.dart) is a class that represents a `Page` in the context of navigation. It holds the `path` used by the navigator to navigate to a `Page` and also holds any arguments required to navigate to that `Page`.


## Firebase Integration

#### Authentication

The app uses Firebase Authentication for managing user sign-in and sign-up processes. User authentication state is handled globally to manage user sessions effectively.

#### Firestore Database

All messages and conversations are stored in Cloud Firestore, allowing real-time updates to the app without requiring manual refreshes.

#### Cloud Messaging

FCM is integrated to send notifications about new messages or events, enhancing user engagement.



## Testing

The project includes comprehensive tests:

- Unit Tests: Logic testing for use cases and services.
- Widget Tests: UI testing for individual widgets.
- Integration Tests: End-to-end testing of critical app flows.

The test coverage and code quality reporting is done using [`sonarqube`](https://docs.sonarqube.org/latest/).
You can read the documentation about integrating `sonarqube` in you CI workflow [here](https://docs.sonarqube.org/latest/devops-platform-integration/github-integration/#analyzing-projects-with-github-actions).

## Content

The Flutter Template contains:

- A [`Flutter`](https://flutter.dev/) application.
- Built-in support for 3 [`flavors`](https://docs.flutter.dev/deployment/flavors) - `dev`, `qa` and `prod`.
- A [`reactive base architecture`](#architecture) for your application.
- [`Riverpod`](https://riverpod.dev/) along with [`state_notifier`](https://pub.dev/packages/state_notifier) for state management.
- [`Drift`](https://drift.simonbinder.eu/) as local database for storage.
- [`Dio`](https://github.com/flutterchina/dio) for making API calls.
- [`Freezed`](https://pub.dev/packages/freezed) for data class functionality.
- [`Get It`](https://pub.dev/packages/get_it) for dependency injection.
- [`Flutter Lints`](https://pub.dev/packages/flutter_lints) for linting.
- [`derry`](https://pub.dev/packages/derry) for script management.
- [`mason`](https://pub.dev/packages/mason_cli) for templating.
- [`sonarqube`](https://docs.sonarqube.org/latest/) for code inspection.

The template contains an example (displaying weather data) with responsive widgets, reactive state management, offline storage and api calls.

## Continuous Integration and Deployment

The Flutter template comes with built-in support for CI/CD using Github Actions.

### CI/CD

GitHub Actions are configured for continuous integration and deployment, automating lint checks, tests, and builds for Android and iOS.

### Android CD setup

For the android CD workflow to run, we need to perform the following setup steps:

- Follow these instructions to [generate an upload keystore](https://developer.android.com/studio/publish/app-signing#generate-key). Note down the `store password`, `key alias` and `key password`. You will need these in later steps.
- Use `openssl` to convert the `jks` file to `Base64`.

```shell
openssl base64 < flutter_template_keystore.jks | tr -d '\n' | tee flutter_template_keystore_encoded.txt
```

- Store the `base64` output on [`Github Secrets`](https://docs.github.com/en/actions/security-guides/encrypted-secrets) with the key name `KEYSTORE`.
- Save the `store password` in github secrets with the key name `RELEASE_STORE_PASSWORD`.
- Save the `key alias` in github secrets with the key name `RELEASE_KEY_ALIAS`.
- Save the `key password` in github secrets with the key name `RELEASE_KEY_PASSWORD`.
- [Create a distribution on app center](https://docs.microsoft.com/en-us/appcenter/distribution/) and get the upload key. You can get it from appcenter.ms/settings.
- Save the app center upload key on github secrets with key name `APP_CENTER_TOKEN`.

### IOS CD Setup

For the IOS job in the `cd.yml` to run, you first need to have a valid [Apple Developer Account](https://developer.apple.com/).If you don't have it yet, please create one before proceeding further

We will divide the guide into steps so that it is easier to understand

#### Step 1: Setup on the AppStore

- Register your `Bundle ID`. You can view the official Flutter guide [here](https://docs.flutter.dev/deployment/ios#register-a-bundle-id)
  > CAUTION: Apple doesn't allow underscore in the bundle identifier. Read about valid identifiers [here](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleidentifier)
- Create an application on the AppStore Connect Portal. Check out the official guide [here](https://docs.flutter.dev/deployment/ios#create-an-application-record-on-app-store-connect)

#### Step 2: Getting a Distribution Certificate and Provisioning Profile

- Create a `Distribution Certificate` for your machine locally once. You can refer to [this](https://support.magplus.com/hc/en-us/articles/203808748-iOS-Creating-a-Distribution-Certificate-and-p12-File) guide. Download the `.p12` file for use later. Remember the password used to create this certificate as we will need this later
- Create a `Provisioning Profile` for your `Bundle ID` you registered above. You can refer to [this](https://support.staffbase.com/hc/en-us/articles/115003598691-Creating-the-iOS-Provisioning-Profiles) guide. Download the profile for use later.

#### Step 3: Getting the options.plist

- In the following template
  - Replace `BUNDLE ID` with your `Bundle Identifier` (You got that already from Step 1)
  - Replace `PROVISIONING PROFILE NAME` with your Provisioning Profile Name (You already created one in Step 2, use that)
  - Replace `TEAM_ID` with your team id. Look at [this](https://stackoverflow.com/a/18727947) answer on "How to find your Team ID"
  <details>
  <summary><i>Click to View Template</i></summary>

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>generateAppStoreInformation</key>
	<false/>
	<key>manageAppVersionAndBuildNumber</key>
	<true/>
	<key>method</key>
	<string>app-store</string>
	<key>provisioningProfiles</key>
	<dict>
		<key>BUNDLE-ID</key>
		<string>PROVISION PROFILE NAME</string>
	</dict>
	<key>signingCertificate</key>
	<string>Apple Distribution</string>
	<key>signingStyle</key>
	<string>manual</string>
	<key>stripSwiftSymbols</key>
	<true/>
	<key>teamID</key>
	<string>TEAM_ID</string>
	<key>uploadBitcode</key>
	<false/>
	<key>uploadSymbols</key>
	<true/>
</dict>
</plist>
```

</details>

- Create a new file called `options.plist` and save the above contents in that file

#### Step 4: Making an app specific password

- Read the [official guide](https://support.apple.com/en-us/HT204397) to create an app specific password and remember it(;P)
- The pipeline uses this password to upload an ipa to testflight

#### Step 5: Bringing it all together

- Add the following keys to [Github Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
  - `BUILD_CERTIFICATE_BASE64` : The base64 of the p12 file we generated(Step 2)
  - `P12_PASSWORD`: The password of the p12 certificate generated above in Step 2
  - `BUILD_PROVISION_PROFILE_BASE64`: The provisioning profile in base64(Step 2)
  - `KEYCHAIN_PASSWORD` : The password used to store the keychain in the local keystore of the Github Runner(Any random value)
  - `IOS_PLIST`: The options.plist file needed to make an ipa out of the xcarchive generated by flutter(Step 3)
  - `APPSTORE_PASSWORD`: The password passed to altool to upload the ipa to the store(Step 4)
- To generate a base64 string, use the following command, replacing `FILENAME` with your filename

```shell
openssl base64 < FILENAME | tr -d '\n' | tee ENCODED_FILENAME.txt
```

### Pushing to protected branches

- If the branches that you will be running CD on are protected, you will need to use a [`Personal Access Token (PAT)`](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) to commit the version changes.
- After creating the `PAT`, exclude the account that the token belongs to from the [`branch protection rules`](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/managing-a-branch-protection-rule#creating-a-branch-protection-rule).
- Save the token in github secrets and update the key name in the `cd.yml` file under each `checkout` action.
- Since our `CD` workflow is triggered on a push, and we create a new commit in the workflow itself, the commit message created by the `CD` workflow includes `[skip ci]` tag so that the workflow does not end up in an infinite loop. Read more about this [here](https://docs.github.com/en/actions/managing-workflow-runs/skipping-workflow-runs)

**If you do not plan to use the CD workflow on protected branches, you can remove the token part from the checkout actions.**

## Gotchas

#### Refresh Rate

Flutter apps might have issues on some android devices with variable refresh rate where the app is locked at 60fps instead of running at the highest refresh rate. This might make your app look like it is running slower than other apps on the device. To fix this the template uses the [`flutter_displaymode`](https://pub.dev/packages/flutter_displaymode) package. The template sets the highest refresh rate available. If you don't want this behaviour you can remove the lines 40 to 46 in [`app.dart`](lib/app.dart#L40). [`Link to frame rate issue on flutter`](https://github.com/flutter/flutter/issues/35162).

#### Golden Tests

Golden test screenshots (goldens) are rendered using the rendering mechanisms on the os that you are running the tests on. Because of the slight differences in each os, the goldens generated on each os differ slightly from each other. Goldens generated on macos won't match exactly to the goldens generated on windows or linux and your tests will fail.
To work around this, make sure to generate goldens and run golden tests on a single os. This template uses macos as it's os of choice to deal with goldens. You will find that on [CI](.github/workflows/ci.yml), the golden tests are run on a macos host.

- `What if your team members use different operating systems for development?` - In that case, the devs not using your os of choice should have a way to generate goldens on your os of choice. This template has a [`update_goldens`](.github/workflows/update_goldens.yml) workflow that can be manually triggered on any branch. It will generate the golden files on macos and commit the changes to the same branch.

## License

This project is licensed under the MIT license. Check the [LICENSE](LICENSE) file for details.

## Creators

**Aymen Tucker**

- <https://github.com/aymentucker>

<a href='https://github.com/aymentucker' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://az743702.vo.msecnd.net/cdn/kofi4.png?v=0' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

## Thanks

Thanks to all contributors and their support:

## Acknowledgments

Thanks to all the developers and contributors to the Flutter and Firebase ecosystems for their invaluable resources and support.
