#
# Be sure to run `pod lib lint AwesomeBadge.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AwesomeBadge'
  s.version          = '0.1.0'
  s.summary          = 'a view class as Like a badge using fontawesome 5.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  a view class as Like a badge using fontawesome 5. As a use, remuneration etc. at the mission reward of the game app etc.
                       DESC

  s.homepage         = 'https://github.com/kazuomatz/AwesomeBadge'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kazuomatz' => 'getlasterror@gmail.com' }
  s.source           = { :git => 'https://github.com/kazuomatz/AwesomeBadge.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/kazuomatz'

  s.source_files = 'Classes/**/*'
  s.ios.deployment_target = '11.0'
  s.dependency 'FontAwesome.swift'
  s.frameworks = 'UIKit'
end
