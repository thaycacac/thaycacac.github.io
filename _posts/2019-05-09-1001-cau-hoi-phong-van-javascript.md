---
layout: post
title: 1001 Câu hỏi phỏng vấn javascript
subtitle: Hãy hót lên !!!
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [follow]
categories: [share]
tags: [seo]
description:
keywords: []
---

**Q1: Cái gì là `Coercion` trong Javasript?**

Đây là cách chuyển đổi kiểu các giá trị trong javascript, ngầm hiểu là **type casting**. Coercion trong javascript gồm có hai kiểu là _explicit_ và _implicit_.
Đây là ví dụ explicit coercion:

```javascript
var a = "42";
var b = Number(a);
a; // "42"
b; // 42 -- the number!
```

Đây là ví dụ implicit coercion, hay thường xảy ra ở toán từ `==`:

```javascript
var a = "42";
var b = a * 1; // "42" implicitly coerced to 42 here
a; // "42"
b; // 42 -- the number!
```

**Q2: Toán tử typeof là cái gì?**

Javascript cung cấp một loại toán tử là `typeof` để cho bạn xác định xem kiểu của biến/ hằng:

```javascript
var a;
typeof a; // "undefined"

a = "hello world";
typeof a; // "string"

a = 42;
typeof a; // "number"

a = true;
typeof a; // "boolean"

a = null;
typeof a; // "object" -- weird, bug

a = undefined;
typeof a; // "undefined"

a = { b: "c" };
typeof a; // "object"
```
