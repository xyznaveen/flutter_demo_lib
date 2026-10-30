# flutter_demo_lib_naveen

Global standard: /home/naveen/prod/nai/AGENTS.md and docs/agents/*.md apply in
full (standard v1.3.0); this file records project-specific rules, including the
tests default.

## Project rules

- **Tests: off.** This repository exists to exercise the pub.dev publishing flow,
  so verification is `dart analyze`, `dart format --set-exit-if-changed .`, and
  `dart pub publish --dry-run`.
- **Platforms: Android and iOS only.** Do not add web, desktop, or macOS/Linux/
  Windows platform folders.
- **Publishing:** pub.dev package `flutter_demo_lib_naveen`, published only from
  the manual `workflow_dispatch` workflow on `master`/`main`. It uses the
  `PUB_CREDENTIALS_B64` secret, not OIDC, so no tag is required. The version
  input must match `pubspec.yaml`. Never print or commit the credential.
- **Keep the iOS names aligned:** the podspec file, Swift package directory,
  package name, and library product must follow the Dart package name.
