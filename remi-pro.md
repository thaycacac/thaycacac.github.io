---
layout: page
title: RemiPro
subtitle: Note
keyword: ['note']
---

## BE

```bash
Run make install-tools
Run bin/install_e2e
Run make run-migrate-e2e-up
Run make start-e2e-socket-client
Run make start-api-e2e
```

## FE

```bash
yarn e2e:socket-server
yarn run:e2e:ios:debug ../features/login/login.feature
```

`remi-pro/e2e/support/hook.js`

trong `relaunchAppAggressively` và trong `while (retry > 0) {`

thêm

```
try {
      await device.disableSynchronization()
      console.log('Sync disabled after needInit launch')
    } catch (e) {}
```
