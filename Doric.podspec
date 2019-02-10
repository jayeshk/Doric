Pod::Spec.new do |s|
  s.name             = "Doric"
  s.version          = "1.0.0"
  s.summary          = "Doric is Design System foundation written in Swift. Protocol oriented and type safe scalable framework to create Design System."
  s.homepage         = "https://github.com/jayeshk/Doric"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "Jay K." => "mobilejay5@gmail.com" }
  s.source           = { :git => "https://github.com/jayeshk/Doric.git", :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.requires_arc = true
  s.source_files = 'Source/*.{swift}'
  s.resources = 'Source/**/*.{png}'
  s.frameworks = 'UIKit'
  s.swift_version = "4.2"

end
