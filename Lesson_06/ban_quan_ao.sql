-- Tạo database quan lý của quần áo 
-- Sản phẩm (bảng sản phẩm, Loại sản phẩm,...)
-- Khách hàng
-- user (role: 1 - admin, 2 - quản lý sản phẩm, 3 - Quản lý đơn hàng)
-- Đơn hàng


-- product: id, name, desc, status (còn hàng, hết hàng), 
-- gender (male, female, unisex), thumbnail

-- size: id, tên
-- product_color: id, id_pr, color, ảnh

-- price: id, id_product, price, start_date, end_date

-- brand: id, name, logo, desc

-- Category: (Nam, Nữ, Trẻ em) id, name

-- sub_category: id, id_category, name

-- customer: id, full_name, address, mobile, email, password, dob, avatar

-- user: id, full_name, address, mobile, email, password, dob, avatar, role

-- order: id, id_customer, address, id_employee, create_at, phương thức giao hàng
-- phương thức thanh toán, status

-- order_item: id, id_order, id_product, amount

-- review: id_customer, id_product, point, content

-- lịch sử mua hàng
