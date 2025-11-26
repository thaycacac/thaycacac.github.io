---
layout: page
title: CoinSavi
subtitle: CoinSavi
keyword: ["coinsavi"]
---

## 1. Chạy Test End-to-End

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

## 2. Chạy Rails Mock Server

```bash
USE_PROVIDER_MOCK_RESPONSE=true RAILS_ENV=test bin/rails s -p 3017
```

---

## 3. Ghi chú branch & lệnh broadcast

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

## 4. Cấu trúc data nhận về

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

## 5. Update Symbol

```ruby
SymbolInfo.destroy_all
SymbolInfoUpdater.perform("okx")
SymbolInfo.all.each(&:enable!)
```

---

## 6. Test & Seed Database

- **Chạy test:**
  ```bash
  bundle exec rspec
  ```
- **Chạy seed:**
  ```bash
  rails r dev-seeds/test-admin-user-roles.rb
  ```

---

## 7. Các lệnh hỗ trợ dev

- Xoá banner nếu version 0.55 không còn nhiều
- Enable index scan:
  ```ruby
  ActiveRecord::Base.connection.execute('SET enable_seqscan = OFF')
  ```

---

## 8. Build & Run Android App

```bash
cd packages/remitano-plus && ENVFILE=.env.dev npx react-native run-android --variant=coinsavi_devdebug --appId 'com.coinsavi.dev' && cd -
```

---

## 9. Sidekiq & các job liên quan

```bash
bundle exec sidekiq -q investment -q sub_account -q fund -q provider_sync
bundle exec sidekiq -q investment -q sub_account -q fund -q provider_sync -q investment_priority
```

- **Push open investment:**
  ```ruby
  Investment.last.push_changes
  ```

---

## 10. Tăng số lượng investment account

```ruby
10.times { InvestmentAccount.create!(provider_name: "okx") }
InvestmentAccount.update_all(status: :available)
```

---

## 11. Database migration môi trường test

```bash
RAILS_ENV=test rails db:migrate
```

---

## 12. Subaccount và symbol info

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

## 13. (Bỏ trống, dùng cho update sau)

---

## 14. Sửa lỗi PostgreSQL (Mac)

```bash
brew services stop postgresql@14
rm -f /opt/homebrew/opt/postgresql@14/homebrew.mxcl.postgresql@14.plist
brew services start postgresql@14
```

---

## 15. Funding Balances & Transfer nội bộ

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

## 16. Wordpress Plugin & Theme Symlink

```bash
# List plugin folder size
ll -sh wp-content/plugins

ln -s /Applications/MAMP/htdocs/trade-savi-wp/plugins/custom-data-types /Applications/MAMP/htdocs/wordpress/wp-content/plugins/custom-data-types
ln -s /Applications/MAMP/htdocs/trade-savi-wp/plugins/google-site-kit /Applications/MAMP/htdocs/wordpress/wp-content/plugins/google-site-kit
ln -s /Applications/MAMP/htdocs/trade-savi-wp/plugins/kucoin-wp /Applications/MAMP/htdocs/wordpress/wp-content/plugins/kucoin-wp
ln -s /Applications/MAMP/htdocs/trade-savi-wp/themes/saviwp /Applications/MAMP/htdocs/wordpress/wp-content/themes/saviwp
```

---

## 17. Thông tin khác

- Keystore production: `coinsavi`

---

## 18. CI/CD Logging trên CircleCI

```bash
echo "APP_AWS_BUCKET length: ${#APP_AWS_BUCKET}"
echo "APP_AWS_BUCKET first 3 chars: ${APP_AWS_BUCKET:0:3}"
echo "APP_AWS_BUCKET last 3 chars: ${APP_AWS_BUCKET: -3}"
```

---

## 19. Build iOS với xcodebuild

```bash
xcodebuild -workspace RemitanoPlus.xcworkspace -scheme RemitanoPlus-Dev -destination 'platform=iOS Simulator,name=iPhone 15,OS=17.5' build
```

---

