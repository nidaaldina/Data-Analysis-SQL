-- Menampilkan semua tabel
SELECT * 
FROM OnlineSales;

-- Membuat kolom baru MonthNumber
ALTER TABLE OnlineSales ADD MonthNumber INT;

-- Update nilai MonthNumber berdasarkan nilai Month
UPDATE OnlineSales 
SET MonthNumber = CASE Month
    WHEN 'Jan' THEN 1
    WHEN 'Feb' THEN 2
	WHEN 'Mar' THEN 3
	WHEN 'Apr' THEN 4
	WHEN 'May' THEN 5
	WHEN 'Jun' THEN 6
	WHEN 'Jul' THEN 7
	WHEN 'Aug' THEN 8
    
    END;

-- Menampilkan total revenue setiap bulan
-- berdasarkan urutan bulan
SELECT
    Month,
    SUM(Total_Revenue) AS Total_Revenue
FROM
    OnlineSales
WHERE
    Year = 2024
GROUP BY
    Month, MonthNumber
ORDER BY
    MonthNumber;

-- Menampilkan total revenue per bulan
-- berdasarkan dari yang terbesar
SELECT
    Month,
    SUM(Total_Revenue) AS Total_Revenue
FROM
    OnlineSales
WHERE
    Year = 2024
GROUP BY
    Month, MonthNumber
ORDER BY
    Total_Revenue DESC;

-- Mengubah nilai kolom units sold mengjadi int
ALTER TABLE OnlineSales
ALTER COLUMN Units_Sold int;

-- Menampilkan units sold setiap bulan
-- berdasarkan urutan bulan
SELECT
	Month,
	SUM(Units_Sold) AS Sales_by_Month
FROM
	OnlineSales
GROUP BY
	Month, MonthNumber
ORDER BY
	MonthNumber;

-- Menampilkan units sold setiap bulan
-- berdasarkan dari penjualan terbanyak
SELECT
	Month,
	SUM(Units_Sold) AS Sales_by_Month
FROM
	OnlineSales
GROUP BY
	Month, MonthNumber
ORDER BY
	Sales_by_Month DESC;

-- Menampilkan total revenue dari yang terbesar
-- berdasarkan product category
SELECT
	Product_Category,
	SUM(Total_Revenue) AS Revenue_by_ProductCategory
FROM 
	OnlineSales
GROUP BY
	Product_Category
ORDER BY
	Revenue_by_ProductCategory DESC;

-- Menampilkan units sold dari yang terbesar
-- berdasarkan product category
SELECT
	Product_Category,
	SUM(Units_Sold) AS Sales_by_ProductCategory
FROM 
	OnlineSales
GROUP BY
	Product_Category
ORDER BY
	Sales_by_ProductCategory DESC;

-- Menampilkan total revenue dari setiap region
SELECT
	Region,
	SUM(Total_Revenue) AS Revenue_by_Region
FROM
	OnlineSales
GROUP BY
	Region
ORDER BY
	Revenue_by_Region DESC;

-- Menampilkan units sold per product
-- berdasarkan region
SELECT
	Region,
	Product_Category,
	SUM(Units_Sold) AS Units_Sold
FROM
	OnlineSales
GROUP BY
	Product_Category, Region;

-- Menampilkan penggunaan payment method
-- dari setiap region
SELECT
    Region,
    Payment_Method,
    COUNT(*) AS total_transactions
FROM
    OnlineSales  
GROUP BY
    Region, Payment_Method
ORDER BY
    Region, Payment_Method;

-- Menampilkan jumlah transaksi
SELECT
	COUNT(Transaction_ID) AS Total_Transaksi
FROM
	OnlineSales;

-- Menampilkan total transaksi, jumlah unit yang terjual,
-- dan total revenue
SELECT
	COUNT(Transaction_ID) AS Total_Transaksi,
	SUM(Units_Sold) AS Units_Sold,
	SUM(Total_Revenue) AS Total_Revenue
FROM
	OnlineSales;

-- Menampilkan jumlah unit terjual berdasarkan nama produk
-- dari yang terbanyak
SELECT
	Product_Name,
	SUM(Units_Sold) AS Units_Sold
FROM
	OnlineSales
GROUP BY
	Product_Name
ORDER BY
	Units_Sold DESC;

-- Menampilkan nama produk, jumlah produk terjual
-- dan mengurutkan dari total revenue yang terbesar
SELECT
	Product_Name,
	SUM(Units_Sold) AS Units_Sold,
	SUM(Total_Revenue) AS Total_Revenue
FROM
	OnlineSales
GROUP BY
	Product_Name
ORDER BY
	Total_Revenue DESC;