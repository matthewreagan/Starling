# coding: utf-8
Pod::Spec.new do |spec|
  spec.name         = "Starling"
  spec.version      = "1.0.0"
  spec.summary      = "Simple low-latency audio library for iOS + macOS"
  spec.description  = <<-DESC
Starling is a simple audio library for iOS + macOS written in
Swift. It provides low-latency sound resource playback for games,
real-time media solutions, or other performance-critical
applications. It is built around Apple's AVAudioEngine and simplifies
the API in an effort to reduce the amount of boilerplate needed for
basic audio playback.
                   DESC

  spec.homepage     = "https://github.com/matthewreagan/Starling"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Matthew Reagan" => "humblebeesoft@gmail.com" }

  spec.ios.deployment_target = "11.0"
  spec.osx.deployment_target = "10.13"
  spec.swift_version = "5.0"

  spec.source       = { :git => "https://github.com/matthewreagan/Starling.git", :tag => "#{spec.version}" }

  spec.source_files  = "Starling/*.swift"

  spec.frameworks = "Foundation", "AVFoundation"
end
