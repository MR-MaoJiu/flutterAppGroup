#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_app_group.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_app_group'
  s.version          = '0.0.1'
  s.summary          = '这是一个iOS使用的AppGroup插件用于设备间数据共享'
  s.description      = <<-DESC
这是一个iOS使用的AppGroup插件用于设备间数据共享
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
