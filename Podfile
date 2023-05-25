# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'BMI Calculator' do
  use_frameworks!

  # Pods for BMI Calculator
  flutter_application_path = '../bmi_flutter'
  load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')
  install_all_flutter_pods(flutter_application_path)
  post_install do |installer|
    flutter_post_install(installer)
  end

end
