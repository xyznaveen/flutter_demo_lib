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

## How publishing works

pub.dev only accepts a publish token from a tag ref. A manual dispatch from
`master` is a branch ref and is always rejected, so publishing is deliberate:
nothing is published on normal commits.

1. Bump `version` in `pubspec.yaml` and update `CHANGELOG.md`.
2. Commit and push to `master`.
3. Wait for the **CI** workflow to pass.
4. Create a GitHub Release with the tag `vX.Y.Z`, or push the tag directly:
   ```sh
   git tag v0.0.2
   git push origin v0.0.2
   ```
5. Approve the run if you enabled required reviewers on the `pub.dev`
   environment.

The tag push triggers **Publish to pub.dev**. The workflow first verifies that
the tag equals `v` plus the `pubspec.yaml` version, then uses the
`dart-lang/setup-dart` reusable publish workflow with OIDC. No `PUB_TOKEN`
secret is stored in the repository.

## pub.dev settings

On `https://pub.dev/packages/flutter_demo_lib_naveen/admin`, under
**Automated publishing**:

- Repository: `xyznaveen/flutter_demo_lib`
- Tag pattern: `v{{version}}`
- **Enable publishing from push events**: checked
- **Enable publishing from workflow_dispatch events**: unchecked
- Optional: **Require GitHub Actions environment**, name `pub.dev`

The environment is optional, but if you enable it, the name must be `pub.dev`
because that is what `.github/workflows/publish.yml` passes.

## CI

`.github/workflows/ci.yml` runs on every push to `main` or `master`, on pull
requests, and on demand with **Run workflow**:

- `dart format --set-exit-if-changed .`
- `flutter analyze`
- `dart pub publish --dry-run`
- Android release build of the example app
- iOS release build of the example app (no code signing)

`.github/workflows/publish-dry-run.yml` is manual and packages the plugin exactly
like the publish workflow without uploading anything.

## License

MIT
