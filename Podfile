# Uncomment the next line to define a global platform for your project
# platform :ios, '14.0'

target 'HogwartsApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      end
    end
  end

  # Pods for HogwartsApp

  #Firebase features
  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'FirebaseFirestoreSwift'
  
  #Alamofire
  pod 'Alamofire', '~> 5.2'

  # Pods for HogwartsApp
  pod 'PopupDialog', '~> 1.1'

end
