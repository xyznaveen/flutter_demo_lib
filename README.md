# flutter_demo_lib

A minimal Flutter plugin for Android and iOS. It exists to test the pub.dev
publishing flow from GitHub Actions: two method-channel calls, no other
dependencies.

## What it does

```dart
import 'package:flutter_demo_lib/flutter_demo_lib.dart';

const plugin = FlutterDemoLib();

final platform = await plugin.getPlatformVersion(); // "Android 15" / "iOS 18.1"
final greeting = await plugin.greet('Naveen');      // "Hello, Naveen from Android 15"
```

## Run the example

```sh
flutter pub get
cd example
flutter run
```

## Before pushing to GitHub

1. Replace `YOUR_GITHUB_USER` in `pubspec.yaml` and
   `ios/flutter_demo_lib.podspec` with your GitHub handle. Replace `YOUR_NAME`
   in the podspec.
2. Push the repository to GitHub.
3. The Android application id (`dev.naveen.flutter_demo_lib`) and iOS bundle id
   are fine for a test package. Change them if you want your own namespace.
4. Version `0.0.1` already exists on pub.dev, so this repository starts at
   `0.0.2`.
5. The package is currently marked discontinued on pub.dev. Publishing still
   works, but re-enable it from the admin tab if you want the new version
   listed.

## Enable automated publishing

On `https://pub.dev/packages/flutter_demo_lib/admin`:

1. Open **Automated publishing**.
2. Enable **publishing from GitHub Actions** (or update the existing entry).
3. Repository: `<your-github-user>/flutter_demo_lib`.
4. Tag pattern: `v{{version}}`.
5. Optional: enable **Require GitHub Actions environment** and use the name
   `pub.dev`. The workflow already passes that environment.

No `PUB_TOKEN` secret is stored in the repository. The publish job authenticates
with the GitHub OIDC token.

## Release a new version

Bump `version` in `pubspec.yaml`, update `CHANGELOG.md`, commit, then push a
matching tag:

```sh
git tag v0.0.2
git push origin v0.0.2
```

`.github/workflows/publish.yml` runs on `v[0-9]+.[0-9]+.[0-9]+` tags. A guard
job fails fast when the tag and the `pubspec.yaml` version differ. It then calls
the `dart-lang/setup-dart` reusable publish workflow, which publishes to pub.dev.

## CI

`.github/workflows/ci.yml` runs on every push to `main` and on pull requests:

- `dart format --set-exit-if-changed .`
- `flutter analyze`
- `dart pub publish --dry-run`
- Android release build of the example app
- iOS release build of the example app (no code signing)

## License

MIT
