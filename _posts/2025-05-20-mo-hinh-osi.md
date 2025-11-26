---
layout: post
title: Mô hình OSI 7 lớp
subtitle: Hướng dẫn chi tiết về mô hình OSI và TCP/IP trong mạng máy tính
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [follow]
categories: [course recap]
tags: [course recap]
---

Mô hình OSI (Open Systems Interconnection) là một khung tham chiếu giúp chúng ta hiểu cách các thiết bị mạng giao tiếp với nhau. Mặc dù mô hình OSI không được triển khai thực tế trong mạng Internet hiện đại (thay vào đó là TCP/IP), nhưng việc hiểu mô hình OSI sẽ giúp bạn nắm vững các khái niệm cơ bản về mạng máy tính và cách dữ liệu được truyền từ máy này sang máy khác.

## Mô hình OSI là gì?

**Mô hình OSI** được phát triển bởi Tổ chức Tiêu chuẩn hóa Quốc tế (ISO) vào năm 1984. Mô hình này chia quá trình truyền dữ liệu trong mạng thành **7 lớp** (layers), mỗi lớp có một chức năng cụ thể và độc lập với các lớp khác.

### Tại sao cần mô hình OSI?

Trước khi có mô hình OSI, các nhà sản xuất thiết bị mạng sử dụng các giao thức riêng, khiến các thiết bị khác nhau không thể giao tiếp với nhau. Mô hình OSI ra đời để:

- **Chuẩn hóa** cách các thiết bị mạng giao tiếp
- **Phân chia** các chức năng phức tạp thành các lớp đơn giản hơn
- **Tạo điều kiện** cho các nhà sản xuất khác nhau phát triển sản phẩm tương thích
- **Giúp troubleshooting** dễ dàng hơn bằng cách xác định lớp nào gặp vấn đề

### Nguyên tắc hoạt động

Mô hình OSI hoạt động theo nguyên tắc **"từ trên xuống dưới"** khi gửi dữ liệu và **"từ dưới lên trên"** khi nhận dữ liệu:

- **Khi gửi:** Dữ liệu đi từ lớp 7 (Application) xuống lớp 1 (Physical)
- **Khi nhận:** Dữ liệu đi từ lớp 1 (Physical) lên lớp 7 (Application)

Mỗi lớp sẽ thêm/tháo bỏ thông tin điều khiển (header) của riêng nó vào/ra khỏi dữ liệu.

## 7 Lớp của mô hình OSI

Hãy tưởng tượng bạn đang gửi một lá thư qua bưu điện. Quá trình này tương tự như cách mô hình OSI hoạt động:

### Lớp 7: Application Layer (Lớp Ứng dụng)

**Chức năng:** Cung cấp giao diện cho người dùng và ứng dụng để truy cập các dịch vụ mạng.

**Vai trò:** Đây là lớp gần với người dùng nhất. Nó không phải là ứng dụng mà bạn sử dụng (như trình duyệt web), mà là các giao thức mà ứng dụng sử dụng để giao tiếp qua mạng.

**Ví dụ:** Khi bạn mở trình duyệt và truy cập một website, lớp Application cung cấp các giao thức như HTTP để trình duyệt có thể giao tiếp với web server.

**Các giao thức phổ biến:**
- **HTTP/HTTPS:** Giao thức web
- **FTP:** Truyền file
- **SMTP:** Gửi email
- **POP3/IMAP:** Nhận email
- **DNS:** Phân giải tên miền
- **SSH:** Kết nối từ xa an toàn
- **Telnet:** Kết nối từ xa (không mã hóa)

**Đơn vị dữ liệu:** Data/Message

**Ví dụ thực tế:** Khi bạn gõ "google.com" vào trình duyệt, lớp Application sử dụng HTTP để yêu cầu trang web từ server.

### Lớp 6: Presentation Layer (Lớp Trình bày)

**Chức năng:** Chuyển đổi, mã hóa và nén dữ liệu để đảm bảo các hệ thống khác nhau có thể hiểu được dữ liệu.

**Vai trò:** 
- **Mã hóa/Giải mã:** Chuyển đổi dữ liệu giữa các định dạng khác nhau
- **Nén dữ liệu:** Giảm kích thước dữ liệu để truyền nhanh hơn
- **Mã hóa bảo mật:** Mã hóa dữ liệu để bảo vệ thông tin

**Ví dụ:** 
- Chuyển đổi văn bản ASCII sang Unicode
- Nén file hình ảnh (JPEG, PNG)
- Mã hóa SSL/TLS cho HTTPS

**Đơn vị dữ liệu:** Data/Message

**Ví dụ thực tế:** Khi bạn upload một file ảnh, lớp Presentation sẽ nén file đó để giảm dung lượng trước khi gửi đi.

### Lớp 5: Session Layer (Lớp Phiên)

**Chức năng:** Thiết lập, quản lý và kết thúc các phiên giao tiếp giữa các ứng dụng.

**Vai trò:**
- **Thiết lập phiên:** Tạo kết nối giữa hai ứng dụng
- **Quản lý phiên:** Duy trì kết nối trong suốt quá trình giao tiếp
- **Đồng bộ hóa:** Đảm bảo dữ liệu được truyền đúng thứ tự
- **Kết thúc phiên:** Đóng kết nối một cách an toàn

**Ví dụ:** 
- Khi bạn đăng nhập vào một website, lớp Session tạo một phiên làm việc
- Khi bạn đăng xuất, lớp Session đóng phiên đó

**Đơn vị dữ liệu:** Data/Message

**Ví dụ thực tế:** Khi bạn đăng nhập vào Facebook, lớp Session tạo một session ID để duy trì trạng thái đăng nhập của bạn trong suốt thời gian sử dụng.

### Lớp 4: Transport Layer (Lớp Vận chuyển)

**Chức năng:** Đảm bảo việc truyền dữ liệu giữa các máy tính một cách đáng tin cậy và hiệu quả.

**Vai trò:**
- **Phân đoạn dữ liệu:** Chia dữ liệu lớn thành các segment nhỏ hơn
- **Đánh số thứ tự:** Đánh số các segment để có thể sắp xếp lại
- **Kiểm tra lỗi:** Phát hiện và yêu cầu truyền lại dữ liệu bị lỗi
- **Điều khiển luồng:** Đảm bảo máy gửi không gửi quá nhanh so với khả năng nhận của máy nhận

**Hai giao thức chính:**

1. **TCP (Transmission Control Protocol):**
   - **Đáng tin cậy:** Đảm bảo dữ liệu đến đúng đích
   - **Có kết nối:** Thiết lập kết nối trước khi truyền dữ liệu
   - **Chậm hơn:** Do phải kiểm tra và xác nhận
   - **Sử dụng cho:** Web browsing, email, file transfer

2. **UDP (User Datagram Protocol):**
   - **Không đáng tin cậy:** Không đảm bảo dữ liệu đến đích
   - **Không kết nối:** Gửi dữ liệu ngay không cần thiết lập kết nối
   - **Nhanh hơn:** Do không cần kiểm tra và xác nhận
   - **Sử dụng cho:** Video streaming, online gaming, DNS queries

**Đơn vị dữ liệu:** Segment (TCP) hoặc Datagram (UDP)

**Ví dụ thực tế:** 
- Khi bạn tải một file lớn, TCP sẽ chia file thành nhiều segment, gửi từng segment và đảm bảo tất cả đều đến đích.
- Khi bạn xem video trực tuyến, UDP được sử dụng để truyền nhanh, một số gói bị mất không quan trọng bằng việc xem được video ngay lập tức.

### Lớp 3: Network Layer (Lớp Mạng)

**Chức năng:** Định tuyến dữ liệu từ nguồn đến đích qua nhiều mạng khác nhau.

**Vai trò:**
- **Định địa chỉ logic:** Gán địa chỉ IP cho các thiết bị
- **Định tuyến:** Tìm đường đi tốt nhất để truyền dữ liệu
- **Chuyển tiếp gói:** Chuyển gói dữ liệu từ mạng này sang mạng khác

**Giao thức chính:** **IP (Internet Protocol)**

**Địa chỉ IP:**
- **IPv4:** 32 bit, ví dụ: 192.168.1.1
- **IPv6:** 128 bit, ví dụ: 2001:0db8:85a3:0000:0000:8a2e:0370:7334

**Các thiết bị hoạt động ở lớp này:**
- **Router:** Thiết bị định tuyến, chuyển tiếp gói dữ liệu giữa các mạng
- **Layer 3 Switch:** Switch có khả năng định tuyến

**Đơn vị dữ liệu:** Packet

**Ví dụ thực tế:** Khi bạn gửi email từ nhà đến một người ở nước khác, lớp Network sẽ tìm đường đi tốt nhất qua nhiều router và mạng khác nhau để đưa email đến đích.

### Lớp 2: Data Link Layer (Lớp Liên kết Dữ liệu)

**Chức năng:** Truyền dữ liệu giữa các thiết bị trong cùng một mạng cục bộ (LAN).

**Vai trò:**
- **Định địa chỉ vật lý:** Sử dụng địa chỉ MAC (Media Access Control)
- **Phát hiện lỗi:** Kiểm tra lỗi trong quá trình truyền
- **Điều khiển truy cập:** Quản lý cách các thiết bị truy cập vào môi trường truyền dẫn

**Hai lớp con:**

1. **LLC (Logical Link Control):** Quản lý kết nối logic
2. **MAC (Media Access Control):** Quản lý truy cập vào môi trường vật lý

**Giao thức phổ biến:**
- **Ethernet:** Giao thức phổ biến nhất cho mạng LAN
- **Wi-Fi (802.11):** Mạng không dây
- **Frame Relay:** Giao thức WAN cũ
- **PPP (Point-to-Point Protocol):** Kết nối điểm-điểm

**Địa chỉ MAC:**
- 48 bit, ví dụ: 00:1A:2B:3C:4D:5E
- Được gán cứng cho card mạng, không thể thay đổi

**Các thiết bị hoạt động ở lớp này:**
- **Switch:** Chuyển tiếp frame dựa trên địa chỉ MAC
- **Bridge:** Kết nối các segment mạng

**Đơn vị dữ liệu:** Frame

**Ví dụ thực tế:** Khi bạn gửi file từ máy tính này sang máy tính khác trong cùng một mạng WiFi, lớp Data Link sử dụng địa chỉ MAC để đảm bảo file đến đúng máy tính.

### Lớp 1: Physical Layer (Lớp Vật lý)

**Chức năng:** Truyền dữ liệu dưới dạng bit (0 và 1) qua môi trường vật lý.

**Vai trò:**
- **Truyền tín hiệu:** Chuyển đổi bit thành tín hiệu điện, ánh sáng, hoặc sóng radio
- **Định nghĩa đặc tính vật lý:** Tốc độ truyền, điện áp, tần số
- **Kết nối vật lý:** Cáp, đầu nối, thiết bị mạng

**Các loại môi trường truyền dẫn:**
- **Cáp đồng (Copper):** Cáp UTP, STP
- **Cáp quang (Fiber optic):** Cáp quang đơn mode, đa mode
- **Không dây (Wireless):** Radio waves, Wi-Fi, Bluetooth

**Các thiết bị hoạt động ở lớp này:**
- **Hub:** Thiết bị khuếch đại tín hiệu (đã lỗi thời)
- **Repeater:** Khuếch đại tín hiệu để truyền xa hơn
- **Cáp mạng:** Cáp Ethernet, cáp quang

**Đơn vị dữ liệu:** Bit

**Ví dụ thực tế:** Khi bạn cắm cáp mạng vào máy tính, lớp Physical chuyển đổi các bit dữ liệu thành tín hiệu điện truyền qua cáp đến router.

## Tóm tắt 7 lớp OSI

Để dễ nhớ, bạn có thể sử dụng câu thần chú:

**"All People Seem To Need Data Processing"** (từ trên xuống dưới)
- **A**ll = Application
- **P**eople = Presentation
- **S**eem = Session
- **T**o = Transport
- **N**eed = Network
- **D**ata = Data Link
- **P**rocessing = Physical

Hoặc từ dưới lên trên:

**"Please Do Not Throw Sausage Pizza Away"**
- **P**lease = Physical
- **D**o = Data Link
- **N**ot = Network
- **T**hrow = Transport
- **S**ausage = Session
- **P**izza = Presentation
- **A**way = Application

## Mô hình TCP/IP

Mặc dù mô hình OSI là khung tham chiếu lý thuyết quan trọng, nhưng trong thực tế, Internet và hầu hết các mạng hiện đại sử dụng **mô hình TCP/IP** (còn gọi là mô hình Internet).

### So sánh OSI và TCP/IP

| OSI Model (7 lớp) | TCP/IP Model (4 lớp) | Chức năng |
|-------------------|----------------------|-----------|
| Application | Application | Giao diện ứng dụng |
| Presentation | Application | Mã hóa, nén dữ liệu |
| Session | Application | Quản lý phiên |
| Transport | Transport | Vận chuyển dữ liệu |
| Network | Internet | Định tuyến |
| Data Link | Network Access | Truyền trong mạng cục bộ |
| Physical | Network Access | Truyền tín hiệu vật lý |

### 4 Lớp của TCP/IP

#### 1. Application Layer (Lớp Ứng dụng)

Tương đương với 3 lớp trên cùng của OSI (Application, Presentation, Session).

**Các giao thức phổ biến:**

- **DNS (Domain Name System):**
  - Chuyển đổi tên miền (google.com) thành địa chỉ IP (172.217.164.110)
  - Port: 53
  - Ví dụ: Khi bạn gõ "google.com", DNS tìm địa chỉ IP tương ứng

- **SSH (Secure Shell):**
  - Kết nối từ xa an toàn với mã hóa
  - Port: 22
  - Ví dụ: Kết nối vào server Linux từ xa một cách an toàn

- **Telnet:**
  - Kết nối từ xa (không mã hóa, không an toàn)
  - Port: 23
  - Ví dụ: Kết nối vào thiết bị mạng để cấu hình

- **FTP (File Transfer Protocol):**
  - Truyền file giữa máy tính và server
  - Port: 21 (control), 20 (data)
  - Ví dụ: Upload website lên hosting

- **BitTorrent:**
  - Giao thức chia sẻ file ngang hàng (P2P)
  - Ví dụ: Tải file từ nhiều nguồn cùng lúc

- **SMTP (Simple Mail Transfer Protocol):**
  - Gửi email
  - Port: 25, 587
  - Ví dụ: Gửi email từ Outlook đến Gmail server

- **RIP (Routing Information Protocol):**
  - Giao thức định tuyến động
  - Ví dụ: Router tự động học các đường đi trong mạng

**Các giao thức khác:**
- **HTTP/HTTPS:** Port 80/443 - Web browsing
- **POP3:** Port 110 - Nhận email
- **IMAP:** Port 143 - Nhận email (nâng cao)
- **SNMP:** Port 161 - Quản lý mạng

#### 2. Transport Layer (Lớp Vận chuyển)

Tương đương với lớp Transport của OSI.

**Hai giao thức chính:**

- **TCP (Transmission Control Protocol):**
  - **Đặc điểm:**
    - Kết nối có hướng (connection-oriented)
    - Đáng tin cậy (reliable)
    - Đảm bảo thứ tự (ordered)
    - Điều khiển luồng (flow control)
    - Kiểm tra lỗi và truyền lại (error checking & retransmission)
  
  - **Sử dụng khi:**
    - Cần đảm bảo dữ liệu đến đích
    - Web browsing (HTTP)
    - Email (SMTP, POP3)
    - File transfer (FTP)
    - Remote login (SSH, Telnet)

- **UDP (User Datagram Protocol):**
  - **Đặc điểm:**
    - Không kết nối (connectionless)
    - Không đáng tin cậy (unreliable)
    - Nhanh hơn TCP
    - Không đảm bảo thứ tự
    - Không có điều khiển luồng
  
  - **Sử dụng khi:**
    - Tốc độ quan trọng hơn độ tin cậy
    - Video streaming
    - Online gaming
    - DNS queries
    - VoIP (Voice over IP)

**So sánh TCP vs UDP:**

| Đặc điểm | TCP | UDP |
|----------|-----|-----|
| Kết nối | Có (3-way handshake) | Không |
| Độ tin cậy | Đảm bảo dữ liệu đến | Không đảm bảo |
| Tốc độ | Chậm hơn | Nhanh hơn |
| Thứ tự | Đảm bảo thứ tự | Không đảm bảo |
| Overhead | Cao (nhiều header) | Thấp (ít header) |
| Sử dụng | Web, Email, FTP | Video, Game, DNS |

#### 3. Internet Layer (Lớp Internet)

Tương đương với lớp Network của OSI.

**Giao thức chính:**

- **IP (Internet Protocol):**
  - **IPv4:**
    - 32 bit địa chỉ
    - Ví dụ: 192.168.1.1
    - Cung cấp khoảng 4.3 tỷ địa chỉ
    - Đang cạn kiệt
  
  - **IPv6:**
    - 128 bit địa chỉ
    - Ví dụ: 2001:0db8:85a3:0000:0000:8a2e:0370:7334
    - Cung cấp số lượng địa chỉ cực lớn
    - Đang được triển khai dần

**Chức năng:**
- Định địa chỉ logic (IP address)
- Định tuyến (routing)
- Chuyển tiếp gói (packet forwarding)

**Các giao thức hỗ trợ:**
- **ICMP (Internet Control Message Protocol):** Thông báo lỗi và điều khiển
- **ARP (Address Resolution Protocol):** Chuyển đổi IP sang MAC (hoạt động ở lớp Data Link nhưng hỗ trợ lớp Network)

#### 4. Network Access Layer (Lớp Truy cập Mạng)

Tương đương với lớp Data Link và Physical của OSI.

**Giao thức phổ biến:**

- **Ethernet:**
  - Giao thức phổ biến nhất cho mạng LAN
  - Sử dụng địa chỉ MAC
  - Tốc độ: 10 Mbps, 100 Mbps, 1 Gbps, 10 Gbps
  - Ví dụ: Mạng LAN trong văn phòng, WiFi

- **Frame Relay:**
  - Giao thức WAN cũ
  - Đã được thay thế phần lớn bởi MPLS và Internet

- **ARP (Address Resolution Protocol):**
  - Chuyển đổi địa chỉ IP thành địa chỉ MAC
  - Hoạt động trong cùng một mạng LAN
  - Ví dụ: Máy tính cần biết địa chỉ MAC của router để gửi gói dữ liệu

**Chức năng:**
- Truyền dữ liệu trong cùng một mạng cục bộ
- Sử dụng địa chỉ MAC
- Truyền tín hiệu vật lý

## Quá trình truyền dữ liệu qua mô hình OSI

Hãy xem một ví dụ cụ thể: **Bạn gửi email**

### Khi gửi email (từ trên xuống):

1. **Application Layer:** Bạn soạn email trong ứng dụng email (Outlook, Gmail)
2. **Presentation Layer:** Email được mã hóa (nếu dùng HTTPS) và nén
3. **Session Layer:** Thiết lập phiên với mail server
4. **Transport Layer:** TCP chia email thành các segment và đánh số
5. **Network Layer:** IP đóng gói segment thành packet và thêm địa chỉ IP đích
6. **Data Link Layer:** Đóng gói packet thành frame và thêm địa chỉ MAC
7. **Physical Layer:** Chuyển đổi frame thành tín hiệu điện và truyền qua cáp

### Khi nhận email (từ dưới lên):

1. **Physical Layer:** Nhận tín hiệu điện từ cáp
2. **Data Link Layer:** Chuyển đổi tín hiệu thành frame, kiểm tra địa chỉ MAC
3. **Network Layer:** Kiểm tra địa chỉ IP, định tuyến packet
4. **Transport Layer:** TCP sắp xếp lại các segment và kiểm tra lỗi
5. **Session Layer:** Duy trì phiên với mail server
6. **Presentation Layer:** Giải mã và giải nén email
7. **Application Layer:** Hiển thị email trong ứng dụng email

## Giao thức mạng phổ biến

### Giao thức ở lớp Application

| Giao thức | Port | Mô tả | Ví dụ sử dụng |
|-----------|------|-------|---------------|
| HTTP | 80 | Giao thức web | Truy cập website |
| HTTPS | 443 | HTTP với mã hóa SSL/TLS | Mua sắm online, ngân hàng |
| FTP | 21 | Truyền file | Upload website |
| SSH | 22 | Kết nối từ xa an toàn | Quản lý server |
| Telnet | 23 | Kết nối từ xa (không an toàn) | Cấu hình thiết bị mạng |
| SMTP | 25, 587 | Gửi email | Gửi email |
| POP3 | 110 | Nhận email | Tải email về máy |
| IMAP | 143 | Nhận email (nâng cao) | Đồng bộ email |
| DNS | 53 | Phân giải tên miền | Chuyển đổi google.com → IP |
| SNMP | 161 | Quản lý mạng | Giám sát thiết bị mạng |

### Giao thức ở lớp Transport

| Giao thức | Đặc điểm | Sử dụng cho |
|-----------|----------|-------------|
| TCP | Đáng tin cậy, có kết nối | Web, Email, FTP |
| UDP | Nhanh, không kết nối | Video, Game, DNS |

### Giao thức ở lớp Network

| Giao thức | Mô tả |
|-----------|-------|
| IP | Định địa chỉ và định tuyến |
| ICMP | Thông báo lỗi và điều khiển (ping sử dụng ICMP) |
| ARP | Chuyển đổi IP sang MAC (hoạt động ở Data Link) |

### Giao thức ở lớp Data Link

| Giao thức | Mô tả |
|-----------|-------|
| Ethernet | Giao thức LAN phổ biến nhất |
| Wi-Fi (802.11) | Mạng không dây |
| Frame Relay | Giao thức WAN cũ |
| PPP | Kết nối điểm-điểm |

## Ứng dụng thực tế

### Troubleshooting mạng

Hiểu mô hình OSI giúp bạn troubleshoot mạng hiệu quả:

- **Lớp 7 (Application):** Website không mở được → Kiểm tra trình duyệt, DNS
- **Lớp 4 (Transport):** Kết nối bị ngắt → Kiểm tra firewall, port
- **Lớp 3 (Network):** Không ping được → Kiểm tra địa chỉ IP, routing
- **Lớp 2 (Data Link):** Không kết nối được trong LAN → Kiểm tra địa chỉ MAC, switch
- **Lớp 1 (Physical):** Không có tín hiệu → Kiểm tra cáp, đầu nối

### Thiết kế mạng

Khi thiết kế mạng, bạn cần hiểu từng lớp:

- **Lớp 1:** Chọn loại cáp (đồng hay quang), tốc độ
- **Lớp 2:** Chọn switch, cấu hình VLAN
- **Lớp 3:** Thiết kế địa chỉ IP, routing
- **Lớp 4:** Chọn TCP hay UDP cho từng ứng dụng
- **Lớp 5-7:** Cấu hình các dịch vụ ứng dụng

## Kết luận

Mô hình OSI 7 lớp là nền tảng quan trọng để hiểu cách mạng máy tính hoạt động. Mặc dù trong thực tế chúng ta sử dụng mô hình TCP/IP (4 lớp), nhưng việc hiểu OSI sẽ giúp bạn:

- **Nắm vững** các khái niệm cơ bản về mạng
- **Troubleshoot** các vấn đề mạng hiệu quả
- **Thiết kế** và triển khai mạng đúng cách
- **Hiểu** cách các giao thức hoạt động ở từng lớp

Hãy nhớ rằng:
- **OSI** là mô hình lý thuyết, giúp hiểu và học tập
- **TCP/IP** là mô hình thực tế, được sử dụng trong Internet
- Mỗi lớp có chức năng riêng và độc lập với các lớp khác
- Dữ liệu đi từ lớp trên xuống lớp dưới khi gửi, và ngược lại khi nhận

Chúc bạn thành công trong việc học và làm việc với mạng máy tính!
