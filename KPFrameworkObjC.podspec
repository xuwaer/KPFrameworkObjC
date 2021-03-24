#
# Be sure to run `pod lib lint KPFrameworkObjC.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KPFrameworkObjC'
  s.version          = '1.1.6'
  s.summary          = 'A short description of KPFrameworkObjC.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
KPFramework for ObjC
                       DESC

  s.homepage         = 'https://github.com/xuwaer/KPFrameworkObjC.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xuwaer@gmail.com' => 'xuwaer@126.com' }
  s.source           = { :git => 'https://github.com/xuwaer/KPFrameworkObjC.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'KPFrameworkObjC/Classes/**/*'
  
  s.dependency 'Reachability', '~> 3.2'

  s.compiler_flags = '-Wunused-variable', '-Wdocumentation', '-Wdeprecated-declarations', '-Wunused-comparison'

#  s.subspec 'Foundation' do |f|
#    f.source_files = 'KPFrameworkObjC/Classes/Foundation/**/*'
#    f.dependency 'Reachability', '~> 3.2'
#    f.dependency 'KPFrameworkObjC/Macro'
#  end
#
#  s.subspec 'UIKit' do |u|
#    u.source_files = 'KPFrameworkObjC/Classes/UIKit/**/*'
#    u.dependency 'KPFrameworkObjC/Macro'
#  end
#
#  s.subspec 'Constant' do |c|
#      c.source_files = 'KPFrameworkObjC/Classes/Constant/**/*'
#      c.dependency 'KPFrameworkObjC/Macro'
#  end
#
#  s.subspec 'Macro' do |m|
#    m.source_files = 'KPFrameworkObjC/Classes/Macro/**/*'
#  end

end
