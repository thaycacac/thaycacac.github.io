---
layout: post
title: Theory for PRJ321
subtitle: Theory of course Web-Based Java Applications
gh-repo: thaycacac/thaycacac.github.io
gh-badge: [star, follow]
tags: [share]
---
Tổng hợp lý thuyết môn Java Web...

### Session1: Servlet

- **Servlet:**
    - `Servlet `là một công nghệ được sử dụng để tạo ra ứng dụng web.
    - `Servlet` là một API cung cấp các interface và lớp bao gồm các tài liệu.
    - `Servlet` là một thành phần web được triển khai trên máy chủ để tạo ra trang web động.
- **Gói servlet:** javax.servlet và javax.servlet.http
- **Vòng đời**
    - `Servlet` được khởi tạo bằng cách gọi phương thức `init ()`.
    - Phương thức servlet `service()` được gọi để xử lý yêu cầu của khách hàng.
    - Servlet được hủy bằng cách gọi phương thức `destroy()`.
    - Cuối cùng, servlet được thu thập bởi bộ sưu tập rác của JVM.
- **Đọc dữ liệu từ Form trong servlet**
    - `getParameter()` – Gọi phương thức request.getParameter() để lấy giá trị của một tham số của form.
    - `getParameterValues​()` – Gọi phương thức này nếu tham số xuất hiện nhiều lần và trả về nhiều giá trị, ví dụ checkbox.
    - `getParameterNames()` – Gọi phương thức này nếu bạn muốn có một danh sách đầy đủ của tất cả các tham số trong yêu cầu hiện tại.

- **Cookie:** là các tập tin văn bản được lưu trữ trên client. Mục đích của cookie là để theo dõi các thông tin khác nhau. Ví dụ trường hợp remember login.
- **Xóa Session**
    - Xoá một thuộc tính cụ thể: bạn có thể gọi phương thức public void removeAttribute(String name) để xóa giá trị kết hợp với một khoá cụ thể.
    - Xóa toàn bộ sesssion: bạn có thể gọi phương thức public void invalidate() để xóa toàn bộ sesssion.
    - Cài đặt thời gian chờ cho session: bạn có thể gọi phương thức public void setMaxInactiveInterval(int interval) để đặt thời gian chờ cho một session riêng.
    - Đăng xuất user: các máy chủ hỗ trợ servlet 2.4, bạn đăng xuất khách hàng ra khỏi Web server và làm mất hiệu lực tất cả session của tất cả người dùng
    - Cấu hình web.xml: nếu bạn đang sử dụng Tomcat, ngoài các phương pháp đã đề cập ở trên, bạn có thể thiết định thời gian session trong tệp web.xml

### Session2: JSP
- `JSP` là viết tắt của JavaServer Pages là một công nghệ để phát triển các trang web động. JSP giúp các nhà phát triển chèn java code vào các trang HTML bằng cách sử dụng các thẻ JSP đặc biệt.
- **Vòng đời của JSP bao gồm 4 pha sau:**
    - Biên dịch (`Compilation`).
    - Khởi tạo (`Initialization`).
    - Thực thi (`Execution`).
    - Hủy (`Cleanup`).

- **JSP Scriptlet:** `<% java code %>`
- **JSP Declaration:** `<%! declaration; [ declaration; ]+ ... %>`
- **JSP Expression:** `<%= expression %>`
- **JSP Directives:** `<%@ directive attribute="value" %>`
- **JSP Action:** `<jsp:action_name attribute="value" />`
- **Các đối tượng ẩn trong JSP**
    - HttpServletRequest
    - HttpServletResponse
    - PrintWriter
    - HttpSession
    - ServletContext
    - ServletConfig
    - this
    - Exception

- **JSP Page**
1. **Một trang JSP có thể bao gồm những công nghệ:** specific tags, declarations, and possibly scriptlets, in combination with other static HTML or XML tags.
2. **Đuôi mở rộng:** `extension .jsp`
3. **Được dịch khi lần đầu tiền gọi:** các lần sau nó sẽ lưu trong bộ nhớ server, các lần sau được phản hồi rất nhanh

- **Comment**

```html
<!--  comment [ <%= expression %> ] -->
```

- **JSP Directives**

1. Page

- JSP Container sẽ import 4 packages tại thời điểm translation:
  - javax.servlet
  - javax.servlet.http
  - javax.servlet.jsp
  - java.lang

```html
<%@ page attributeName="value" %>
//example
<%@ page import="java.util.StringTokenizer" %>
```

1. Include

```html
<%@ include file=“relativeURL " %>
//example
<body>
	<%@ include file="header.jsp" %>
	<h1>Including Page</h1>
	<%@ include file="footer.html" %>
</body>
```

1. Taglib

```html
<prefix:tagname firstAttribute="value" secondAttribute="value">
	...
</prefix:tagname>

<jsp:forward page=“destinationPage">
	<jsp:param name=“.." value=“.." />
	…
</jsp:forward>

<jsp:include page="pageToInclude.jsp" />
```

### Session 3: Tổng Quan
- **Cấu trúc file và thư mục có thể có là**
    - static content
    - JSP pages
    - servlet pages
    - the deployment descriptor
    - tag libraries
    - JAR files and Java class files
    - and describe how to protect resource files from 
    - HTTP access

- **Thư mục đặc biệt bên dưới context root**
    - `/WEB-INF/classes`— cho những lớp tồn tại như separate Java classes(không có file JAR). Có thể là servlet hoặc other support classes
    - `/WEB-INF/ lib`—dành cho những file JAR. Bên trong có thể bao gồm nhiều thứ: the main servlets for your application, supporting classes that connect to databases—whatever
    - `/WEB-INF` —chính nó là một tệp tin chính cực kỳ quan trọng `web.xml`, tệp mô tả triển khai

- **Cấu trúc deploy ment descriptor**

```html
<web-app>
    <description>
    <display-name>
    <icon>
    <distributable>
    <context-param>
    <filter>
    <filter-mapping>
    <listener>
    <servlet>
    <servlet-mapping>
    <session-config>
    <mime-mapping>
    <welcom-file-list>
    <error-page>
    <jsp-config>
    <security-constraint>
    <login-config>
    <security-roly>
</web-app>
```

- Servlet and những thẻ con quan trọng

```html
<servlet>
    <description>
    <display-name>
    <icon>
        <small-icon>
        <large-icon>
    <servlet-name>
    <servlet-class> or <jsp-file>
    <init-param>
        <description>
        <param-name>
        <param-value>
    <load-on-startup>
    <run-as>
        <description>
        <role-name>
    <security-roly-ref>
        <description>
        <role-name>
        <role-link>
    </security-roly-ref>
</servlet>
```

### JDBC
- **JDBC API**

1. `Connection:` For creating a connection to a DBMS
2. `Statement:` For executing SQL statements
3. `ResultSet:` For storing result data set and achieving columns
4. `DatabaseMetadata:` For getting database metadata
5. `ResultSetMetadata:` For getting resultset metadata

- **Có 4 loại JDBC Drivers**
    - JDBC ODBC (populated)
    - Native API
    - Network Protocol
    - Native Protocol(populated)

- **Initialization Parameters**

```html
<web-app>
    <context-param>
        <param-name>machineName</param-name>
        <param-value>GERALDINE</param-value>
    </context-param>
    <context-param>
        <param-name>secretParameterFile</param-name>
        <param-value>/WEB-INF/xml/secretParms.xml</param-value>
    </context-param>
</web-app>
```

```html
ServletContext sc = getServletContext();
String database = sc.getInitParameter("machineName");
String secret = sc.getInitParameter("secretParameterFile");
```

- **ServletConfig Initialization**

```html
<servlet>
    <servlet-name>InitParamaters</servlet-name>
    <servlet-class>InitParamaters</servlet-class>
        <init-param>
        <param-name>name</param-name>
        <param-value>FPT University</param-value>
        </init-param>
</servlet>
```

```java
ServletConfig sc = getServletConfig();
String name = sc.getInitParameter(“name");
```

**Expression Language**

- **Scoped variables in EL expressions**
    - pageContext
    - requestScope
    - sessionScope
    - applicationScope

- `<jsp:useBean>` lets you load in a JavaBean to be used in the JSP

```java
<jsp:useBean> lets you load in a JavaBean to be used in the JSP
```
