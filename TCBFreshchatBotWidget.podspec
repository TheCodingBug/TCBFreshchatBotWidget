#
# Be sure to run `pod lib lint TCBFreshchatBotWidget.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TCBFreshchatBotWidget'
  s.version          = '0.1.0'
  s.summary          = 'TCBFreshchatBotWidget is more than just a wrapper/helper widget for Freshchat Bot - Freddy Self-service integration.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  `TCBFreshchatBotWidget` is more than just a wrapper/helper widget for Freshchat Bot - Freddy Self-service integration. TCBFreshchatBotWidget will help you set it up with ease.
                       DESC

  s.homepage         = 'https://github.com/TheCodingBug/TCBFreshchatBotWidget'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Neil Francis Ramirez Hipona' => 'nferocious76@gmail.com' }
  s.source           = { :git => 'https://github.com/TheCodingBug/TCBFreshchatBotWidget.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/nferocious76'

  s.ios.deployment_target = '9.0'
  s.swift_version = '5.0'
  s.source_files = 'TCBFreshchatBotWidget/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TCBFreshchatBotWidget' => ['TCBFreshchatBotWidget/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
