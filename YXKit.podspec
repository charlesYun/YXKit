
Pod::Spec.new do |s|
  s.name         = "YXKit"
  s.version      = "0.0.4"
  s.summary      = "caoyunxiao"
  s.description  = <<-DESC
                   caoyunxiao All rights reserved
                   DESC
  s.homepage     = "https://github.com/caoyunxiao/YXKit.git"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'caoyunxiao' => '1105938518@qq.com' }
  s.source       = { :git => "https://github.com/caoyunxiao/YXKit.git", :tag => "0.0.4" }
  s.ios.deployment_target = '8.0'
  s.source_files = "YXKit/**/*"

end