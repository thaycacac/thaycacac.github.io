---
layout: post
title: 5 chủ đề javascript nâng cao bạn nên nắm chắc
subtitle: Binh vô thường thế, thủy vô thường hình, năng nhân địch biến hóa nhi thủ thắng giả, vị chi thần...
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [follow]
categories: [frontend, backend]
tags: [backend, frontend]
keywords: [
   javascript nâng cao,
   các chủ đề javascript nâng cao,
   5 chủ đề javascript nâng cao,
   This trong Javascript,
   Prototype trong Javascript,
   Currying trong JavaScript,
   Higher Order Functions trong Javascript,
   Shallow copy và Deep copy trong Javascript 
]
---

Javascript đang trở thành ngôn ngữ lập trình phổ biến nhất thế giới. Là công cụ để xây dựng hầu hết những ứng dụng hiện đại từ web tới mobile. Đi kèm với đó là số lượng người học javascript cũng tăng lên chóng mặt. Nhưng việc học javascript online chưa bao giờ là dễ cả.

Bài này chúng ta sẽ cùng nhau tìm hiểu về một số chủ đề nâng cao trong Javascript sẽ giúp bạn cải thiện nó nhé:

## This trong Javascript

`this` trong Javascript chính là bối cảnh(context) của nơi mà hàm chứa từ `this` được gọi. Bạn hãy nhớ từ `this` tham chiếu tới cái vùng không gian mà hàm chứa từ `this` được gọi.

Chỉ có 2 loại context đối với `this` là object chứa method được gọi hoặc global , ngoài ra không có loại khác. Khi gặp từ `this` , chỉ quan tâm tới cái nơi gọi hàm chứa nó chứ không được dịch `this` là nội hàm hiện tại.
Chúng ta sẽ cùng tìm hiểu kỹ hơn trong video này nhé:

[![This trong Javascript](https://user-images.githubusercontent.com/29374426/187132884-4c8c2108-643d-4fd3-87c6-d0d27b4e1f28.png)](https://youtu.be/NlvKvQWB2EI)

## Prototype trong Javascript

Khi lập trình, mọi người thường mong muốn có thể tái sử dụng code và mở rộng thêm các tính năng.

Ví dụ, bạn có một đối tượng `user` với các thuộc tính và phương thức. Sau đó, bạn muốn tạo đối tượng mới là `admin` và `guest` dựa trên đối tượng `user`, nhưng không phải copy-paste lại code mà chỉ sử dụng lại những thứ mà `user` có, rồi tạo thêm thuộc tính hoặc phương thức mới.

Để làm được điều đó, bạn có thể sử dụng `prototype` trong JavaScript để kế thừa lại object `user`. Vậy prototype là gì và cách sử dụng prototype như thế nào hay coi video dưới đây nhé!

[![Prototype trong Javascript](https://user-images.githubusercontent.com/29374426/187132755-fc7c9ecd-1c89-45d5-b7c9-ed3dbb8d18c2.png)](https://www.youtube.com/watch?v=ETMBVu7xWlc&ab_channel=TechMely)

## Currying trong JavaScript

Cũng như `Prototype`, chúng ta luôn hướng đến viết một đoạn code mà có thể sử dụng nó lại nhiều lần và ít tốn kém thời gian hơn. `Curying` giúp chúng ta tốt trong việc sử dụng lại các chức năng. Nói một cách khác mà trong các framework hay xây dựng các hàm helper để định nghĩa một hàm nào đó mà được sử dụng lại nhiều lần.

Currying là kỹ thuật mà cho phép chuyển đổi một function với nhiều tham số thành những functions liên tiếp có một tham số. Nói cách khác, khi một function, thay vì lấy tất cả arguments cùng một lúc, lấy hàm thứ nhất và trả về hàm mới lấy hàm thứ hai và trả về hàm mới lấy hàm thứ ba, và tiếp tục cho đến khi tất cả các đối số đã được hoàn thành. Cùng tìm hiểu thêm trong video dưới đây nhé!

[![Currying trong JavaScript](https://user-images.githubusercontent.com/29374426/187133027-71feded2-0856-4268-8331-b7c9d74e966f.png)](https://www.youtube.com/watch?v=d6s3BXUjOy0&ab_channel=TechMely)

## Higher Order Functions trong Javascript

Function chấp nhận đầu vào và/hoặc đầu ra là một function được gọi là higher order function.

Thay vì `string`, `number`, `boolean`, nó sử dụng function khác để làm in/out, nên vì thế ở cấp độ cao hơn như việc vận hành function.

Với function trong Javascript, bạn có thể:

- Lưu chúng như biến
- Sử dụng như array
- Assign các thuộc tính như một object
- Cho vào các giá trị argument
- Return từ một function khác

Để hiểu sâu hơn về Higher Order Functions trong Javascript hãy xem video này nhé!

[![Higher Order Functions trong Javascript](https://user-images.githubusercontent.com/29374426/187133138-3fa72d7c-e1af-48c1-a6e0-ec3da98f26a1.png)](https://www.youtube.com/watch?v=d8X241FCJNs&ab_channel=TechMely)

## Shallow copy và Deep copy trong Javascript 

Trong lập trình, chúng ta lưu trữ data dưới dạng các biến. Tạo một copy tức là khởi tạo một biến mới có cùng giá trị. Tuy nhiên luôn có cạm bẫy luôn rình rập, đó là `deep copy` và `shallow copy`.

`Deep copy` (sao chép sâu) tức là tạo mới một biến có cùng giá trị và được cắt đứt quan hệ hoàn toàn với biến được copy.

`Shallow copy` có ý nghĩa rằng sau khi copy, biến mới hoặc các thành phần của biến mới vẫn còn quan hệ dây mơ rễ má với biến ban đầu, nguy hiểm quá nhỉ. Để hiểu thêm về copy, chúng ta cùng tìm hiểu video dưới đây

[![Higher Order Functions trong Javascript](https://user-images.githubusercontent.com/29374426/187133234-1a03e078-b66d-4bdf-88fe-1140e2d022c8.png)](https://www.youtube.com/watch?v=VCsiG54IdSw&ab_channel=TechMely)

