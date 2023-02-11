---
layout: page
title: Static import và dynamic import
subtitle: "https://www.youtube.com/TechMely"
keyword: ["techmely"]
---

## Static import

Static import được sử dụng để import một module hoặc file từ một module hoặc file khác tại thời điểm compile. Khi một module được import, nó sẽ được tải vào trong bộ nhớ trong suốt quá trình chạy của chương trình. Điều này có nghĩa là khi một module được import từ một module hoặc file khác, tất cả nội dung trong module đó sẽ được tải trước khi bất kỳ module nào được sử dụng trong chương trình.

```js
// fileA.js
import { someFunction } from "./fileB.js";

// fileB.js
export const someFunction = () => {
  /* ... */
};
```

## Dynamic import

Dynamic import, hoạt động hoàn toàn khác, cho phép bạn import một module hoặc file từ một module hoặc file khác trong thời gian chạy của chương trình. Khi một module được import theo cách này, nó sẽ chỉ được tải khi được yêu cầu. Điều này có nghĩa là bạn có thể tải một module tùy theo yêu cầu của người dùng hoặc theo sự kiện tự do trong chương trình.

```js
// fileA.js
button.addEventListener("click", () => {
  import("./fileB.js")
    .then((module) => {
      module.someFunction();
    })
    .catch((error) => {
      console.error("Failed to load fileB.js", error);
    });
});

// fileB.js
export function someFunction() {
  console.log("Hello from fileB.js");
}
```
