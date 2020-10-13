---
layout: post
title: 24 modern ES6 code snippets giải quyết vấn đề thường gặp trong JS
subtitle: Cố thiện chiến giả, cầu chi ư thế, bất trách ư nhân, cố năng trạch nhân nhi nhậm thế
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [follow]
categories: [code]
tags: [code, js, javascript, es6, code snippets, thaycacac]
keywords:
  [
    code,
    js,
    javascript,
    es6,
    code snippets,
    snippets,
    thaycacac,
    hoapn,
    phạm ngọc hòa,
  ]
---

Tôi đã chọn ra số đoạn mã hữu ích nhất từ [30 seconds of code](https://www.30secondsofcode.org/). Tôi đã cố gắng sắp xếp chúng dựa trên việc sử dụng thực tế, giải quyết được những vấn đề phổ biến mà bạn có thể gặp phải trong dự án của mình.

## 1. Ẩn tất cả các phần tử nào đó

```javascript
const hide = (...el) => [...el].forEach((e) => (e.style.display = 'none'))

// Ví dụ
hide(document.querySelectorAll('img')) // Ẩn tất cả các phần tử <img>
```

## 2. Cách kiểm tra phần từ có lớp được chỉ định hay không

```javascript
const hasClass = (el, className) => el.classList.contains(className)

// Ví dụ
hasClass(document.querySelector('p.special'), 'special') // true
```

## 3. Toggle một class cho một phần tử

```javascript
const toggleClass = (el, className) => el.classList.toggle(className)

// Ví dụ
toggleClass(document.querySelector('p.special'), 'special')
// thẻ p sẽ không có lớp 'special' nữa
```

## 4. Lấy vị trí scroll hiện tại

```javascript
const getScrollPosition = (el = window) => ({
  x: el.pageXOffset !== undefined ? el.pageXOffset : el.scrollLeft,
  y: el.pageYOffset !== undefined ? el.pageYOffset : el.scrollTop,
})

// Ví dụ
getScrollPosition() // {x: 0, y: 200}
```

## 5. Tạo scroll to top mượt mà

```javascript
const scrollToTop = () => {
  const c = document.documentElement.scrollTop || document.body.scrollTop
  if (c > 0) {
    window.requestAnimationFrame(scrollToTop)
    window.scrollTo(0, c - c / 8)
  }
}

// Ví dụ
scrollToTop()
```

## 6. Kiểm tra nếu phần tử cha bọc phần tử con

```javascript
const elementContains = (parent, child) =>
  parent !== child && parent.contains(child)

// Ví dụ
elementContains(document.querySelector('head'), document.querySelector('title'))
// true
elementContains(document.querySelector('body'), document.querySelector('body')) // false
```
