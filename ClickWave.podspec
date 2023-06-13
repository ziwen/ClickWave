#
# Be sure to run `pod lib lint EEOLMSFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#
source='https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git,https://cdn.cocoapods.org/'

Pod::Spec.new do |s|
  s.name             = 'ClickWave'
  s.version          = '0.0.3'
  s.summary          = 'ClickWave.'
  s.description      =  "ClickWave create by ZHAO XUESHU"
 #                       <<-DESC
 #                         ClickWave create by ZHAO XUESHU
 #                         DESC
 
# "ClickWave create by ZHAO XUESHU"

  s.homepage         = 'https://github.com/ziwen/ClickWave.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xueshu' => '1027046683.@qq.com' }
  s.source           = { :git => 'https://github.com/ziwen/ClickWave.git', :tag => s.version.to_s }

  s.source_files = "Wave/*.{h,m,swift,c,mm,hpp,hxx,cpp,cc,cxx,C,c++}"
  
  s.ios.deployment_target = '11.0'

  s.static_framework = true
  
  s.user_target_xcconfig = {
     'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'VALID_ARCHS' => 'arm64',
   }

  s.xcconfig = {
    'TARGETS_DEVICE_FAMILY' => '1,2',
    'ENABLE_BITCODE' => 'NO',
  }
  
  s.pod_target_xcconfig = {
    'VALID_ARCHS' => 'arm64',
    'VALID_ARCHS[sdk=iphonesimulator*]' => ' ' #跳过模拟器验证
  }

end
