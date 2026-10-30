#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_demo_lib_naveen.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_demo_lib_naveen'
  s.version          = '0.0.2'
  s.summary          = 'A minimal Flutter plugin for Android and iOS.'
  s.description      = <<-DESC
A minimal Flutter plugin used to test the pub.dev publishing flow.
                       DESC
  s.homepage         = 'https://github.com/xyznaveen/flutter_demo_lib'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Naveen Niraula' => 'subtlenv@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'flutter_demo_lib_naveen/Sources/flutter_demo_lib_naveen/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '15.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'flutter_demo_lib_naveen_privacy' => ['flutter_demo_lib_naveen/Sources/flutter_demo_lib_naveen/PrivacyInfo.xcprivacy']}
end
