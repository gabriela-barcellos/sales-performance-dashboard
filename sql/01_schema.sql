-- =====================================================
-- SALES PERFORMANCE DASHBOARD
-- 01_schema.sql
-- Description: Database schema definition
-- =====================================================


-- =====================================================
-- TABLE: olist_customers_dataset
-- =====================================================

-- Drop table (optional)

-- DROP TABLE public.olist_customers_dataset;

CREATE TABLE public.olist_customers_dataset (
    customer_id varchar(50) NULL,
    customer_unique_id varchar(50) NULL,
    customer_zip_code_prefix int4 NULL,
    customer_city varchar(50) NULL,
    customer_state varchar(50) NULL,
    CONSTRAINT olist_customers_dataset_customer_id_not_null NOT NULL customer_id,
    CONSTRAINT olist_customers_dataset_pkey PRIMARY KEY (customer_id)
);


-- =====================================================
-- TABLE: olist_orders_dataset
-- =====================================================

-- Drop table (optional)

-- DROP TABLE public.olist_orders_dataset;

CREATE TABLE public.olist_orders_dataset (
    order_id varchar(50) NULL,
    customer_id varchar(50) NULL,
    order_status varchar(50) NULL,
    order_purchase_timestamp varchar(50) NULL,
    order_approved_at varchar(50) NULL,
    order_delivered_carrier_date varchar(50) NULL,
    order_delivered_customer_date varchar(50) NULL,
    order_estimated_delivery_date varchar(50) NULL,
    CONSTRAINT olist_orders_dataset_order_id_not_null NOT NULL order_id,
    CONSTRAINT olist_orders_dataset_pkey PRIMARY KEY (order_id),
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id)
        REFERENCES public.olist_customers_dataset(customer_id)
);


-- =====================================================
-- TABLE: olist_order_items_dataset
-- =====================================================

-- Drop table (optional)

-- DROP TABLE public.olist_order_items_dataset;

CREATE TABLE public.olist_order_items_dataset (
    order_id varchar(50) NULL,
    order_item_id int4 NULL,
    product_id varchar(50) NULL,
    seller_id varchar(50) NULL,
    shipping_limit_date varchar(50) NULL,
    price float4 NULL,
    freight_value float4 NULL,
    CONSTRAINT fk_items_orders FOREIGN KEY (order_id)
        REFERENCES public.olist_orders_dataset(order_id),
    CONSTRAINT fk_items_products FOREIGN KEY (product_id)
        REFERENCES public.olist_products_dataset(product_id),
    CONSTRAINT fk_items_sellers FOREIGN KEY (seller_id)
        REFERENCES public.olist_sellers_dataset(seller_id)
);


-- =====================================================
-- TABLE: olist_order_payments_dataset
-- =====================================================

-- Drop table (optional)

-- DROP TABLE public.olist_order_payments_dataset;

CREATE TABLE public.olist_order_payments_dataset (
    order_id varchar(50) NULL,
    payment_sequential int4 NULL,
    payment_type varchar(50) NULL,
    payment_installments int4 NULL,
    payment_value float4 NULL,
    CONSTRAINT fk_payments_orders FOREIGN KEY (order_id)
        REFERENCES public.olist_orders_dataset(order_id)
);


-- =====================================================
-- TABLE: olist_order_reviews_dataset
-- =====================================================

-- Drop table (optional)

-- DROP TABLE public.olist_order_reviews_dataset;

CREATE TABLE public.olist_order_reviews_dataset (
    review_id varchar(50) NULL,
    order_id varchar(50) NULL,
    review_score int4 NULL,
    review_comment_title text NULL,
    review_comment_message text NULL,
    review_creation_date timestamp NULL,
    review_answer_timestamp timestamp NULL
);


-- =====================================================
-- TABLE: olist_products_dataset
-- =====================================================

-- Drop table (optional)

-- DROP TABLE public.olist_products_dataset;

CREATE TABLE public.olist_products_dataset (
    product_id varchar(50) NULL,
    product_category_name varchar(50) NULL,
    product_name_lenght int4 NULL,
    product_description_lenght int4 NULL,
    product_photos_qty int4 NULL,
    product_weight_g int4 NULL,
    product_length_cm int4 NULL,
    product_height_cm int4 NULL,
    product_width_cm int4 NULL,
    CONSTRAINT olist_products_dataset_pkey PRIMARY KEY (product_id),
    CONSTRAINT olist_products_dataset_product_id_not_null NOT NULL product_id
);


-- =====================================================
-- TABLE: olist_sellers_dataset
-- =====================================================

-- Drop table (optional)

-- DROP TABLE public.olist_sellers_dataset;

CREATE TABLE public.olist_sellers_dataset (
    seller_id varchar(50) NULL,
    seller_zip_code_prefix int4 NULL,
    seller_city varchar(50) NULL,
    seller_state varchar(50) NULL,
    CONSTRAINT olist_sellers_dataset_pkey PRIMARY KEY (seller_id),
    CONSTRAINT olist_sellers_dataset_seller_id_not_null NOT NULL seller_id
);


-- =====================================================
-- TABLE: olist_geolocation_dataset
-- =====================================================

-- Drop table (optional)

-- DROP TABLE public.olist_geolocation_dataset;

CREATE TABLE public.olist_geolocation_dataset (
    geolocation_zip_code_prefix int4 NULL,
    geolocation_lat float4 NULL,
    geolocation_lng float4 NULL,
    geolocation_city varchar(50) NULL,
    geolocation_state varchar(50) NULL
);


-- =====================================================
-- TABLE: product_category_name_translation
-- =====================================================

-- Drop table (optional)

-- DROP TABLE public.product_category_name_translation;

CREATE TABLE public.product_category_name_translation (
    product_category_name varchar(50) NOT NULL,
    product_category_name_english varchar(50) NULL,
    CONSTRAINT product_category_name_translatio_product_category_name_not_null NOT NULL product_category_name,
    CONSTRAINT product_category_name_translation_pkey PRIMARY KEY (product_category_name)
);