-- ============================================================
-- DECATHLON SALES ANALYSIS
-- DATABASE SCHEMA & SAMPLE DATA
-- ============================================================

-- ============================================================
-- PRODUCTS TABLE
-- ============================================================

DROP TABLE IF EXISTS products_clean;

CREATE TABLE products_clean (
    product_id   VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    category     VARCHAR(50),
    subcategory  VARCHAR(50),
    unit_cost    DECIMAL(10,2),
    unit_price   DECIMAL(10,2),
    supplier     VARCHAR(50)
);

-- ============================================================
-- PRODUCTS DATA
-- ============================================================

INSERT INTO products_clean
(product_id, product_name, category, subcategory, unit_cost, unit_price, supplier)
VALUES
('P001', 'Summit Pro 65L Backpack', 'Hiking & Trekking', 'Trekking', 3200, 6499.0, 'Quechua'),
('P002', 'Trailblazer 40L Backpack', 'Hiking & Trekking', 'Day Hiking', 1800, 3999.0, 'Quechua'),
('P003', 'StormShield 2-Person Tent', 'Camping & Bivouac', 'Camping', 4500, 8999.0, 'Forclaz'),
('P004', 'StormShield 4-Person Tent', 'Camping & Bivouac', 'Camping', 6200, 11999.0, 'Forclaz'),
('P005', 'FrostGuard Sleeping Bag -5C', 'Camping & Bivouac', 'Camping', 1500, 2999.0, 'Forclaz'),
('P006', 'TrailRunner Hiking Boots', 'Hiking & Trekking', 'Trekking', 1200, 2799.0, 'Quechua'),
('P007', 'AquaFlow 2L Hydration Pack', 'Hiking & Trekking', 'Day Hiking', 350, 899.0, 'Quechua'),
('P008', 'SolarCharge Power Bank 20000', 'Hiking & Trekking', 'Accessories', 900, 1999.0, 'Geonaute'),
('P009', 'CampLight LED Lantern', 'Hiking & Trekking', 'Camping', 300, 799.0, 'Geonaute'),
('P010', 'GripTrek Trekking Poles (Pair)', 'Hiking & Trekking', 'Trekking', 450, 1199.0, 'Quechua'),
('P011', 'RainArmor Waterproof Jacket', 'Hiking & Trekking', 'All-Weather', 1100, 2499.0, 'Quechua'),
('P012', 'ThermoFlask 1L', 'Hiking & Trekking', 'Day Hiking', 250, 699.0, 'Geonaute'),
('P013', 'BaseCamp Folding Chair', 'Camping & Bivouac', 'Camping', 700, 1599.0, 'Forclaz'),
('P014', 'NightHawk Headlamp', 'Hiking & Trekking', 'Camping', 200, 2689.0, 'Geonaute'),
('P015', 'TrailMap GPS Handheld', 'Hiking & Trekking', 'Navigation', 2500, 5499.0, 'Geonaute');


-- ============================================================
-- SALES TABLE
-- ============================================================

DROP TABLE IF EXISTS sales_clean;

CREATE TABLE sales_clean (
    sale_id             VARCHAR(10) PRIMARY KEY,
    product_id          VARCHAR(10),
    sale_date           DATE,
    quantity_sold       INT,
    unit_price_at_sale  DECIMAL(10,2),
    discount_pct        DECIMAL(4,2),
    sales_channel       VARCHAR(20),
    customer_city       VARCHAR(50),

    FOREIGN KEY (product_id)
        REFERENCES products_clean(product_id)
);


-- ============================================================
-- SALES DATA
-- ============================================================

INSERT INTO sales_clean
(sale_id, product_id, sale_date, quantity_sold,
 unit_price_at_sale, discount_pct, sales_channel, customer_city)
VALUES
('S0001', 'P001', '2023-02-01', 1, 6499.0, 0.0, 'Online', 'Pune'),
('S0002', 'P002', '2023-02-03', 2, 3999.0, 0.05, 'Online', 'Mumbai'),
('S0003', 'P003', '2023-02-10', 1, 8999.0, 0.0, 'Store', 'Delhi'),
('S0004', 'P004', '2023-02-10', 1, 11999.0, 0.0, 'Online', 'Kochi'),
('S0005', 'P006', '2023-02-15', 1, 2799.0, 0.0, 'Store', 'Chennai'),
('S0006', 'P007', '2023-02-18', 3, 899.0, 0.0, 'Online', 'Goa'),
('S0007', 'P009', '2023-02-20', 2, 799.0, 0.0, 'Store', 'Jaipur'),
('S0008', 'P010', '2023-02-22', 1, 1199.0, 0.1, 'Online', 'Chandigarh'),
('S0009', 'P011', '2023-02-25', 1, 2499.0, 0.0, 'Store', 'Lucknow'),
('S0010', 'P012', '2023-02-25', 4, 699.0, 0.0, 'Online', 'Mumbai'),
('S0011', 'P013', '2023-03-01', 1, 1599.0, 0.0, 'Store', 'Hyderabad'),
('S0012', 'P015', '2023-03-03', 1, 5499.0, 0.05, 'Online', 'Trivandrum'),
('S0013', 'P001', '2023-03-05', 1, 6499.0, 0.0, 'Store', 'Bengaluru'),
('S0014', 'P005', '2023-03-08', 2, 2999.0, 0.0, 'Online', 'Kolkata'),
('S0015', 'P008', '2023-03-10', 1, 1999.0, 0.0, 'Store', 'Indore'),
('S0016', 'P002', '2023-03-10', 1, 3999.0, 0.0, 'Online', 'Delhi'),
('S0020', 'P003', '2023-03-18', 1, 8999.0, 0.0, 'Online', 'Amritsar'),
('S0021', 'P010', '2023-03-20', 2, 1199.0, 0.0, 'Store', 'Coimbatore'),
('S0022', 'P011', '2023-03-20', 1, 2499.0, 0.0, 'Online', 'Mumbai'),
('S0023', 'P007', '2023-03-22', 2, 899.0, 0.0, 'Store', 'Pune'),
('S0024', 'P004', '2023-03-25', 1, 11999.0, 0.0, 'Online', 'Delhi'),
('S0026', 'P009', '2023-03-28', 3, 799.0, 0.0, 'Online', 'Goa'),
('S0027', 'P013', '2023-04-01', 1, 1599.0, 0.0, 'Store', 'Jaipur'),
('S0028', 'P015', '2023-04-03', 1, 5499.0, 0.0, 'Online', 'Chandigarh'),
('S0029', 'P001', '2023-04-04', 1, 6499.0, 0.0, 'Store', 'Lucknow'),
('S0030', 'P002', '2023-04-06', 2, 3999.0, 0.0, 'Online', 'Mumbai'),
('S0031', 'P005', '2023-04-09', 1, 2999.0, 0.05, 'Store', 'Hyderabad'),
('S0032', 'P008', '2023-09-04', 1, 1999.0, 0.0, 'Online', 'Trivandrum'),
('S0033', 'P006', '2023-04-12', 1, 2799.0, 0.0, 'Store', 'Bengaluru'),
('S0034', 'P011', '2023-04-15', 2, 2499.0, 0.0, 'Online', 'Kolkata'),
('S0035', 'P010', '2023-04-15', 1, 1199.0, 0.0, 'Store', 'Indore'),
('S0036', 'P003', '2023-04-18', 1, 8999.0, 0.0, 'Online', 'Delhi'),
('S0038', 'P009', '2023-04-22', 2, 799.0, 0.0, 'Online', 'Nagpur'),
('S0039', 'P012', '2023-04-22', 3, 699.0, 0.0, 'Store', 'Ludhiana'),
('S0040', 'P004', '2023-04-25', 1, 11999.0, 0.0, 'Online', 'Amritsar');
