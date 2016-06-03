# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!

def shared_pods
   pod 'Siesta', '>=1.0-beta.6'
   pod 'Siesta/Alamofire'
   pod 'SwiftyJSON', :git => 'https://github.com/SwiftyJSON/SwiftyJSON.git'
end

target 'UberfyApp' do
   shared_pods
   pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift2'
end

target 'UberfyWidget’ do
   shared_pods
end

target 'UberfyCoreLibrary' do
   shared_pods
end

target 'UberfyCoreLibraryTests' do
   shared_pods 
end
