Pod::Spec.new do |s|
  s.name             = 'BDScrollView'
  s.version          = '0.1.10'
  s.summary          = 'BDScrollView'
  s.description      = 'horizontal scroll view'

  s.homepage         = 'https://github.com/williamjoseph/BDScrollView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'williamjoseph' => 'scocsdn@gmail.com' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform        = :ios
  s.ios.deployment_target = '8.0'

  s.source           = { :git => 'https://github.com/williamjoseph/BDScrollView.git', :tag => s.version }

  s.frameworks = 'Foundation', 'UIKit'
  s.vendored_frameworks = 'BDScrollView.framework'
  s.dependency 'MJRefresh'

  s.requires_arc = true

end
