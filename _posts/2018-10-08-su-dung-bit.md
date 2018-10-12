---
layout: post
title: Chia sẻ và sử dụng Component NPM + Bit
subtitle: Làm thế nào để cài đặt các component với bất kỳ thư viện React, Vue hoặc UI bằng cách sử dụng Bit và NPM
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [star, follow]
tags: [share]
---

Hiện nay có rất nhiều thư viện component trong thế giới javascript, và chúng đều theo một concept: Bạn cài đặt tất cả thư viện nhưung chỉ sử dụng một hoặc hai component.

Javascript sẽ được tạo thành các gói(`node packages`) và chúng thường chứa một đoạn mã lớn. Điều này thật sự có ích khi bạn sử dụng chúng trong toàn bộ dự án, nhưng nó có phải là một ý tưởng tốt khi chỉ sử dụng chúng trong một component cụ thể?

Vấn đề này dẫn đến một loạt các vấn đề khác và giải pháp. Trong bài viết này tôi sẽ hướng dẫn sử dụng `Bit` để chọn một single component từ thư viện cụ thể và cài đặt riêng cho nó thông qua NPM/ Yarn mà không cần tái cấu trúc dòng code đơn lẻ.

Bit làm việt với Git và NPM để giúp bạn tạo ra nhiều packages từ bất kỳ repository nào hiện có mà không tách nó, thay đổi nó hoặc phải cấu hình dependency trees và build các quy trình để publish chúng.

Sau đó, bạn cũng có thể thay đổi các gói này từ bất kỳ repository hoặc project khác. 

## Bước 1: Cô lập code từ project của bạn

Sử dụng bit bạn có thể dễ dàn cô lập bất kỳ phần nào của repository mà không cần thay đổi tất cả, vì vậy, bạn có thể sử dụng code này từ những project khác. 

Đây là một ví dụ về cấu trúc của một dự án:
```
$ tree
.
├── App.js
├── App.test.js
├── favicon.ico
├── index.js
└── src
    └── components
        ├── button
        │   ├── Button.js
        │   ├── Button.spec.js
        │   └── index.js
        ├── login
        │   ├── Login.js
        │   ├── Login.spec.js
        │   └── index.js
        └── logo
            ├── Logo.js
            ├── Logo.spec.js
            └── index.js

5 directories, 13 files
```
Trong repo này, chúng ta có 3 components chúng ta muốn sử dụng trong những project khác như một npm package là: `button`, `login`, và `logo`.

Theo cách bình thường, chúng ta phải **tạo mới repo** cho từng component của chúng. Trong mỗi repo lại phải **boilerplate và configure** với bit thì mọi chuyện trở nên đơn giản hơn rất nhiều.

Đầu tiên phải `install Bit`

```
$ npm install bit-bin -g
```
Sau đó khởi tạo dự án muốn chia sẻ

```
$ cd project-directory
$ bit init
```

Nếu cần, hãy thêm `build` và `test` môi trường để tiết kiệp chi phí cho việc configuring package. Ở đây là ví dụ cho components React

```
$ bit import bit.envs/compilers/react --compiler
the following component environments were installed
- bit.envs/compilers/react@0.0.7
$ bit import bit.envs/testers/jest --tester
the following component environments were installed
- bit.envs/testers/jest@0.0.7
```
Bây giờ hãy nó chô Bit những phần trong project của bạn muốn cần đóng gói. Bạn cũng có thể chỉ ra một file cụ thể trong component dùng lệnh `bit add` để add, nhưng bây giờ hãy làm nó một cách đơn giản: 

```
# use a glob pattern to track multiple components in the same path, or a single path to track a single component.
$ bit add src/components/*
```

Cuối cùng hãy `lock` một phên bản để bit định nghĩa cây dependency

```
$ bit tag --all 1.0.0
3 components tagged | 3 added, 0 changed, 0 auto-tagged
added components:  components/button@1.0.0, components/login@1.0.0, components/logo@1.0.0
```

`Bit` bây giờ sẽ theo dõi những tệp trong project này, đã giải quyết dependency tree của họ, locked một phiên bản và chuẩn bị một môi tường để xây dựng và kiểm tra chúng.

Chúng ta có thể sử dụng một lệnh nhanh là `bit status` để thấy những components đã được cô lập và sẵn sàng share.


