# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

require 'motion-yaml'

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'cdq_icloud'
  app.identifier = 'com.itosoft.cdqicloud'

  # provisioning file
  app.development do
    app.codesign_certificate = "iPhone Developer: Katsuyoshi Ito (FN4DNLCM76)"
    app.provisioning_profile = "/Users/ISD/Library/MobileDevice/Provisioning Profiles/cdq_icloud_development.mobileprovision"
  end

  # Entitlements
  app.entitlements['com.apple.developer.ubiquity-container-identifiers'] = [app.seed_id + '.' + app.identifier]

  # keychain
  app.entitlements['keychain-access-groups'] = [
    app.seed_id + '.' + app.identifier
  ]
end

task :"build:simulator" => :"schema:build"