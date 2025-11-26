---
layout: page
title: CoinSavi
subtitle: CoinSavi
keyword: ["coinsavi"]
---

## Chạy Test End-to-End

```bash
cd ~/r2-fe
npx nx run remitano-plus:ensure-symlink
npx nx run remitano-plus:sync-deps
cd ~/r2-fe/packages/remitano-plus
yarn adb
yarn e2e:build:android:release
yarn e2e:test:android ../features/**/*.feature
yarn e2e:test:android ../features/login/login.feature
```

---

## Chạy Rails Mock Server

```bash
USE_PROVIDER_MOCK_RESPONSE=true RAILS_ENV=test bin/rails s -p 3017
```

---

## Ghi chú branch & lệnh broadcast

- **Branch:** `update-socket-order-book`

```ruby
FundTransferChannel.broadcast_to('fund_transfers_3',
  fund_transfer: {
    id: 1,
    created_time: 1212232332,
    status: 'pending',
    coin: 'USDT',
    amount: 2.0,
    from: 'REMITANO',
    to: 'SPOT'
  }
)

UserChannel.broadcast_to('users_3', user: {
  id: 3,
  remi_account_linked: true,
  kyc_level: '2.0',
  updated_time: 21212
})
```

---

## Cấu trúc data nhận về

```json
{
  "fund_transfer": {
    "amount": "1.0",
    "coin": "USDT",
    "created_time": 1693906176932,
    "from": "TRADING",
    "id": 148,
    "status": "confirmed",
    "to": "REMITANO"
  }
}
// LOG: receive data {"amount": "1.0", "coin": "USDT", ...}
```

---

## Update Symbol

```ruby
SymbolInfo.destroy_all
SymbolInfoUpdater.perform("okx")
SymbolInfo.all.each(&:enable!)
```

---

## Test & Seed Database

- **Chạy test:**
  ```bash
  bundle exec rspec
  ```
- **Chạy seed:**
  ```bash
  rails r dev-seeds/test-admin-user-roles.rb
  ```

---

## Các lệnh hỗ trợ dev

- Xoá banner nếu version 0.55 không còn nhiều
- Enable index scan:
  ```ruby
  ActiveRecord::Base.connection.execute('SET enable_seqscan = OFF')
  ```

---

## Build & Run Android App

```bash
cd packages/remitano-plus && ENVFILE=.env.dev npx react-native run-android --variant=coinsavi_devdebug --appId 'com.coinsavi.dev' && cd -
```

---

## Sidekiq & các job liên quan

```bash
bundle exec sidekiq -q investment -q sub_account -q fund -q provider_sync
bundle exec sidekiq -q investment -q sub_account -q fund -q provider_sync -q investment_priority
```

- **Push open investment:**
  ```ruby
  Investment.last.push_changes
  ```

---

## Tăng số lượng investment account

```ruby
10.times { InvestmentAccount.create!(provider_name: "okx") }
InvestmentAccount.update_all(status: :available)
```

---

## Database migration môi trường test

```bash
RAILS_ENV=test rails db:migrate
```

---

## Subaccount và symbol info

- Tạo subaccount Gateio:
  ```ruby
  user.send(:create_sub_account!, "gateio")
  ```
- Tạo symbol info:
  ```ruby
  SymbolInfoCrawler.new.perform
  ```
- Kucoin subaccount:
  - Lưu lại UID: **204728943**
  ```ruby
  KucoinWrapper::BrokerAccount.singleton.create_sub_account(tag: "hoapn-sub1")
  KucoinWrapper::BrokerAccount.singleton.query_sub_account
  ```

---

## (Bỏ trống, dùng cho update sau)

---

## Sửa lỗi PostgreSQL (Mac)

```bash
brew services stop postgresql@14
rm -f /opt/homebrew/opt/postgresql@14/homebrew.mxcl.postgresql@14.plist
brew services start postgresql@14
```

---

## Funding Balances & Transfer nội bộ

```ruby
usa.send(:api_provider_wrapper).get_funding_balances

usa.send(:api_provider_wrapper).transfer_within_account(
  asset: "USDT",
  amount: 9.4082,
  from: "main",
  to: "trade",
  client_tran_id: Time.current.to_i
)
```

---

## Wordpress Plugin & Theme Symlink

```bash
# List plugin folder size
ll -sh wp-content/plugins

ln -s /Applications/MAMP/htdocs/trade-savi-wp/plugins/custom-data-types /Applications/MAMP/htdocs/wordpress/wp-content/plugins/custom-data-types
ln -s /Applications/MAMP/htdocs/trade-savi-wp/plugins/google-site-kit /Applications/MAMP/htdocs/wordpress/wp-content/plugins/google-site-kit
ln -s /Applications/MAMP/htdocs/trade-savi-wp/plugins/kucoin-wp /Applications/MAMP/htdocs/wordpress/wp-content/plugins/kucoin-wp
ln -s /Applications/MAMP/htdocs/trade-savi-wp/themes/saviwp /Applications/MAMP/htdocs/wordpress/wp-content/themes/saviwp
```

---

## Thông tin khác

- Keystore production: `coinsavi`

---

## CI/CD Logging trên CircleCI

```bash
echo "APP_AWS_BUCKET length: ${#APP_AWS_BUCKET}"
echo "APP_AWS_BUCKET first 3 chars: ${APP_AWS_BUCKET:0:3}"
echo "APP_AWS_BUCKET last 3 chars: ${APP_AWS_BUCKET: -3}"
```

---

## Build iOS với xcodebuild

```bash
xcodebuild -workspace RemitanoPlus.xcworkspace -scheme RemitanoPlus-Dev -destination 'platform=iOS Simulator,name=iPhone 15,OS=17.5' build
```

---

## Hướng dẫn Build iOS và Podfile ví dụ

### Build iOS với xcodebuild

```bash
xcodebuild -workspace RemitanoPlus.xcworkspace \
           -scheme RemitanoPlus-Dev \
           -configuration Debug \
           -sdk iphonesimulator \
           -destination 'platform=iOS Simulator,id=EF9C5275-4B18-4258-9A39-D272BE5352CF'
```

---

### Ví dụ Podfile cho React Native (iOS)

```ruby
# Resolve react_native_pods.rb với node để hỗ trợ hoisting
require Pod::Executable.execute_command('node', ['-p',
  'require.resolve(
    "react-native/scripts/react_native_pods.rb",
    {paths: [process.argv[1]]},
  )', __dir__]).strip

platform :ios, '15.0'
prepare_react_native_project!

# Nếu dùng `react-native-flipper` build iOS sẽ fail khi đặt NO_FLIPPER=1.
# Bạn có thể exclude bằng react-native.config.js:
# module.exports = {
#   dependencies: {
#     ...(process.env.NO_FLIPPER ? { 'react-native-flipper': { platforms: { ios: null } } } : {}),
#   },
# }
ENV['RCT_NEW_ARCH_ENABLED'] = '0'
ENV['RN_FABRIC_ENABLED'] = '0'

linkage = ENV['USE_FRAMEWORKS']
if linkage != nil
  Pod::UI.puts "Configuring Pod with #{linkage}ally linked Frameworks".green
  use_frameworks! :linkage => linkage.to_sym
end

def node_require(script)
  # Resolve script với node để hỗ trợ hoisting
  require Pod::Executable.execute_command('node', ['-p',
    "require.resolve(
      '#{script}',
      {paths: [process.argv[1]]},
    )", __dir__]).strip
end

node_require('react-native-permissions/scripts/setup.rb')

setup_permissions([
  'AppTrackingTransparency',
  'Camera',
  'Microphone',
  'Notifications',
  'PhotoLibrary',
  'PhotoLibraryAddOnly',
])

def default_pods
  config = use_native_modules!
  # Flags sẽ thay đổi phụ thuộc vào biến môi trường.
  flags = get_default_flags()
  use_react_native!(
    :path => config[:reactNativePath],
    :hermes_enabled => true,
    :fabric_enabled => ENV['RN_FABRIC_ENABLED'] == '1',
    # Bật Flipper.
    #
    # Lưu ý: nếu dùng use_frameworks!, Flipper sẽ không hoạt động.
    # :app_path là path tới root app của bạn.
    :app_path => "#{Pod::Config.instance.installation_root}/.."
  )
  pod 'Firebase', :modular_headers => true
  pod 'FirebaseCore', :modular_headers => true
  pod 'FirebaseRemoteConfig', :modular_headers => true
  pod 'GTMSessionFetcher', :modular_headers => true
  pod 'FirebaseCoreExtension', :modular_headers => true
  pod 'FirebaseAuthInterop', :modular_headers => true
  pod 'FirebaseAppCheckInterop', :modular_headers => true
  pod 'GoogleUtilities', :modular_headers => true
  pod 'FirebaseInstallations', :modular_headers => true
  pod 'AppAuth', :modular_headers => true
  pod 'FirebaseABTesting', :modular_headers => true
  pod 'GoogleDataTransport', :modular_headers => true
  pod 'nanopb', :modular_headers => true
  # pod 'Sentry', :git => 'https://github.com/getsentry/sentry-cocoa.git', :tag => '8.17.1'
  pod 'react-native-camera', path: '../node_modules/react-native-camera', subspecs: [
    'FaceDetectorMLKit',
    'BarcodeDetectorMLKit'
  ]
end

target 'RemitanoPlus' do
  default_pods
end

target 'RemitanoPlus-Dev' do
  default_pods
end

target 'RemitanoPlus-Stage' do
  default_pods
end

target 'RemitanoPlus-E2e' do
  default_pods
end

post_install do |installer|
  config = use_native_modules!
  
  # Fix Sentry C++ compile lỗi với Xcode 16+: bỏ 'const' trong std::vector<const T>
  sentry_thread_cache_file = File.join(installer.sandbox.root, 'Sentry/Sources/Sentry/include/SentryThreadMetadataCache.hpp')
  if File.exist?(sentry_thread_cache_file)
    text = File.read(sentry_thread_cache_file)
    new_text = text.gsub('std::vector<const ThreadHandleMetadataPair>', 'std::vector<ThreadHandleMetadataPair>')
    File.write(sentry_thread_cache_file, new_text)
    puts "✅ Patched SentryThreadMetadataCache.hpp for Xcode 16"
  end
  
  # Bổ sung include thiếu cho ucontext64_t với Xcode 16+
  sentry_mach_context_file = File.join(installer.sandbox.root, 'Sentry/Sources/SentryCrash/Recording/Tools/SentryCrashMachineContext.c')
  if File.exist?(sentry_mach_context_file)
    text = File.read(sentry_mach_context_file)
    unless text.include?('#include <sys/_types/_ucontext64.h>')
      new_text = text.gsub('#include <mach/mach.h>', "#include <mach/mach.h>\n#include <sys/_types/_ucontext64.h>")
      File.write(sentry_mach_context_file, new_text)
      puts "✅ Patched SentryCrashMachineContext.c for Xcode 16"
    end
  end
  
  react_native_post_install(
    installer,
    config[:reactNativePath],
    :mac_catalyst_enabled => false
  )

  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |configuration|
      target.build_settings(configuration.name)['ONLY_ACTIVE_ARCH'] = 'NO'
    end
  end
end
```

