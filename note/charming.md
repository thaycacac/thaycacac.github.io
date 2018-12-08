---
title: Note Charming
author: Thaycacac
---

### 1. Set up

```javascript
$ yarn add charming
```
*Then import library to use*

```javascript
import anime from 'animejs'
```
### 2. Use charming

```javascript
animate() {
  const element = document.querySelector('.title')
  charming(element, {
    tagName: 'b',
    classPrefix: 'letter'
  })
}
```
[Source link](https://github.com/yuanqing/charming)
