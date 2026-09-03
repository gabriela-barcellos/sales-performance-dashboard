-- =====================================================
-- SALES PERFORMANCE DASHBOARD
-- 03_data_cleaning.sql
-- Description: Data cleaning and validation
-- =====================================================


-- =====================================================
-- CONVERT DATE COLUMNS TO TIMESTAMP
-- =====================================================
-- The original CSV files were imported with date columns
-- stored as VARCHAR. These columns are converted to
-- TIMESTAMP to enable date calculations and time-based
-- analysis.
-- =====================================================

ALTER TABLE public.olist_orders_dataset
ALTER COLUMN order_purchase_timestamp
TYPE TIMESTAMP
USING order_purchase_timestamp::TIMESTAMP;

ALTER TABLE public.olist_orders_dataset
ALTER COLUMN order_approved_at
TYPE TIMESTAMP
USING NULLIF(order_approved_at, '')::TIMESTAMP;

ALTER TABLE public.olist_orders_dataset
ALTER COLUMN order_delivered_carrier_date
TYPE TIMESTAMP
USING NULLIF(order_delivered_carrier_date, '')::TIMESTAMP;

ALTER TABLE public.olist_orders_dataset
ALTER COLUMN order_delivered_customer_date
TYPE TIMESTAMP
USING NULLIF(order_delivered_customer_date, '')::TIMESTAMP;

ALTER TABLE public.olist_orders_dataset
ALTER COLUMN order_estimated_delivery_date
TYPE TIMESTAMP
USING order_estimated_delivery_date::TIMESTAMP;


-- =====================================================
-- CHECK FOR DUPLICATE REVIEW IDs
-- =====================================================

SELECT
    review_id,
    COUNT(*)
FROM public.olist_order_reviews_dataset
GROUP BY review_id
HAVING COUNT(*) > 1;


-- =====================================================
-- CHECK PRODUCT CATEGORIES WITHOUT TRANSLATION
-- =====================================================

SELECT DISTINCT
    p.product_category_name
FROM public.olist_products_dataset p
LEFT JOIN public.product_category_name_translation t
    ON p.product_category_name = t.product_category_name
WHERE p.product_category_name IS NOT NULL
  AND t.product_category_name IS NULL;


-- =====================================================
-- INSERT MISSING PRODUCT CATEGORIES
-- =====================================================

INSERT INTO public.product_category_name_translation
(
    product_category_name,
    product_category_name_english
)
VALUES
(
    'portateis_cozinha_e_preparadores_de_alimentos',
    'portable_kitchen_and_food_preparation'
),
(
    'pc_gamer',
    'gaming_pc'
);


-- =====================================================
-- CHECK EMPTY PRODUCT CATEGORIES
-- =====================================================

SELECT COUNT(*)
FROM public.olist_products_dataset
WHERE product_category_name = '';


-- =====================================================
-- REPLACE EMPTY PRODUCT CATEGORIES WITH NULL
-- =====================================================

UPDATE public.olist_products_dataset
SET product_category_name = NULL
WHERE product_category_name = '';