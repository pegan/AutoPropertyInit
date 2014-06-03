Pod::Spec.new do |s|
  s.name     = 'AutoProperty'
  s.version  = '1.0.1'
  s.author   =  { 'Piotr Perzanowski' => 'p.m.perzanowski@gmail.com' }
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage = 'https://github.com/pegan/AutoPropertyInit'
  s.summary  = 'AutoProperty is an NSObject category that simplifies the process of initialize properties that are subclasses of NSObject.'
  s.source   = { :git => 'https://github.com/pegan/AutoPropertyInit.git', :tag => s.version.to_s }

  s.requires_arc = true

  s.source_files = 'AutoProperty/*.{h,m}'

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.6'
end
