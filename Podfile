# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Movies' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Movies

  pod 'lottie-ios'
  pod 'Alamofire'
  pod 'SnapKit'
  pod 'SDWebImage'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxRealm' 
  pod 'RealmSwift'

  # Set the minimum iOS version to 15.0

  platform :ios, '15.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end
