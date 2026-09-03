-- =====================================================
-- SALES PERFORMANCE DASHBOARD
-- 02_constraints.sql
-- Description: Creation of Primary and Foreign Keys
-- =====================================================

-- =====================================================
-- NOTE
-- =====================================================
-- The table olist_order_reviews_dataset does not have
-- a PRIMARY KEY because the review_id column contains
-- duplicate values in the original dataset.


-- =====================================================
-- PRIMARY KEYS
-- =====================================================

ALTER TABLE public.olist_customers_dataset
ADD CONSTRAINT pk_customers
PRIMARY KEY (customer_id);

ALTER TABLE public.olist_orders_dataset
ADD CONSTRAINT pk_orders
PRIMARY KEY (order_id);

ALTER TABLE public.olist_products_dataset
ADD CONSTRAINT pk_products
PRIMARY KEY (product_id);

ALTER TABLE public.olist_sellers_dataset
ADD CONSTRAINT pk_sellers
PRIMARY KEY (seller_id);

ALTER TABLE public.olist_order_items_dataset
ADD CONSTRAINT pk_order_items
PRIMARY KEY (
    order_id,
    order_item_id
);

ALTER TABLE public.olist_order_payments_dataset
ADD CONSTRAINT pk_order_payments
PRIMARY KEY (
    order_id,
    payment_sequential
);

-- The geolocation table contains duplicate records.
-- For this reason, no PRIMARY KEY was created.

-- =====================================================
-- FOREIGN KEYS
-- =====================================================

ALTER TABLE public.olist_orders_dataset
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES public.olist_customers_dataset(customer_id);

ALTER TABLE public.olist_order_items_dataset
ADD CONSTRAINT fk_order_items_orders
FOREIGN KEY (order_id)
REFERENCES public.olist_orders_dataset(order_id);

ALTER TABLE public.olist_order_items_dataset
ADD CONSTRAINT fk_order_items_products
FOREIGN KEY (product_id)
REFERENCES public.olist_products_dataset(product_id);

ALTER TABLE public.olist_order_items_dataset
ADD CONSTRAINT fk_order_items_sellers
FOREIGN KEY (seller_id)
REFERENCES public.olist_sellers_dataset(seller_id);

ALTER TABLE public.olist_order_payments_dataset
ADD CONSTRAINT fk_order_payments_orders
FOREIGN KEY (order_id)
REFERENCES public.olist_orders_dataset(order_id);

ALTER TABLE public.olist_order_reviews_dataset
ADD CONSTRAINT fk_order_reviews_orders
FOREIGN KEY (order_id)
REFERENCES public.olist_orders_dataset(order_id);