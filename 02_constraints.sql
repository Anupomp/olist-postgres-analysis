ALTER TABLE orders
  ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE order_items
  ADD FOREIGN KEY (order_id) REFERENCES orders(order_id),
  ADD FOREIGN KEY (product_id) REFERENCES products(product_id),
  ADD FOREIGN KEY (seller_id) REFERENCES sellers(seller_id);

ALTER TABLE order_payments
  ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE order_reviews
  ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);