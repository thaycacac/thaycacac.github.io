Javascript đang trở thành ngôn ngữ lập trình phổ biến nhất thế giới. Là công cụ để xây dựng hầu hết những ứng dụng hiện đại từ web tới mobile. Đi kèm với đó là số lượng người học javascript cũng tăng lên chóng mặt. Nhưng việc học javascript online chưa bao giờ là dễ cả.

Bài này chúng ta sẽ cùng nhau tìm hiểu về một số chủ đề nâng cao trong Javascript sẽ giúp bạn cải thiện nó nhé:

## This trong Javascript

`this` trong Javascript chính là bối cảnh(context) của nơi mà hàm chứa từ `this` được gọi. Bạn hãy nhớ từ `this` tham chiếu tới cái vùng không gian mà hàm chứa từ `this` được gọi.

Chỉ có 2 loại context đối với `this` là object chứa method được gọi hoặc global , ngoài ra không có loại khác. Khi gặp từ `this` , chỉ quan tâm tới cái nơi gọi hàm chứa nó chứ không được dịch `this` là nội hàm hiện tại.
Chúng ta sẽ cùng tìm hiểu kỹ hơn trong video này nhé:

[![This trong Javascript](https://i9.ytimg.com/vi_webp/NlvKvQWB2EI/mqdefault.webp?v=62218142&sqp=CPys3ZcG&rs=AOn4CLD2QfargutHCndbCNINs84kaGfDGw)](https://www.youtube.com/watch?v=UmX4kyB2wfg)

## Prototype trong Javascript

Khi lập trình, mọi người thường mong muốn có thể tái sử dụng code và mở rộng thêm các tính năng.

Ví dụ, bạn có một đối tượng `user` với các thuộc tính và phương thức. Sau đó, bạn muốn tạo đối tượng mới là `admin` và `guest` dựa trên đối tượng `user`, nhưng không phải copy-paste lại code mà chỉ sử dụng lại những thứ mà `user` có, rồi tạo thêm thuộc tính hoặc phương thức mới.

Để làm được điều đó, bạn có thể sử dụng `prototype` trong JavaScript để kế thừa lại object `user`. Vậy prototype là gì và cách sử dụng prototype như thế nào hay coi video dưới đây nhé!

[![Prototype trong Javascript](https://i9.ytimg.com/vi_webp/ETMBVu7xWlc/mqdefault.webp?v=621de152&sqp=CKiv3ZcG&rs=AOn4CLCgXrVMjc606G98E6wtOnCpApfOMQ)](https://www.youtube.com/watch?v=ETMBVu7xWlc&ab_channel=TechMely)
