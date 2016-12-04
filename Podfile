
use_frameworks!
platform :ios, '10.0'
inhibit_all_warnings!

def main_pods

pod 'Alamofire'
pod 'ReactiveKit', '~> 3.1'
pod 'Bond', '~> 5.0'

end



target 'ReactiveAlamofire'  do
main_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
