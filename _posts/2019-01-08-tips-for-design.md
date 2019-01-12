---
layout: post
title: Tips cho Designer
subtitle: Tổng hợp những tips cho việc thiết kế.
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [star, follow]
tags: [code]
keywords:
  [
    thaycacac,
    tips for design,
    cheating at design,
    tips thiết kế web,
    tips thiet ke web,
    thủ thuật thiết kế web,
    thiet ke web,
    thiet ke,
    thiết kế,
    design,
  ]
---

Nhiều công ty không có người design làm full-time khiến cho việc chờ đợi design rất mất thời gian và đôi khi bạn muốn code một tính năng mới ngay lập tức nhưng lại không có thiết kế vì bạn "Không phải là nghệ sĩ". Nhưng thật ra có rất nhiều mánh khoé bạn có thể sử dụng cho công việc của mình mà không cần có kiến thức nền tảng đồ hoạ.

### Sử dụng màu sắc và độ đậm nhạt để thể hiện mức độ thay vì chỉnh sửa size

![trick1](https://i.imgur.com/e2k58Vc.png)

Một lỗi phổ biến là thường sử dụng size chữ để thể hiện mức độ quan trọng của nó.

`“Is this text important? Let’s make it bigger.”`

`“Is this text secondary? Let’s make it smaller.”`

Thay vào đó bạn hãy sử dụng màu sắc và độ đậm nhạt của chữ để thể hiện nó sẽ đạt hiệu quả tương tự.

`“Is this text important? Let’s make it bolder.”`

`“Is this text secondary? Let’s use a lighter color.”`

Hãy thử 2 hoặc 3 màu

- **Màu tối** (không phải đen) dùng làm màu cho nội dung chính (tỷ dụ như headlind của bài viết)
- **Màu xám** cho nội dung secondary (tỷ dụ như ngày, trạng thái của bài viết)
- **Màu xám sáng** cho nội nội dung phụ (tỷ dụ như thống báo bản quyền ở footer)

![trick2](https://i.imgur.com/PBrJyj0.png)

Tương tự, hai font-weight là đủ làm việc với UI:

- Font weight bình thường (tầm 400 hoặc 500 dự vào font chữ) cho hầu hết các văn bản
- Font weight đâm hơn (tầm 600 hoặc 700) dành cho các đoạn text bạn muốn nhấn mạnh

![trick3](https://i.imgur.com/DC9qW34.png)

**Tránh việc để font-weight dưới 400** vì chúng có thể chúng sẽ làm cho headings to hơn nhưng sẽ rất khó đọc. Nếu như bạn có ý định như thế thì hãy làm cho màu chữ đậm lên hoặc thay đổi kích thước chữ.

### Không sử dụng chữ màu xám trên màu nền khác trắng

![trick4](https://i.imgur.com/1ur2DGs.png)

Sử dụng màu xám nhạt là một cách tốt để làm nó nổi bật trên nền trắng nhưng nó không được ổn trên nên màu. Bạn có thể sử dụng màu text gần với màu background để thể hiện mức độ là một cách tốt.

![trick5](https://i.imgur.com/dBtjVGo.png)

Có 2 cách để giảm độ tương phản:

- **Giảm opacity của chữ trắng**: sử dụng chữ màu trắng và giảm opacity xuống. Khi đó sẽ có một chút màu của background trong màu text vì thế nó sẽ làm nổi bật văn bản mà lại không xung đột với màu nền.

![trick6](https://i.imgur.com/h99JsdK.png)

- **Chọn một màu dựa trên màu của background**: cách này tốt hơn cách trên: chọn màu cùng `hue` với màu background sau đó chỉnh độ sáng cho đến khi phù hợp

![trick7](https://i.imgur.com/RPEg4F0.png)

### Offset shadows

![trick8](https://i.imgur.com/EdI8gqI.png)

Thay vì làm to blur và spread values để làm nổi bật box thì hãy thêm một vertical offset. Nó nhìn trông tự nhiên hơn rất nhiều vì nó sẽ tạo cảm giác có nguồn sáng chiếu chéo xuống dưới giống ở thực tế hơn.

Nếu như làm bảo với form input bạn có thể áp dụng dưới đây

![trick9](https://i.imgur.com/F5viUL8.png)

### Bớt sử dụng border

![trick10](https://i.imgur.com/kboRf9Q.png)

Khi bạn muốn tách biệt cách thành phần với nhau, bạn không nên lúc nào cũng sử dụng border để làm chúng vì như thế sẽ làm bố cục lộn xộn và cảm giác khó chịu. Bạn có thể sử dụng một số cách sau cũng với mục đích tương tự:

- **Sử dụng box shadow**: đây là một cách tốt để chia các thành phần nó cũng gần tương tự với border nhưng sẽ mang lại cảm giác nhẹ nhành hơn rất nhiều

![trick11](https://i.imgur.com/85IDaWc.png)

- **Sử dụng màu background khác nhau**: chọn màu nền gần tương tự nhau và xoá bỏ border cũng là một cách để phân tách các phần tử với nhau.

![trick12](https://i.imgur.com/5L5ON5y.png)

- **Sử dụng extra spacing**: khoảng cách xa hơn là một cách tuyệt vời để tạo ra sự phân tách giữa các yếu tố.

![trick13](https://i.imgur.com/7GlOzJ7.png)

### Đừng cố phóng to icon

![trick14](https://i.imgur.com/Ad4Wxtg.png)

Nếu như bạn đang thiết kế và bạn muốn sử dụng icon với kích thước to. Bạn có thể sử một một số set icon free như _Font Awesome_ hoặc _Zondicons_. Mặc dù nó được vẽ bằng vector tuy nhiên nếu như bạn zoom lên tầm 3x 4x thì nhìn vào không còn được chuyên nghiệp nữa. Thay vì thế bạn có thể cho các icon vào các hình khối như hình tròn, hình vuông và sử dụng màu nền để giải quyết vấn đề này.

### Thêm màu border giúp đỡ tẻ nhạt

![trick15](https://i.imgur.com/TikGlhK.png)

Một cách rất đơn giản tạo sự khác biệt, nhấn nhá trong UI của bạn là hãy sử dụng các đường viền có màu sắc sặc sỡ.

![trick16](https://i.imgur.com/lse6EZO.png)

### Không phải lúc nào cũng nên để màu nền cho button

![trick17](https://i.imgur.com/uclFG4Z.png)

Khi mà trên một trang mà người dùng thực hiện nhiều hành động thì rất dễ làm rối mắt người xem. Một số framework như Bootstrap cung cấp một số menu với màu sắc thể hiện ngữ nghĩa cho hành động ở dạng button như:

![trick18](https://i.imgur.com/kbmtkZl.png)

Tỷ dụ như: `Đó là một hành động tích cực? Hãy sử dụng button màu xanh lá cây`, chính vì điều này nó sẽ giúp cho việc thể hiện mức độ được rõ ràng hơn. Ngoài ra cần chú ý:

- **Những hành động chính nên rõ ràng**: sử dụng solid, độ tương phản màu nền cao.
- **Các hành động phụ nên rõ ràng nhưng không cần nổi bật**: Outline styles hoặc là độ tưởng phản màu nền thấp.
- **Các hành động thứ ba làm đơn giản**: Tốt nhất là nên để như một đường link.

![trick19](https://i.imgur.com/wNK3ZB5.png)

### Sử dụng shadow bên trong thay vì border

Nếu bạn đang làm việc với hình ảnh bạn có thể sử dụng bóng đổ vào bên trong hình ảnh để tạo sự khác biệt thay vì border. Border có thể sẽ xung đột màu với hình ảnh trong khi hầu như mọi người không thể nhìn ra shadow bên trong đó.

![trick20](https://i.imgur.com/AzZmIkp.png)

### Hãy sáng tạo thay vì cứ mãi sử dụng text

Hãy tạo ra một UI riêng biệt, bạn có thể thiết kế chúng một cách thú vị, độc đáo theo cách của bạn.

![trick21](https://i.imgur.com/dv5wuXs.png)

![trick22](https://i.imgur.com/ebbIfZV.png)

![trick23](https://i.imgur.com/c8ar4dV.png)

### Hãy để ý tới độ tương phản

Khi sử dụng màu nền trắng để đạt được tỷ lệ tương phản là rất khó. Để tránh sự sặc sỡ khi kết hợp với màu nền các thành phần khác một trong những cách là giảm opacity xuống:

![trick24](https://i.imgur.com/4lbfakA.png)

### Đừng để radio button mãi là list

Hãy sáng tạo giao diện cho các radio button đừng để nó giới hạn bởi các danh sách điển hình. Tỷ dụ như sử dụng chọn card bằng cách trình bày như dưới đây theo cách thú vị hơn:

![trick25](https://i.imgur.com/iLT2I5h.png)

[sourse](https://twitter.com/i/moments/994601867987619840)
[sourse](https://medium.com/refactoring-ui/7-practical-tips-for-cheating-at-design-40c736799886)
