---
layout: post
title: Tại sao chúng ta lại viết super(props)?
subtitle: Nếu bạn muốn tìm hiểu sâu hơn về cách mọi thứ hoạt động.
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [star, follow]
tags: [code]
keywords: [thaycacac, tại sao viết super props, super trong react để làm gì, super reactjs de lam gi, ý nghĩa của super trong reactjs, y nghia cua super trong reactjs]
---
Điều này không quan trọng khi bạn sử dụng React hiệu quả nhưng bạn sẽ cảm thấy chúng thú vị hoặc muốn tìm  hiểu sâu hơn về cách hoạt động.

Nếu như bạn đã code react thì chắc bạn đã sử dụng `super(props)`, thế bạn có hiểu về chúng?
```reactjs
class Checkbox extends React.Component {
  constructor(props) {
    super(props);
    this.state = { isOn: true };
  }
  // ...
}
```
