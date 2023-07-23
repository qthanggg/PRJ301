create table [dbo].[product] (
	product_id		nvarchar(50)	NOT NULL		PRIMARY KEY,
	name			nvarchar(50)	,
	price			decimal			,
	quantity		int
)

INSERT [dbo].[product](product_id, name, price, quantity) VALUES ('DELL001','Laptop Dell XPS 17 9700 XPS7I7001W1 Silver',2099,100)
INSERT [dbo].[product](product_id, name, price, quantity) VALUES ('DELL002','Laptop Dell XPS 13 Plus 9320 5CG56',2599,150)
INSERT [dbo].[product](product_id, name, price, quantity) VALUES ('DELL003','Laptop Dell Inspiron 14 7420 1YT85',1249,120)
INSERT [dbo].[product](product_id, name, price, quantity) VALUES ('HP001','Laptop HP Spectre x360 14 ef0030TU 6K773PA',2249,110)
INSERT [dbo].[product](product_id, name, price, quantity) VALUES ('HP002',' Laptop HP Envy 13 BA1536TU 4U6M5PA',899,170)
INSERT [dbo].[product](product_id, name, price, quantity) VALUES ('HP003','Laptop HP Pavilion 14 dv2032TU 6K768PA',899,200)
INSERT [dbo].[product](product_id, name, price, quantity) VALUES ('ASUS001','Laptop ASUS Zenbook 17 Fold OLED UX9702AA MD014W',3699,10)
INSERT [dbo].[product](product_id, name, price, quantity) VALUES ('ASUS002','Laptop Asus Zenbook Pro 14 Duo OLED UX8402VU',2949,50)
INSERT [dbo].[product](product_id, name, price, quantity) VALUES ('ASUS003','Laptop ASUS VivoBook Pro 16X OLED N7601ZM MX196W',1999,60)
INSERT [dbo].[product](product_id, name, price, quantity) VALUES ('LG001','Laptop LG Gram 2023 16Z90R EAH75A5',2049,30)
