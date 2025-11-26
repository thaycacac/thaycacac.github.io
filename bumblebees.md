---
layout: page
title: Bumblebees
subtitle: Bumblebees
keyword: ["bumblebees"]
---


```js
const storageData = {};
for (let i = 0; i < localStorage.length; i++) {
    const key = localStorage.key(i);
    const value = localStorage.getItem(key);
    storageData[key] = value;
}
console.log(storageData); 
```

```js
for (const key in a) {
    if (a.hasOwnProperty(key)) {
        localStorage.setItem(key, a[key]);
    }
}
```