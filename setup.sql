
CREATE TABLE admin (
  id INT IDENTITY(1,1) PRIMARY KEY,
  username NVARCHAR(255) NOT NULL UNIQUE,
  hashed_password NVARCHAR(255) NOT NULL,
  create_at DATE DEFAULT GETDATE(),
  update_at DATE DEFAULT GETDATE(),
  delete_at DATE DEFAULT GETDATE()
);

-- Dumping data for table admin
INSERT INTO admin (username, hashed_password, create_at, update_at, delete_at) VALUES
  ('admin', 'admin', '2023-11-18', '2023-11-18', '2023-11-18');


-- Dumping structure for table thegioiamthuc.category
CREATE TABLE category (
  id INT IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(255) NOT NULL,
  create_at DATE DEFAULT GETDATE(),
  update_at DATE DEFAULT GETDATE(),
  delete_at DATE DEFAULT GETDATE()
);

-- Insert data into category table
INSERT INTO category (name, create_at, update_at, delete_at) VALUES
  (N'Đồ ăn', '2023-11-23', '2023-11-23', '2023-11-23'),
  (N'Nước uống', '2023-11-23', '2023-11-23', '2023-11-23'),
  (N'Thức ăn nhẹ', '2023-11-23', '2023-11-23', '2023-11-23'),
  (N'Gà rán', '2023-11-23', '2023-11-23', '2023-11-23'),
  (N'Burger', '2023-11-24', '2023-11-24', '2023-11-24'),
  (N'Combo', '2023-11-24', '2023-11-24', '2023-11-24'),
  (N'Món tráng miệng', '2023-11-24', '2023-11-24', '2023-11-24');


CREATE TABLE fooditem (
  id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
  name nvarchar(255) NOT NULL,
  category_id int NOT NULL,
  price bigint NOT NULL,
  image text DEFAULT NULL,
  create_at date DEFAULT GETDATE(),
  update_at date DEFAULT GETDATE(),
  delete_at date DEFAULT GETDATE(),
  CONSTRAINT FK1_Category FOREIGN KEY (category_id) REFERENCES category (id)
);

-- Create index for category_id
CREATE INDEX IDX_Category_id ON fooditem (category_id);


INSERT INTO fooditem (name, category_id, price, image, create_at, update_at, delete_at) VALUES
	(N'Cơm Gà Teriyaki', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/Rice-Teriyaki.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(N'Cơm Gà Tenderods', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/Rice-TENDERODS.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(N'Mì Ý Sốt Cà Xúc Xích Gà Viên', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/MY-Y-POP.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(N'5 Cánh Gà Rán', 4, 83000, 'https://static.kfcvietnam.com.vn/images/items/lg/5-HW.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(N'3 Cánh Gà Rán', 4, 54000, 'https://static.kfcvietnam.com.vn/images/items/lg/3-HW.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(N'Mì Ý Sốt Cà Xúc Xích Gà Zinger', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/MY-Y-ZINGER.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(N'1 Miếng Gà Rán', 4, 35000, 'https://static.kfcvietnam.com.vn/images/items/lg/1-Fried-Chicken.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(N'6 Miếng Gà Rán', 4, 188000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/e/e/ee8e7512368728-6mingggin_1.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(N'2 Miếng Gà Rán', 4, 70000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/d/1/d1834d87116836-2mingggin_1.png', '2023-11-23', '2023-11-23', '2023-11-23'),
	(N'Burger Tôm', 5, 44000, 'https://static.kfcvietnam.com.vn/images/items/lg/Burger-Shrimp.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
	(N'4 Miếng Gà Rán', 4, 126000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/4/2/427e7a3136f84a-4mingggin_1.png', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'Khoai tây chiên', 3, 20000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/5/5/5532107fb902fd-1860001_khoaivua21.png', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'PEPSI', 2, 12000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/2/2/22a5960148a32e-2mienggaran14.png', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'COCA', 2, 12000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1dcozcIPfW_ULbp5UoAnlNcDoRQS7BcIUew&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'Cacao Sữa Đá', 2, 20000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/c/5/c5ded2aa5f7b3c-2mienggaran19.png', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'Trà Đào', 2, 20000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/0/f/0f550a170bb756-tradao.png', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'7 UP', 2, 12000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh0xd5IPh3gOdvsD0cBGYjIvKadMnHA9_Y0g&usqp=CAU', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'Nước Ép Xoài Đào', 2, 20000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/x/o/xoai_dao_menu.png', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'Burger Gà Quay Flava', 5, 54000, 'https://static.kfcvietnam.com.vn/images/items/lg/Burger-Flava.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'Burger Zinger', 5, 54000, 'https://static.kfcvietnam.com.vn/images/items/lg/Burger-Zinger.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'Pepsi Không Calo', 2, 15000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/l/y/lypepsi-03.png', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'Mì Ý Sốt Bò Bằm', 1, 45000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/m/_/m__2.png', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'Phô Mai Viên', 3, 44000, 'https://static.kfcvietnam.com.vn/images/items/lg/6-Chewy-Cheese.jpg?v=46obkg', '2023-11-23', '2023-11-23', '2023-11-23'),
    (N'Bánh Xoài Đào', 7, 10000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/p/m/pmp-plated.png', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Tropical Sundae', 7, 20000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/k/e/kemsundae-06.png', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Kem Ốc Quế Sữa Tươi', 7, 5000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/b/a/ba9d396f70568c-kemvani201.png', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Kem Ốc Quế Socola', 7, 7000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/c/4/c400652c2a03e0-chocolateicecream01.png', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Kem SUNDAES Dâu', 7, 15000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/d/0/d01402ed11976b-kemsundeadau.png', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Kem SUNDAES Socola', 7, 15000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/1/9/192dcb48e7393a-kemsocola16.png', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Salad Hạt', 3, 35000, 'https://static.kfcvietnam.com.vn/images/items/lg/SALAD-HAT.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Salad Pop', 3, 35000, 'https://static.kfcvietnam.com.vn/images/items/lg/SALAD-HAT-GA-VIEN.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Súp Rong Biển', 3, 17000, 'https://static.kfcvietnam.com.vn/images/items/lg/Soup-Rong-Bien.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Pizza Bò Phô Mai', 1, 170000, 'https://img.dominos.vn/Menu+BG+1.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Pizza Rau Củ Thập Cẩm', 1, 90000, 'https://img.dominos.vn/Veggie-mania-Pizza-Rau-Cu-Thap-Cam.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Pizza Phô Mai Truyền Thống', 1, 90000, 'https://img.dominos.vn/Pizza-Pho-Mai-Hao-Hang-Cheese-Mania.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Pizza Xúc Xích Ý Truyền Thống', 1, 115000, 'https://img.dominos.vn/Pepperoni-feast-Pizza-Xuc-Xich-Y.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Combo Nhóm 1', 6, 172000, 'https://static.kfcvietnam.com.vn/images/items/lg/D6.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Combo Nhóm 2', 6, 190000, 'https://static.kfcvietnam.com.vn/images/items/lg/D7-new.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Combo Nhóm 3', 6, 230000, 'https://static.kfcvietnam.com.vn/images/items/lg/D8-new.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
    (N'Combo Gà Rán', 6, 87000, 'https://static.kfcvietnam.com.vn/images/items/lg/D1-new.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Combo Mì Ý', 6, 87000, 'https://static.kfcvietnam.com.vn/images/items/lg/D3-new.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Combo Salad Hạt', 6, 80000, 'https://static.kfcvietnam.com.vn/images/items/lg/D4-new.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Pasion Panna Cotta', 7, 35000, 'https://phuclong.com.vn/uploads/dish/a9686c8f36a908-passionpannacotta.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Tiramisu Mini', 7, 35000, 'https://phuclong.com.vn/uploads/dish/dd626a9639b006-tiramisumini.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Bánh Phô Mai Cà Phê', 7, 30000, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/thumbs/270_crop_PHOMAICAPHE.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Bánh Phô Mai Chanh Dây', 7, 30000, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/thumbs/270_crop_PHOMAICHANHDAY.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Bánh Phô Mai Trà Xanh', 7, 30000, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/thumbs/270_crop_PHOMAITRAXANH.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Bánh Chuối', 7, 25000, 'https://www.highlandscoffee.com.vn/vnt_upload/product/03_2018/thumbs/270_crop_BANHCHUOI.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Combo Gà Que Kem Xốt Cajun A', 6, 90000, 'https://static.kfcvietnam.com.vn/images/items/lg/A-Cajun.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Combo Gà Que Kem Xốt Cajuun B', 6, 90000, 'https://static.kfcvietnam.com.vn/images/items/lg/B-Cajun.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'1 Gà Que Kem Xốt Cajun', 3, 40000, 'https://static.kfcvietnam.com.vn/images/items/lg/1-Cajun.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'2 Gà Que Kem Xốt Cajun', 3, 80000, 'https://static.kfcvietnam.com.vn/images/items/lg/2-Cajun.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Combo Gà Địa Trung Hải A', 6, 93000, 'https://static.kfcvietnam.com.vn/images/items/lg/combo-ga-cuon-dia-trung-hai-a.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Combo Gà Địa Trung Hải B', 6, 199000, 'https://static.kfcvietnam.com.vn/images/items/lg/combo-ga-cuon-dia-trung-hai-c.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'3 Gà Miếng Nuggets', 4, 27000, 'https://static.kfcvietnam.com.vn/images/items/lg/3_Nuggests.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'5 Gà Miếng Nuggets', 4, 40000, 'https://static.kfcvietnam.com.vn/images/items/lg/5_Nuggests.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'10 Gà Miếng Nuggets', 4, 75000, 'https://static.kfcvietnam.com.vn/images/items/lg/10_Nuggests.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Xiên Que', 3, 20000, 'https://static.kfcvietnam.com.vn/images/items/lg/2-Skewers.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Xiên Tenderods', 3, 20000, 'https://static.kfcvietnam.com.vn/images/items/lg/2-Tenderods.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Cơm trộn Hàn Quốc', 1, 45000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5XLpeaxpGfCPsjbTlnSnzLxLwn1s0RTzD-g&usqp=CAU', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Tokbokki', 1, 45000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRchqFsGMs-qu_31gPGOtIeYhIj41OyxLUatg&usqp=CAU', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Tokbokki Phô Mai', 1, 60000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXa6lEr94nhSlIe-PVjAGDOANYhhej1ln-kA&usqp=CAU', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Trà Chanh Lipton', 2, 15000, 'https://static.kfcvietnam.com.vn/images/items/lg/Lipton.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Cơm Trắng', 1, 10000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/b/3/b3ad51b912e4e5-2mienggaran24.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Súp Bí Đỏ', 3, 15000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/s/_/s_p_b_.png', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Burger Gà Giòn', 5, 35000, 'https://jollibee.com.vn/media/catalog/product/cache/9011257231b13517d19d9bae81fd87cc/9/2/92d27d47dadbfc-hambugerlon.jpg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Cơm Gà Bít Tết', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/Rice-Steak.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Cơm Gà Rán', 1, 45000, 'https://static.kfcvietnam.com.vn/images/items/lg/Rice-F.Chicken.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'AQUAFINA', 2, 15000, 'https://static.kfcvietnam.com.vn/images/items/lg/Aquafina-500ml.jpg?v=46obkg', '2023-11-24', '2023-11-24', '2023-11-24'),
	(N'Lẩu gà lá é', 1, 80000, 'https://i-giadinh.vnecdn.net/2022/12/08/Buoc-7-Thanh-pham-7-3595-1670471747.jpg', '2023-11-27', '2023-11-27', '2023-11-27'),
	(N'Piza thập cẩm', 1, 100000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVIG2vrhFm2_8bI4TCqi1_lygdssC3rabscbjzwaq4g0H3xYtGyGMuyKfo8Zh6o72WgRM&usqp=CAU', '2023-11-29', '2023-11-29', '2023-11-29');

-- Dumping structure for table thegioiamthuc.order
CREATE TABLE [order] (
  id INT PRIMARY KEY IDENTITY(1,1),
  user_id INT NOT NULL,
  total_price BIGINT DEFAULT NULL,
  payment NVARCHAR(255) DEFAULT NULL,
  status NVARCHAR(255) DEFAULT NULL,
  create_at DATE DEFAULT GETDATE(),
  update_at DATE DEFAULT GETDATE(),
  delete_at DATE DEFAULT GETDATE(),
  CONSTRAINT FK1_User FOREIGN KEY (user_id) REFERENCES [user] (id)
);
SET IDENTITY_INSERT [order] ON;

-- Dumping data for table thegioiamthuc.order: ~45 rows (approximately)
INSERT INTO [order] (id, user_id, total_price, payment, status, create_at, update_at, delete_at) VALUES
	(176, 1, 2980000, N'Tiền mặt', N'Đã hủy', '2023-12-07', '2023-12-07', '2023-12-07'),
	(177, 2, 100000, N'Tiền mặt', N'Đã hủy', '2023-12-07', '2023-12-07', '2023-12-07'),
	(178, 3, 279000, N'Vnpay', N'Đã hủy', '2023-12-07', '2023-12-07', '2023-12-07'),
	(179, 4, 80000, N'Tiền mặt', N'Đã hủy', '2023-12-07', '2023-12-07', '2023-12-07'),
	(180, 5, 45000, N'Vnpay', N'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(181, 1, 45000, N'Tiền mặt', N'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(182, 2, 45000, N'Vnpay', N'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(183, 3, 54000, N'Tiền mặt', N'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(184, 4, 135000, N'Tiền mặt', N'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(185, 3, 100000, N'Vnpay', N'Đã thanh toán', '2023-12-07', '2023-12-07', '2023-12-07'),
	(186, 3, 100000, N'Tiền mặt', N'Đã hủy', '2023-12-08', '2023-12-08', '2023-12-08'),
	(187, 3, 80000, N'Tiền mặt', N'Đã hủy', '2023-12-08', '2023-12-08', '2023-12-08'),
	(188, 3, 45000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(189, 3, 45000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(190, 3, 45000, N'Vnpay', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(191, 4, 80000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(192, 2, 9648000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(193, 5, 54000, N'Vnpay', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(194, 5, 450000, N'Tiền mặt', N'Đã hủy', '2023-12-08', '2023-12-08', '2023-12-08'),
	(195, 5, 1511028360, 'Vnpay', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(196, 5, 1040000, 'Vnpay', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(197, 5, 45000000, 'Vnpay', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(198, 5, 10000000, 'Vnpay', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(199, 5, 80000000, 'Vnpay', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(200, 5, 800000000, 'Vnpay', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(201, 5, 10000000, N'Tiền mặt', N'Đã hủy', '2023-12-08', '2023-12-08', '2023-12-08'),
	(202, 5, 45000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(203, 5, 15000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(204, 2, 45000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(205, 2, 15000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(206, 1, 4500000, N'Tiền mặt', N'Đã hủy', '2023-12-08', '2023-12-08', '2023-12-08'),
	(207, 1, 45000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(208, 1, 80000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(209, 1, 4500000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(210, 1, 1000000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(211, 2, 4500000, N'Tiền mặt', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(212, 2, 28045000, 'Vnpay', N'Đã thanh toán', '2023-12-08', '2023-12-08', '2023-12-08'),
	(213, 2, 100000, N'Tiền mặt', N'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(214, 2, 45000, N'Tiền mặt', N'Đã hủy', '2023-12-09', '2023-12-09', '2023-12-09'),
	(215, 3, 45000, N'Tiền mặt', N'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(216, 3, 45000, 'Vnpay', N'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(217, 4, 100000, 'Vnpay', N'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(218, 4, 45000, 'Vnpay', N'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(219, 3, 100000, N'Tiền mặt', N'Đang xử lý', '2023-12-09', '2023-12-09', '2023-12-09'),
	(220, 3, 100000, N'Tiền mặt', N'Đang xử lý', '2023-12-09', '2023-12-09', '2023-12-09'),
	(221, 3, 100000, N'Tiền mặt', N'Đang xử lý', '2023-12-09', '2023-12-09', '2023-12-09'),
	(222, 4, 15000, 'Vnpay', N'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(223, 3, 12000, N'Tiền mặt', N'Đang xử lý', '2023-12-09', '2023-12-09', '2023-12-09'),
	(224, 4, 100000, 'Vnpay', N'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(225, 4, 100000, 'Vnpay', N'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09'),
	(226, 5, 8000000, N'Tiền mặt', N'Đã thanh toán', '2023-12-09', '2023-12-09', '2023-12-09');

	SET IDENTITY_INSERT [order] OFF;


-- Dumping structure for table thegioiamthuc.order_data
CREATE TABLE order_data (
  order_id INT NOT NULL,
  footitem_id INT NOT NULL,
  amout INT NOT NULL DEFAULT 1,
  PRIMARY KEY (order_id, footitem_id),
  CONSTRAINT FK1_Order FOREIGN KEY (order_id) REFERENCES [order] (id),
  CONSTRAINT FK2_Fooditem FOREIGN KEY (footitem_id) REFERENCES fooditem (id)
);

-- Dumping data for table thegioiamthuc.order_data: ~54 rows (approximately)

INSERT INTO order_data (order_id, footitem_id, amout) VALUES
	(176, 2, 64),
	(176, 71, 1),
	(177, 71, 1),
	(178, 1, 1),
	(178, 19, 1),
	(178, 70, 1),
	(178, 71, 1),
	(179, 71, 1),
	(180, 2, 1),
	(181, 3, 1),
	(182, 2, 1),
	(183, 19, 1),
	(184, 2, 3),
	(185, 71, 1),
	(186, 71, 1),
	(187, 71, 1),
	(188, 2, 1),
	(189, 2, 1),
	(190, 2, 1),
	(191, 71, 1),
	(192, 1, 200),
	(192, 19, 12),
	(193, 5, 1),
	(194, 2, 10),
	(195, 2, 8623513),
	(196, 71, 13),
	(197, 68, 1000),
	(198, 70, 100),
	(199, 71, 1000),
	(200, 71, 10000),
	(201, 71, 100),
	(202, 1, 1),
	(203, 69, 1),
	(204, 3, 1),
	(205, 69, 1),
	(206, 2, 100),
	(207, 1, 1),
	(208, 71, 1),
	(209, 68, 100),
	(210, 70, 10),
	(211, 68, 100),
	(212, 1, 400),
	(212, 2, 1),
	(212, 70, 100),
	(213, 70, 1),
	(214, 3, 1),
	(215, 2, 1),
	(216, 2, 1),
	(217, 70, 1),
	(218, 68, 1),
	(219, 70, 1),
	(220, 70, 1),
	(221, 70, 1),
	(222, 69, 1),
	(223, 14, 1),
	(224, 70, 1),
	(225, 70, 1),
	(226, 70, 100);


-- Dumping structure for table thegioiamthuc.user
CREATE TABLE [user] (
  id INT PRIMARY KEY IDENTITY(1,1),
  username NVARCHAR(255) DEFAULT NULL,
  birth_year INT DEFAULT NULL,
  gender NVARCHAR(55) DEFAULT '',
  email NVARCHAR(255) NOT NULL,
  hashed_password NVARCHAR(64) NOT NULL,
  avatar_path NVARCHAR(255) DEFAULT NULL,
  adress NVARCHAR(MAX) DEFAULT NULL,
  status NVARCHAR(20) DEFAULT 'activate', -- Đảm bảo enum với một giá trị chuỗi
  create_at DATE DEFAULT GETDATE(),
  update_at DATE DEFAULT GETDATE(),
  [delete-at] DATE DEFAULT GETDATE(), -- Sửa delete-at thành [delete-at]
  CONSTRAINT UK_email UNIQUE (email)
);

-- Dumping data for table thegioiamthuc.user: ~27 rows (approximately)
INSERT INTO [user] ([username], [birth_year], [gender], [email], [hashed_password], [avatar_path], [adress], [status], [create_at], [update_at], [delete-at])
VALUES
	('user1', 2004, 'Nam', 'user1@gmail.com', 'user1', 'https://api.duniagames.co.id/api/content/upload/file/8143860661599124172.jpg', N'["Nhà ở Hoà Hải,Ngũ Hành Sơn, Thành phố Đà Nẵng","Nhà ở Hoà Hải,Ngũ Hành Sơn, Thành phố Đà Nẵng","Nhà ở Hoà Hải,Ngũ Hành Sơn, Thành phố Đà Nẵng"]', 'deactivate', '2023-11-26', '2023-11-26', '2023-11-26'),
	('user2', 2004, 'Nam', 'user2@gmail.com', 'user2', 'https://static.toiimg.com/thumb/resizemode-4,msid-76729536,imgsize-249247,width-800/76729536.jpg', N'["Nhà ở Trung Trạch, Tỉnh Bố Trạch, Quảng Bình","Nhà ở Trung Trạch, Tỉnh Bố Trạch, Quảng Bình","Nhà ở Trung Trạch, Tỉnh Bố Trạch, Quảng Bình"]', 'deactivate', '2023-11-27', '2023-11-27', '2023-11-27'),
	('user3', 2004, 'Nam', 'user3@gmail.com', 'user3', 'https://myitside.com/wp-content/uploads/2021/03/facebook-avatar-main_425_735.jpg', N'["Nhà ở Trung Trạch, Tỉnh Bố Trạch, Quảng Bình","Nhà ở Trung Trạch, Tỉnh Bố Trạch, Quảng Bình","Nhà ở Trung Trạch, Tỉnh Bố Trạch, Quảng Bình"]', 'deactivate', '2023-11-27', '2023-11-27', '2023-11-27'),
	('user4', 2004, 'Nam', 'user4@gmail.com', 'user4', 'https://tse2.mm.bing.net/th?id=OIP.8691fMvDgQW2K_MYDEHgSQHaIS&pid=Api&P=0&h=180', N'["Nhà ở Trung Trạch, Tỉnh Bố Trạch, Quảng Bình","Nhà ở Trung Trạch, Tỉnh Bố Trạch, Quảng Bình","Nhà ở Trung Trạch, Tỉnh Bố Trạch, Quảng Bình"]', 'deactivate', '2023-11-28', '2023-11-28', '2023-11-28'),
	('user5', 2004, 'Nam', 'user5@gmail.com', 'user5', 'https://www.infopena.com/wp-content/uploads/2020/09/Eg1rQC-WsAIGEr8.jpg', N'["Nhà ở Hoà Hải,Ngũ Hành Sơn, Thành phố Đà Nẵng","Nhà ở Hoà Hải,Ngũ Hành Sơn, Thành phố Đà Nẵng","Nhà ở Hoà Hải,Ngũ Hành Sơn, Thành phố Đà Nẵng"]', 'deactivate', '2023-11-28', '2023-11-28', '2023-11-28')


SELECT * FROM  (SELECT *, ROW_NUMBER() OVER (ORDER BY id) AS row_num FROM fooditem) AS sub WHERE row_num > 0 AND row_num <=  7