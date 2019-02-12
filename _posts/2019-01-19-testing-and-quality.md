---
layout: post
title: Testing ảnh hưởng gì đến Software quality
subtitle: Testing ảnh hưởng gì đến chất lượng phần mềm
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [star, follow]
tags: [share]
keywords: [
thaycacac,
testing,
quality
]
---

Bạn có bao giờ tự hỏi test để làm gì? Bài viết này chúng ta sẽ tìm hiểu xem testing ảnh hưởng gì đến quality và quality của phần mềm thì có liên quan gì đến testing.

Tesing là **thước đo** của chất lượng dựa trên số defects được tìm thấy, các test chạy và hệ thống covered bởi những bài test. Chúng ta có thể thực hiện công việc này trên của `functionial software requirement` và `non-functional software requirement`.

* Functional là những yêu cầu cụ thể của tính năng tỷ dụ như nhập input thì output phải chính xác.
* Non-functional bao gồm độ tin cậy, khả năng sử dụng, khả năng bảo trì, khả năng tái sử dụng, khả năng test,... Tỷ dụ như một function phải chạy đủ nhanh, không được quá chậm.

Testing sẽ mang lại sự tự tin cho phần mềm nếu nó tìm thấy ít lỗi hoặc không có lỗi nhưng chúng phải được kiểm tra nghiêm ngặt. Thế nào là nghiêm ngặt? Nghiêm ngặt là chúng ta phải có những bài test tốt có thể cover được các trường hợp xấu, còn những bài test tệ là những bài test không tìm được defect nó khiên ta an toàn một các ngu muội.

Khi test và tìm thấy defect chất lượng của phần mềm sẽ tăng lên khi mà lỗi đó được fixed những chúng phải được thực hiện đúng cách.

### Quality là gì?

Bất kể một project nào cũng đều được cung cấp các thông số kỹ thuật. Với các dự án phải giao cho khách hàng thì càng phải chính xác. Điều này như là `validation` (nó có phải là specification đúng không ?) và `verification` (hệ thống có chạy đúng với specification không?).

Định nghĩa bảng chú giải của ISTQB nói rằng quality không chỉ bao gồm những specified requirements mà nó còn bao gồm cả những gì user và customer cần và mong đợi. Khi làm việc cần phải thống nhất với khách hàng những gì mà họ mong đợi. Dưới phương diện của developers và tester thì quality là phần mềm đáp ứng được các đặc điểm kỹ thuật xác định. Để so sánh những kỳ vọng của mọi người thì bảng dưới đây sẽ tóm tắt và giải thích quan điểm quality trong phần mềm và việc chọn cà chua để nhìn thấy cách tiếp cận khác nhau.

|Khía cạnh|Software|Tomatoes|
|--------|--------|--------|
|Quality được kiểm định bằng cách nhìn vào thuộc tính sản phẩm|Chúng ta kiểm định các tính chất của phần mềm (Tỷ dụ như sự tin cậy giữa khoảng thời gian giữa failures và bỏ đi khi chúng đến một mức nhất định theo MTBF là 12h).| Với cà cua thì có hình dạng và kích cỡ phù hợp, có màu đẹp và ngon.|
|Quality là sự phù hợp để sử dụng. Quality có thể có những khía cạnh khách quan không chỉ về số lượng| Chúng ta hỏi xem người dùng xem phần mềm có đáp ứng yêu cầu của họ không. Nếu thỏa mãn thì chúng ta phát hành sản phẩm. | Quả cà chua thì phù hợp với việc nấu ăn.|
|Quality dựa trên quá trình sản xuất tốt, đáp ứng được nhu cầu cơ bản, được đo lường bằng việc test, kiểm định, phân tích faults và failures| Chúng ta sẽ sử dụng một tiến trình phát triển phần mềm được công nhận. Phần mềm chỉ được phát hành nếu tìm thấy không quá 5 defect với mức độ cao và phải qua tất cả các công đoạn test. | Quả cà chua phải được trồng một cách hữu cơ. Không bị dập và không bị sâu bọ cắn.|
|Yêu cầu về giá trị tiền mặt: giá thành hợp lý, trao đổi giá trị dựa trên thời gian, công sức và vốn| Chúng ta có khung thời gian 2 tuần để giữ không bị quá vốn dự án | Cà chua có hạn sử dụng dài, rẻ và phù hợp với giá tiền|
|Về cảm giác, cảm xúc của cá nhân của nhóm về một sản phẩm hoặc nhà cung cấp | Chúng ta thích phần mềm này nó hay mới lại, nó có một vài lỗi, không sao cả chúng ta vẫn dùng nó hay chúng ta thích team nay, có một số vấn để nảy sinh. Không sao cả, sẽ giải quyết chúng nhanh thôi, chúng ta tin tưởng họ|Chúng tôi lấy cà chua từ một trang trại gần đây và rất thân thiết với các nông dân|