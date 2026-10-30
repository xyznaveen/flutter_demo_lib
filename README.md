# flutter_demo_lib_naveen

A minimal Flutter plugin for Android and iOS. It exists to test the pub.dev
publishing flow from GitHub Actions: two method-channel calls, no other
dependencies.

- pub.dev: https://pub.dev/packages/flutter_demo_lib_naveen
- Repository: https://github.com/xyznaveen/flutter_demo_lib

The older `flutter_demo_lib` package is separate and is not touched by this
repository.

## What it does

```dart
import 'package:flutter_demo_lib_naveen/flutter_demo_lib_naveen.dart';

const plugin = FlutterDemoLib();

final platform = await plugin.getPlatformVersion(); // "Android 15" / "iOS 18.1"
final greeting = await plugin.greet('Naveen');      // "Hello, Naveen from Android 15"
```

## Run the example locally

```sh
flutter pub get
cd example
flutter run
```

The Android application id (`dev.naveen.flutter_demo_lib`) and iOS bundle id are
fine for a test package. Change them if you want your own namespace.

## First publish is manual

pub.dev only enables automated publishing for packages that already exist, so
`0.0.1` must be published from your machine:

```sh
flutter pub publish --dry-run
flutter pub publish
```

Do not push a `v0.0.1` tag before this step. The publish workflow would try to
publish a version that is already gone, and automated publishing is not enabled
yet.

## Enable automated publishing

After `0.0.1` is live, open
`https://pub.dev/packages/flutter_demo_lib_naveen/admin`:

1. Open **Automated publishing**.
2. Enable **publishing from GitHub Actions**.
3. Repository: `xyznaveen/flutter_demo_lib`.
4. Tag pattern: `v{{version}}`.
5. Optional: enable **Require GitHub Actions environment** and use the name
   `pub.dev`. The workflow already passes that environment.

No `PUB_TOKEN` secret is stored in the repository. The publish job authenticates
with the GitHub OIDC token.

## Release a new version from GitHub

Bump `version` in `pubspec.yaml` (for example to `0.0.2`), update
`CHANGELOG.md`, commit, then push a matching tag:

```sh
git tag v0.0.2
git push origin v0.0.2
```

`.github/workflows/publish.yml` runs on `v[0-9]+.[0-9]+.[0-9]+` tags. A guard
job fails fast when the tag and the `pubspec.yaml` version differ. It then calls
the `dart-lang/setup-dart` reusable publish workflow, which publishes to pub.dev.

## Run the CI on GitHub

Open https://github.com/xyznaveen/flutter_demo_lib/actions and pick a workflow:

- **CI** runs automatically on every push to `main` or `master`, on pull
  requests, and on demand with **Run workflow**. It checks formatting, analyzes,
  validates the package, and builds the example for Android and iOS.
- **Publish dry run** is manual only. It runs the same validation and archive
  packaging as the real publish, with no upload to pub.dev.

## License

MIT
