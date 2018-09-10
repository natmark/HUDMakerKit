Pod::Spec.new do |s|
  s.name             = 'HUDMakerKit'
  s.version          = '0.2.1'
  s.summary          = 'Customized Head-Up Display Maker'
  s.description      = <<-DESC
  HUDMakerKit is customized Head-Up Display Maker written in Swift🐧.
  HUDMakerKit has ProcessingKit engine. You can develop custom HUD with Processing draw functions.
                       DESC

  s.homepage         = 'https://github.com/natmark/HUDMakerKit'
  s.screenshots     = 'https://github.com/natmark/HUDMakerKit/raw/master/Resources/header.png?raw=true'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Atsuya Sato' => 'natmark0918@gmail.com' }
  s.source           = { :git => 'https://github.com/natmark/HUDMakerKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'HUDMakerKit/**/*.swift'
  s.dependency "ProcessingKit/Core"
end
