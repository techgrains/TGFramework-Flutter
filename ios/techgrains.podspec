#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint techgrains.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'techgrains'
  s.version          = '1.0.2'
  s.summary          = 'Developer friendly app library having various commonly used functionality.'
  s.description      = <<-DESC
Developer friendly app library having various commonly used functionality.
                       DESC
  s.homepage         = 'https://github.com/techgrains/TGFramework-Flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Techgrains Technologies' => 'vishal@techgrains.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'intl'
  s.dependency 'shared_preferences'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
  s.swift_version = '5.0'
end
