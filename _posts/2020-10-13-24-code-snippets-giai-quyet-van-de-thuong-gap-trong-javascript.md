---
layout: post
title: 24 code snippets giải quyết vấn đề thường gặp trong Javascript
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
const hide = (...el) => [...el].forEach((e) => (e.style.display = "none"));

// Ví dụ
hide(document.querySelectorAll("img")); // Ẩn tất cả các phần tử <img>
```

## 2. Cách kiểm tra phần từ có lớp được chỉ định hay không

```javascript
const hasClass = (el, className) => el.classList.contains(className);

// Ví dụ
hasClass(document.querySelector("p.special"), "special"); // true
```

## 3. Toggle một class cho một phần tử

```javascript
const toggleClass = (el, className) => el.classList.toggle(className);

// Ví dụ
toggleClass(document.querySelector("p.special"), "special");
// thẻ p sẽ không có lớp 'special' nữa
```

## 4. Lấy vị trí scroll hiện tại

```javascript
const getScrollPosition = (el = window) => ({
  x: el.pageXOffset !== undefined ? el.pageXOffset : el.scrollLeft,
  y: el.pageYOffset !== undefined ? el.pageYOffset : el.scrollTop,
});

// Ví dụ
getScrollPosition(); // {x: 0, y: 200}
```

## 5. Tạo scroll to top mượt mà

```javascript
const scrollToTop = () => {
  const c = document.documentElement.scrollTop || document.body.scrollTop;
  if (c > 0) {
    window.requestAnimationFrame(scrollToTop);
    window.scrollTo(0, c - c / 8);
  }
};

// Ví dụ
scrollToTop();
```

## 6. Kiểm tra nếu phần tử cha bọc phần tử con

```javascript
const elementContains = (parent, child) =>
  parent !== child && parent.contains(child);

// Ví dụ
elementContains(
  document.querySelector("head"),
  document.querySelector("title")
);
// true
elementContains(document.querySelector("body"), document.querySelector("body")); // false
```

## 7. Kiểm tra xem một phần tử đang được hiển thị trên màn hình

```javascript
const elementIsVisibleInViewport = (el, partiallyVisible = false) => {
  const { top, left, bottom, right } = el.getBoundingClientRect();
  const { innerHeight, innerWidth } = window;
  return partiallyVisible
    ? ((top > 0 && top < innerHeight) ||
        (bottom > 0 && bottom < innerHeight)) &&
        ((left > 0 && left < innerWidth) || (right > 0 && right < innerWidth))
    : top >= 0 && left >= 0 && bottom <= innerHeight && right <= innerWidth;
};

// Ví dụ
elementIsVisibleInViewport(el); // (not fully visible)
elementIsVisibleInViewport(el, true); // (partially visible)
```

## 8. Cách fetch tất cả các hình ảnh trong một phần tử

```javascript
const getImages = (el, includeDuplicates = false) => {
  const images = [...el.getElementsByTagName("img")].map((img) =>
    img.getAttribute("src")
  );
  return includeDuplicates ? images : [...new Set(images)];
};

// Ví dụ
getImages(document, true); // ['image1.jpg', 'image2.png', 'image1.png', '...']
getImages(document, false); // ['image1.jpg', 'image2.png', '...']
```

## 9. Tìm ra xem thiết bị là điện thoại, máy tính để bàn hay laptop

```javascript
const detectDeviceType = () =>
  /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(
    navigator.userAgent
  )
    ? "Mobile"
    : "Desktop";

detectDeviceType(); // "Mobile" or "Desktop"
```

## 10. Lấy URL hiện tại

```javascript
const currentURL = () => window.location.href;

// Ví dụ
currentURL(); // 'https://google.com'
```

## 11. Cách tạo một đối tượng chứa các tham số của URL hiện tại

```javascript
const getURLParameters = (url) =>
  (url.match(/([^?=&]+)(=([^&]*))/g) || []).reduce(
    (a, v) => (
      (a[v.slice(0, v.indexOf("="))] = v.slice(v.indexOf("=") + 1)), a
    ),
    {}
  );

// Ví dụ
getURLParameters("http://url.com/page?n=Adam&s=Smith"); // {n: 'Adam', s: 'Smith'}
getURLParameters("google.com"); // {}
```

## 12. Các mã hóa một tập hợp các phần tử biểu mẫu như một đối tượng

```javascript
const formToObject = (form) =>
  Array.from(new FormData(form)).reduce(
    (acc, [key, value]) => ({
      ...acc,
      [key]: value,
    }),
    {}
  );

// Ví dụ
formToObject(document.querySelector("#form")); // { email: 'test@email.com', name: 'Test Name' }
```

## 13. Cách để truy xuất một tập hợp các thuộc tính được chỉ ra bởi các bộ chọn đã cho từ một đối tượng

```javascript
const get = (from, ...selectors) =>
  [...selectors].map((s) =>
    s
      .replace(/\[([^\[\]]*)\]/g, ".$1.")
      .split(".")
      .filter((t) => t !== "")
      .reduce((prev, cur) => prev && prev[cur], from)
  );
const obj = {
  selector: { to: { val: "val to select" } },
  target: [1, 2, { a: "test" }],
};

// Ví dụ
get(obj, "selector.to.val", "target[0]", "target[2].a"); // ['val to select', 1, 'test']
```

## 14. Cách để gọi hàm đã cung cấp sau khi đợi (tính bằng mili giây)

```javascript
const delay = (fn, wait, ...args) => setTimeout(fn, wait, ...args);

// Ví dụ
delay(
  function (text) {
    console.log(text);
  },
  1000,
  "later"
);

// Logs 'later' after one second.
```

## 15. Cách để kích hoạt một sự kiện cụ thể trên một phần tử nhất định, truyền dữ liệu tùy chỉnh theo tùy chọn

```javascript
const triggerEvent = (el, eventType, detail) =>
  el.dispatchEvent(new CustomEvent(eventType, { detail }));

// Ví dụ
triggerEvent(document.getElementById("myId"), "click");
triggerEvent(document.getElementById("myId"), "click", { username: "bob" });
```

## 16. Cách để xóa một event listener khỏi một phần tử

```javascript
const off = (el, evt, fn, opts = false) =>
  el.removeEventListener(evt, fn, opts);

const fn = () => console.log("!");
document.body.addEventListener("click", fn);
off(document.body, "click", fn); // no longer logs '!' upon clicking on the page
```

## 17. Convert mili giây sang ngày giờ phút giây,...

```javascript
const formatDuration = (ms) => {
  if (ms < 0) ms = -ms;
  const time = {
    day: Math.floor(ms / 86400000),
    hour: Math.floor(ms / 3600000) % 24,
    minute: Math.floor(ms / 60000) % 60,
    second: Math.floor(ms / 1000) % 60,
    millisecond: Math.floor(ms) % 1000,
  };
  return Object.entries(time)
    .filter((val) => val[1] !== 0)
    .map(([key, val]) => `${val} ${key}${val !== 1 ? "s" : ""}`)
    .join(", ");
};

// Ví dụ
formatDuration(1001); // '1 second, 1 millisecond'
formatDuration(34325055574); // '397 days, 6 hours, 44 minutes, 15 seconds, 574 milliseconds'
```

## 18. Cách tính khoảng cách (theo ngày) giữa Date?

```javascript
const getDaysDiffBetweenDates = (dateInitial, dateFinal) =>
  (dateFinal - dateInitial) / (1000 * 3600 * 24);

// Ví dụ
getDaysDiffBetweenDates(new Date("2017-12-13"), new Date("2017-12-22")); // 9
```

## 19. Cách tạo một request GET

```javascript
const httpGet = (url, callback, err = console.error) => {
  const request = new XMLHttpRequest();
  request.open("GET", url, true);
  request.onload = () => callback(request.responseText);
  request.onerror = () => err(request);
  request.send();
};

httpGet("https://jsonplaceholder.typicode.com/posts/1", console.log);

// Logs: {"userId": 1, "id": 1, "title": "sample title", "body": "my text"}
```

## 20. Cách tạo một request POST

```javascript
const httpPost = (url, data, callback, err = console.error) => {
  const request = new XMLHttpRequest();
  request.open("POST", url, true);
  request.setRequestHeader("Content-type", "application/json; charset=utf-8");
  request.onload = () => callback(request.responseText);
  request.onerror = () => err(request);
  request.send(data);
};

const newPost = {
  userId: 1,
  id: 1337,
  title: "Foo",
  body: "bar bar bar",
};
const data = JSON.stringify(newPost);
httpPost("https://jsonplaceholder.typicode.com/posts", data, console.log);

// Logs: {"userId": 1, "id": 1337, "title": "Foo", "body": "bar bar bar"}
```

## 21. Cách tạo bộ đếm với phạm vi, bước và thời lượng được chỉ định cho bộ chọn được chỉ định

```javascript
const counter = (selector, start, end, step = 1, duration = 2000) => {
  let current = start,
    _step = (end - start) * step < 0 ? -step : step,
    timer = setInterval(() => {
      current += _step;
      document.querySelector(selector).innerHTML = current;
      if (current >= end) document.querySelector(selector).innerHTML = end;
      if (current >= end) clearInterval(timer);
    }, Math.abs(Math.floor(duration / (end - start))));
  return timer;
};

// Ví dụ
counter("#my-id", 1, 1000, 5, 2000); // Creates a 2-second timer for the element with id="my-id"
```

## 22. Cách tạo clipboard để copy text

```javascript
const copyToClipboard = (str) => {
  const el = document.createElement("textarea");
  el.value = str;
  el.setAttribute("readonly", "");
  el.style.position = "absolute";
  el.style.left = "-9999px";
  document.body.appendChild(el);
  const selected =
    document.getSelection().rangeCount > 0
      ? document.getSelection().getRangeAt(0)
      : false;
  el.select();
  document.execCommand("copy");
  document.body.removeChild(el);
  if (selected) {
    document.getSelection().removeAllRanges();
    document.getSelection().addRange(selected);
  }
};

// Ví dụ
copyToClipboard("Lorem ipsum"); // 'Lorem ipsum' copied to clipboard.
```

## 23. Cách kiểm tra xem tab của trình duyệt của đang được focus hay không

```javascript
const isBrowserTabFocused = () => !document.hidden;

// Ví dụ
isBrowserTabFocused(); // true
```

## 24. Cách tạo một thư mục, nếu nó không tồn tại

```javascript
const fs = require("fs");
const createDirIfNotExists = (dir) =>
  !fs.existsSync(dir) ? fs.mkdirSync(dir) : undefined;

// Example
createDirIfNotExists("test"); // creates the directory 'test', if it doesn't exist
```
