---
title: Note Javascript
author: Thaycacac
---

### **1. Khái niệm cơ bản**
- [x] `Syntax Parser, Execution Context, Lexical Environment`
- [x] `Name Value` mọi obj trong js đều là cặp name - value
- [x] `Global Object` được tạo ở windows, có this, outer enviroment
- [x] `Hoisting` sử dụng một biến bao gồm 2 bước
- B1: Cài đặt bộ nhớ cho hàm và biến (undefined)
- B2: Sử dụng biến (khai báo hàm là tự động cài đăt bộ nhơ cho hàm)
- [x] `Execution Stack` Mỗi hàm sẽ được nhét vào một stack để chứa những biến, dưới cùng của stack là `Global Object`
- [x] `Scope Chain` Nếu truy cập biến mà nó không thấy thì nó sẽ timfowr `Outer enviroment`
- [x] `Dynamic typing` Không cần xác định kiểu của biến

### **2. Kiểu dữ liệu, toán tử, ép kiểu**
- [x] `Primitive type javascript` không phải là object và không có phương thức
- `Undefined`: chưa tồn tại
- `null`: tồn tại rồi nhưng k có giá trị
- `boolean`
- `string`
- `number`
- `symbol`(ES6)
- [x] `Toán tử, thứ tự ưu tiên`
- [x] `Coercion` Ép kiểu dữ liệu
- [x] `Ứng dụng toán tử ||` name = name || "Default name" (Nếu như là: undefined, null, NaN, "" thì sẽ ra Default name)

### 3. Object
- [x] `Literal` Có properties (name - value), function, object khác
* Có thể lấy dữ liệu Literal bằng cách `user['name','age']`
- [x] `Class:` (First class function) coi func như những kiểu dữ liệu khác, func không return thì nó sẽ trả về undefined

### 4. This
- [x] `Call site`  là hàm mà gọi nó, ngược lại là call stack
- [x] `Implicit binding` 
> this sẽ trỏ đến call site
- [x] `Implicit lost:` gán bằng biến để ở global thì call site vẫn là global

### 5. Function
Có 2 loại là: `Function Declarations` (khai báo bình thường), `Function Expresstions` (khai báo gán vào biến, có tên hoặc không có tên hàm)
- [x] `Function arguments` nó sẽ truyền object vào hàm 
- [x] `Function overloading` nó sẽ gọi hàm ở dưới cùng. vì khi có hàm nó đã tạo một vùng bộ nhớ, nếu ở dưới dùng vùng bộ nhớ đó thì nó sẽ ghi đè.
- [x] `Default arguments (ES)`
- [x] `IIFE` thêm hai cặp dấu () ở cuối hàm thì nó sẽ chạy luôn, không cần gọi
- [x] `Closure` nó xóa cái func nhưng vẫn giữ cái biến của func đó.
- [x] `Callback` bỏ một func A vào một func B, B chạy xong thì nhớ chạy A
- [x] `Bind, call and apply` 
- `bind` Nó sẽ gắn this là cái mà nó được bind
- `call` Tương tự, nhưng nó sẽ chạy luôn
- `apply` gần giống call nhưng muốn truyền đối số thì phải truyền array, còn call thì được truyền object
- [x] `Function borrowing` dùng call để sử dụng thuộc tính mà nó bind

### 6. OOP
- [x] `__proto__`  thể hiện tính oop trong javascript
- [x] `Reflection` là object có thể nhìn vào chính bản thân object đó và thay thuộc tính, phương thức bên trong nó
- [x] `Function constructor` có từ khóa new thì nó sẽ tạo vùng bộ nhớ mới và this nó sẽ trỏ vào vùng bộ nhớ đó
> *Chữ đầu còn function constructor nên viết hoa*
- [x] `Prototype` để thêm thuộc tính của một object, constructor, vì cơ chế là nó sẽ tìm thuộc tính trong object, nếu không có thì nó sẽ tìm trong `__proto__` của nó (Ưu điểm là tiết kiệm bộ nhớ, không phải tạo một hàm mới trong object mà chỉ việc thêm proto vào trong)
- [x] `Sử dụng: Object.create(obj)` để thêm thuộc tính vào proto
- [x] `ES6 tạo object với class`
- [x] Kế thừa một class với extends

### **7. ES6**
- [x] `Let and Var` var là function scope, let là block scope
- [x] `Arrow function` ứng dụng forEach
* Điểm khác nhau arrow function và function bình thường là khi mà một hàm trong một object thì this nó sẽ trỏ về global, function bình thường this nó sẽ trỏ về object cha của nó*
* Không nên dùng method trong object, callback (nếu như sử dụng thuộc tính cha)
- [x] `Destructuring` tách ra thành array, normal, array, function
- [x] `Spread Operator` 
1. `concat array` const appleProducts = [...iphones, 'iphontX', ...macbooks, macbooks2020]
2. `spread string`
3. `copy array:` nếu thay đổi value của array mới sẽ không bị thay đổi value của array cũ
4. function
- [x]  `Rest operator` gom lại thành array
- [x]  `Property value shorthand` Cùng tên bỏ được
 
###  8. Promise
- [ ] AsyncAwait
