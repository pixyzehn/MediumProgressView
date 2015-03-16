Pod::Spec.new do |s|
  s.name = "MediumProgressView"
  s.version = "1.0.0"
  s.summary = "A progress view based on Medium web app."
  s.homepage = 'https://github.com/pixyzehn/MediumProgressView'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.author = { "Nagasawa Hiroki" => "civokjots10.pico@gmail.com" }

s.requires_arc = true
s.ios.deployment_target = "8.0"
s.source = { :git => "https://github.com/pixyzehn/MediumProgressView.git", :tag => "#{s.version}" }
s.source_files = "MediumProgressView/*.swift"
end

