---
layout: post
title: 20 tips rút gọn code trong Javascript
subtitle: Bất kỉ tri bỉ, bách chiến bất đãi
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [follow]
categories: [code]
tags: [code, js, javascript, es6, code snippets, thaycacac]
keywords:
  [
    tips javascript,
    rút gọn code trong javascript,
    thủ thuật javascript,
    thaycacac,
    hoapn,
    phạm ngọc hòa,
  ]
---

Các kỹ thuật viết tắt của bất kỳ ngôn ngữ lập trình nào giúp bạn viết code sạch và tối ưu hơn. JavaScript cũng vậy.

## 1. Khai báo biến trong JS

Đây là 2 cách khai báo biến. Bạn sẽ thấy rõ sự khác biệt giữa cách viết bình thường và khi áp dụng kỹ thuật viết tắt:

```js
// Bình thường
let x;
let y = 20;

// Viết tắt 
let x, y = 20;
```

* Ghi chú: Kỹ thuật viết tắt trong JS không có gì cao siêu cả. Chỉ là vận dụng các tính chất cơ bản của JavaScript một cách lô hỏa thuần thanh mà thôi.

## 2. Gán giá trị cho nhiều biến

Chúng ta có thể gán giá trị cho nhiều biến trong một dòng với cấu trúc mảng.

```js
// Bình thường 
let a, b, c;
a = 5;
b = 8;
c = 12;

// Viết tắt 
let [a, b, c] = [5, 8, 12];
```

## 3. Toán tử Ternary

Chúng ta có thể tiết kiệm 5 dòng code ở đây với toán tử ternary (có điều kiện).

```js
// Bình thường 
let number = 26;
let isEven;
if (number % 2) {
    isEven = true;
} else {
    isEven = false;
}

// Viết tắt 
let isEven = number % 2 ? true : false;
```

## 4. Gán giá trị mặc định

Chúng ta có thể sử dụng toán tử OR (||) để gán giá trị mặc định cho một biến trong trường hợp giá trị đó có thể rỗng.

```js
// Bình thường 
let imagePath;
let path = getImagePath();
if (path !== null && path !== undefined && path !== '')
    imagePath = path;
}
else {
    imagePath = 'default.jpg';
}

// Viết tắt 
let imagePath = getImagePath() || 'default.jpg';
```

## 5. Toán tử AND (&&)

Nếu bạn chỉ gọi một hàm khi một biến được đánh giá là true, thì với việc sử dụng toán tử AND (&&) bạn có thể thực hiện nó trong một dòng duy nhất.

```js
// Bình thường
if (isLoggedin) {
    goToHomepage();
}

// Viết tắt 
isLoggedin && goToHomepage();
```

Ở đây, trong kỹ thuật viết tắt, nếu isLoggedin trả về true, thì goToHomepage() sẽ thực thi.

## 6. Hoán đổi giá trị giữa 2 biến

Để hoán đổi giá trị giữa hai biến, chúng ta thường sử dụng một biến thứ ba. Nhưng trong JS, chúng ta có thể hoán đổi hai biến một cách dễ dàng với phép gán cấu trúc mảng.

let x = 'Hello', y = 55;

```js
// Bình thường 
const temp = x;
x = y;
y = temp;

// Viết tắt
[x, y] = [y, x];
```

## 7. Arrow Function

```js
// Bình chường
function add(num1, num2) {
    return num1 + num2;
}
// Viết tắt
const add = (num1, num2) => num1 + num2;
```

### 8. Template Literals

Trong JavaScript, chúng ta thường sử dụng toán tử + để nối các giá trị chuỗi với các biến. Nhưng với phiên bản ES6, với Template Literals, chúng ta có thể làm điều đó theo cách đơn giản hơn.

```js
// Bình thường 
console.log('Bạn có cuộc gọi nhỡ từ ' + number + ' vào ' + time);

// Viết tắt 
console.log(`Bạn có cuộc gọi nhỡ từ ${number} vào ${time}`);
```

## 9. Chuỗi trên nhiều dòng

Đối với chuỗi nhiều dòng, chúng ta thường sử dụng toán tử + với \n.
Nhưng chúng ta có thể làm điều đó theo cách dễ dàng hơn, đẹp hơn bằng cách sử dụng dấu gạch ngược (`).

```js
// Bình thường
console.log('JavaScript là ngôn ngữ lập trình kịch bản.\n' +
    'Code JavaScript được thông dịch, đa mô hình. \n');
    
// Viết tắt 
console.log(`JavaScript là ngôn ngữ lập trình kịch bản.
    Code JavaScript được thông dịch, đa mô hình.`);
```

## 10. Kiểm tra nhiều điều kiện

Để kiểm tra nhiều giá trị, chúng ta có thể đặt tất cả các giá trị trong mảng và sử dụng phương thức indexOf().

```
// Bình thường 
if (value === 1 || value === 'Một' || value === 2 || value === 'Hai') {
    // Code làm gì đó
}

// Viết tắt 
if ([1, 'Một', 2, 'Hai'].indexOf(value) >= 0) {
    // Code làm gì đó
}
```

Hàm indexOf() là hàm tìm xem giá trị cần tìm nằm ở vị trí nào trong một chuỗi. Nó trả về -1 nếu không tìm thấy.

## 11. Gán thuộc tính cho đối tượng

Nếu tên biến và tên key của đối tượng giống nhau thì chúng ta chỉ có thể đề cập đến tên biến trong các object literals thay vì cả key và value. JavaScript sẽ tự động đặt key giống như tên biến và gán giá trị dưới dạng giá trị biến.

```js
let firstname = 'Amitav'; 
let lastname = 'Mishra'; 
// Bình thường
let obj = {firstname: firstname, lastname: lastname}; 

//Viết tắt
let obj = {firstname, lastname};
```

## 12. Chuyển đổi chuỗi thành số

Có sẵn các phương thức có sẵn như parseInt và parseFloat để giúp chúng ta chuyển một chuỗi thành số. Nhưng cách đó khá là dài, chúng ta cũng có thể làm điều này nhanh hơn bằng cách sử dụng toán tử +

```js
// Bình thường 
let total = parseInt('453');
let average = parseFloat('42.6');

// Viết tắt 
let total = +'453';
let average = +'42.6';
```

## 13. Lặp lại chuỗi nhiều lần

Để lặp lại một chuỗi trong một khoảng thời gian nhất định, bạn có thể sử dụng vòng lặp for. Nhưng bạn cũng có thể sử dụng phương thức repeat() để thực hiện nó trên một dòng duy nhất.

```js
// Bình thường 
let str = '';
for (let i = 0; i < 5; i++) {
    str += 'Hello ';
}
console.log(str); // Hello Hello Hello Hello Hello 

// Viết tắt 
'Hello '.repeat(5);
```

Và nếu, bạn muốn xin lỗi người yêu bằng cách gửi 100 lần "Anh xin lỗi"? Hãy thử nó với phương thức repeat(). Nếu bạn muốn lặp lại từng chuỗi trong một dòng mới, hãy thêm \n vào cuỗi chuỗi.

'Anh xin lỗi\n'.repeat(100);

## 11. Tính lũy thừa

Chúng ta có thể sử dụng phương thức Math.pow() để tìm lũy thừa của một số. Nhưng nếu chỉ đơn giản như thế thì có một cách khác ngắn hơn với hai dấu sao **.

```js
// Bình thường 
const power = Math.pow(5, 3); // 125

// Viết tắt 
const power = 5 ** 3; // 125
```

## 15. Làm tròn số

Toán tử kép NOT bitwise ~~ là một thay thế cho phương thức làm tròn xuống số thập phân gần nhất Math.floor().

```js
// Bình thường 
const floor = Math.floor(6.9); // 6 

// Viết tắt 
const floor = ~~6.9; // 6
```


## 16. Tìm min, max trong một mảng số

Chúng ta có thể sử dụng vòng lặp for để lặp qua từng giá trị của mảng và tìm giá trị max hoặc min. Hoặc, chúng ta cũng có thể sử dụng phương thức Array.reduce() để tìm số max và min trong mảng. Nhưng với một mảng nhỏ, chúng ta có thể làm đơn giản như sau:

```js
// Viết tắt 
const arr = [2, 8, 15, 4];

Math.max(...arr); // 15 
Math.min(...arr); // 2
```

## 17. Sử dụng vòng lặp for

Để lặp qua một mảng, chúng ta thường sử dụng vòng lặp for truyền thống. Nhưng cách làm đó không dễ. Thế nên, JavaScript sinh ra thêm 2 vòng lặp for như for ... of và for ... in. Chúng ta có thể sử dụng vòng lặp for ... of để lặp qua các mảng.
Để truy cập chỉ số index của mỗi giá trị, chúng ta có thể sử dụng vòng lặp for ... in.

```js
// Bình thường 
for (let i = 0; i < arr.length; i++) {
    console.log(arr[i]);
}

// Viết tắt 
// với vòng lặp for of
for (const val of arr) {
    console.log(val);
}

// với vòng lặp for in
for (const index in arr) {
    console.log(arr[index]);
}
```

Chúng ta cũng có thể lặp qua các thuộc tính của đối tượng bằng cách sử dụng vòng lặp for ... in.

```js
let obj = {
    x: 20,
    y: 50
};

// Lặp qua các thuộc tính của đối tượng
for (const key in obj) {

    // In ra giá trị của thuộc tính tương ứng
    console.log(obj[key]);
}
```


## 18. Hợp nhất mảng

Để hợp nhất mảng ta có thể sử dụng toán tử Spread để hợp nhất mảng.

```js
let arr1 = [20, 30];
let arr2 = [40, 50];

// Bình thường 
let arr3 = arr1.concat([60, 80]);
// [20, 30, 60, 80] 

// Viết tắt 
let arr4 = [...arr1, 60, 80];
// [20, 30, 60, 80]

let arr5 = [...arr1, ...arr2]

// [20, 30, 40, 50]
```

## 19. Sao chép sâu

Để sao chép sâu một đối tượng nhiều cấp, chúng ta có thể lặp qua từng thuộc tính và kiểm tra xem thuộc tính hiện tại có chứa một đối tượng hay không. Nếu có, sau đó thực hiện một cuộc gọi đệ quy đến cùng một hàm bằng cách truyền giá trị thuộc tính hiện tại như sau:

```js
let obj = {
    x: 20,
    y: {
        z: 30
    }
};

// Bình thường 
const makeDeepClone = (obj) => {
    let newObject = {};
    Object.keys(obj).map(key => {
        if (typeof obj[key] === 'object') {
            newObject[key] = makeDeepClone(obj[key]);
        } else {
            newObject[key] = obj[key];
        }
    });
    return newObject;
}
const cloneObj = makeDeepClone(obj);
```


Nhưng như thế rất khó hiểu.


Chúng ta có thể tận dụng tính chất của JSON để sao chép sâu trên một dòng duy nhất.


Sử dụng `JSON.stringify()` và `JSON.parse()`

```js
let obj = {
    x: 20,
    y: {
        z: 30
    }
};

// Viết tắt
const cloneObj = JSON.parse(JSON.stringify(obj));
```

## 20. Lấy ký tự từ một chuỗi

Trước đây bạn phải sử dụng phương thức `charAt()` để lấy ký tự từ một chuỗi. Nhưng trong JavaScript, chuỗi cũng tương tự như mảng.

```js
let str = 'niithanoi.edu.vn';

// Bình thường 
str.charAt(0); // n

// Viết tắt 
str[0]; // n
```
 
[Source](https://javascript.plainenglish.io/20-javascript-shorthand-techniques-that-will-save-your-time-f1671aab405f)
