---
layout: post
title: Nghệ thuật UI
subtitle: UI designer
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [follow]
categories: [share]
tags: [design]
description: Có bạn đã nghe về UI/ UX rồi nhưng bạn có biết chúng là cái gì, làm công việc gì không? Bài viết này mình sẽ giúp các bạn hiểu qua về UI và tập trung vào các kỹ thuật trong UI
keywords: [
  ui ux,
  ui website,
  ui kit la gi,
  ui ux cho web,
  ui design,
  ui designer,
  user experience design,
  ui ux designer tuyen dung,
  học thiết kế ui ux,
  quy trình thiết kế ui
]
---

Có bạn đã nghe về UI/ UX rồi nhưng bạn có biết chúng là cái gì, làm công việc gì không? Bài viết này mình sẽ giúp các bạn hiểu qua về UI và tập trung vào các kỹ thuật trong UI.

## UI là gì?

UI (viết tắt của _User Interface_) là phần giao diện người dùng bao gồm những thứ về hình khối, fonts chữ, kích thuước, màu sắc...vv

Công việc của UI Designer là thiết kế giao diện sản phẩm: kích thước, màu sắc, font chữ, hình ảnh, icon...

## Bắt đầu từ con số không

Khi bạn bắt đầu thiết kế cho một app hoặc web bạn sẽ thiêt kế cái gì trước? Navigatioin hay logo hay sidebar? Câu trả lời là bạn nên bắt đầu thiết kế dựa trên tính năng của project trước `Start with a feature, not a layout` chứ không nên đi cự thể từng phần. Tỷ dụ như bạn làm tính năng tìm kiếm chuyến bay thì hãy nên liệt kế các trường của nó như:

- Trường điểm khởi hành
- Trường điểm đến
- Trường thời gian khởi hành
- Trường ngày trở lại
- Một button để search
  Sau đó hãy thiết kế nó một cách simple để định hình như thế nào rồi mới vào thiết kế hoàn chỉnh.

Không nên design quá nhiều một lúc vì như thế có thể tốn nhiều thời gian trong công đoạn thiết kế, có thể dẫn đến áp lực vì bị thời gian thúc ép. Thay vào đó hãy nên làm việc theo cycle, tức là design - code xoay vòng theo từng công đoạn của dự án. Hiện nay các công ty đang có xu hướng làm việc theo mô hình này, phổ biết đó là [Agile - Scrum](https://thaycacac.github.io/2019-01-15-overview-agile-scrum/)

## Hãy chọn một phong cách

Mọi design đếu có một phong cách của nó tỷ dụ như ngân hàng thì đặc tính của nó sẽ là _an toàn_ và _chuyên nghiệp_, các ứng dụng của giới trẻ thì sẽ là _fun_ và _vui tươi_. Và một số các thuộc tính dưới đây sẽ quyết định phần lớn phong cách của bạn:

**Font chữ** font chữ sẽ khiến cho người dùng cảm thầy như thế nào:

- Nếu bạn muốn một vẻ thanh lịch hoặc cổ điển thì bạn có thể chọn font **serif**
  ![ui1](https://i.imgur.com/2sfgAbT.png)

- Nếu bạn muốn nhìn vui tươi hơn thì có thể sử dụng font **sans serif**.

![ui2](https://i.imgur.com/OdOlTx9.png)

- Còn nếu như muốn tạo một phong cách đơn giản và dựa trên các yếu tố khác thì có thể chọn **neutral sans serif**

![ui3](https://i.imgur.com/a1PNvwL.png)

**Màu sắc**: có rất nhiều bài nói về tâm lý dựa vào màu sắc nhưng bạn chỉ cần chú ý tới màu sắc sẽ khiến người dùng cảm thấy thế nào đối với từng dự án cụ thể.

- Màu xanh sẽ khiến người dùng cảm thấy an toàn và quen thuộc.
- Màu vàng sẽ tạo ra cảm giác sang trọng và tinh tế.
- Màu hồng có cảm giác vui vẻ và tập trung,...

**Border radius** nó sẽ khiến các hình khối của bạn trở nên khác nhau và tác động tới cảm giảm chung của người dùng.

- Border radius nhỏ thì không thực sự thể hiện được phong cách của thiết kế trong dự án.
- Border radius to sẽ khiến có cảm giác vui tươi hơn.
-

Điều quan trọng là bạn phải giữ được ôhng cách mà bạn bọn xuyên suốt dự án. Tức là bạn không được mix quá nhiều màu, không nên lúc thì sử dụng border radius to chỗ thì nhỏ,... cần phải tạo sự xuyên suốt trong thiết kế để có thể tạo được phòng cách của nó.

## Giới hạn sự lựa chọn lại

Hiện nay có hàng tỷ màu và có hàng ngàn font chữ, vậy thì làm sao chọn cho phù hợp trong khi bạn thấy màu này cũng đẹp, màu kia cũng ổn, font này cũng được, font kia cũng không tệ. Khi design, thực sự vấn đề lựa chọn gây khó khăn và có thể bạn sẽ mất khá nhiều thời gian để thử cái này cái nọ. Tỷ dụ như hình dưới đây, mặc dù là 3 button với 3 màu background khác nhau nhưng dường như chúng ta nhìn không có nhiều khác biệt cho lắm:

![ui4](https://i.imgur.com/3EfSHT1.png)

Cách giải quyết ở đây là hãy giới hạn những lựa chọn của bạn lại. Hãy định nghĩa ra một số các lựa chọn của color, font size,... Tỷ dụ như bạn hãy định ra những lựa chọn cho việc chọn size của icon là `12px 16px, 24px và 32px`:

![ui5](https://i.imgur.com/iGXBu8u.png)

Như vậy việc lựa chọn của bạn sẽ bị giới hạn và dễ hơn nhiều, công việc chỉ là lựa chọn trong đống kia xem cái nào là phù hợp là được. Tỷ dụ như dưới đây:

![ui6](https://i.imgur.com/Pjd665w.png)
