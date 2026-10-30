# flutter_demo_lib

A minimal Flutter plugin for Android and iOS. It exists to test the pub.dev
publishing flow from GitHub Actions: two method-channel calls, no other
dependencies.

Repository: https://github.com/xyznaveen/flutter_demo_lib

## What it does

```dart
import 'package:flutter_demo_lib/flutter_demo_lib.dart';

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

## Run the CI on GitHub

Open https://github.com/xyznaveen/flutter_demo_lib/actions and pick a workflow:

- **CI** runs automatically on every push to `main` or `master`, on pull
  requests, and on demand with **Run workflow**. It checks formatting, analyzes,
  validates the package, and builds the example for Android and iOS.
- **Publish dry run** is manual only. It runs the same validation and archive
  packaging as the real publish, with no upload to pub.dev.

Version `0.0.1` already exists on pub.dev, so this repository starts at `0.0.2`.
The package is currently marked discontinued there. Publishing still works, but
re-enable it from the admin tab if you want the new version listed.

## Enable automated publishing

On `https://pub.dev/packages/flutter_demo_lib/admin`:

1. Open **Automated publishing**.
2. Enable **publishing from GitHub Actions** (or update the existing entry).
3. Repository: `xyznaveen/flutter_demo_lib`.
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

## License

MIT
