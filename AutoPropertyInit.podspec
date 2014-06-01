Pod::Spec.new do |s|
  s.name     = 'AutoPropertyInit'
  s.version  = '1.0.0'
  s.author   =  { 'Piotr Perzanowski' => 'p.m.perzanowski@gmail.com' }
  s.license  = { :type => 'BSD', :file => 'LICENSE' }
  s.homepage = 'https://github.com/pegan/AutoPropertyInit'
  s.summary  = 'AutoPropertyInit is an NSObject category that simplifies the process of initialize properties that are subclasses of NSObject.'
  s.source   = { :git => 'https://github.com/pegan/AutoPropertyInit', :tag => s.version.to_s }

  s.requires_arc = true

  s.source_files = 'AutoPropertyInit/*.{h,m}'

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.6'
end
