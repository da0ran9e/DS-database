
ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: chriskl; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);


--
-- Name: inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: chriskl; Tablespace: 
--

ALTER TABLE ONLY inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (prod_id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: chriskl; Tablespace: 
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: chriskl; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (prod_id);


--
-- Name: ix_cust_hist_customerid; Type: INDEX; Schema: public; Owner: chriskl; Tablespace: 
--

CREATE INDEX ix_cust_hist_customerid ON cust_hist USING btree (customerid);


--
-- Name: ix_cust_username; Type: INDEX; Schema: public; Owner: chriskl; Tablespace: 
--

CREATE UNIQUE INDEX ix_cust_username ON customers USING btree (username);


--
-- Name: ix_order_custid; Type: INDEX; Schema: public; Owner: chriskl; Tablespace: 
--

CREATE INDEX ix_order_custid ON orders USING btree (customerid);


--
-- Name: ix_orderlines_orderid; Type: INDEX; Schema: public; Owner: chriskl; Tablespace: 
--

CREATE UNIQUE INDEX ix_orderlines_orderid ON orderlines USING btree (orderid, orderlineid);


--
-- Name: ix_prod_category; Type: INDEX; Schema: public; Owner: chriskl; Tablespace: 
--

CREATE INDEX ix_prod_category ON products USING btree (category);


--
-- Name: ix_prod_special; Type: INDEX; Schema: public; Owner: chriskl; Tablespace: 
--

CREATE INDEX ix_prod_special ON products USING btree (special);


--
-- Name: fk_cust_hist_customerid; Type: FK CONSTRAINT; Schema: public; Owner: chriskl
--

ALTER TABLE ONLY cust_hist
    ADD CONSTRAINT fk_cust_hist_customerid FOREIGN KEY (customerid) REFERENCES customers(customerid) ON DELETE CASCADE;


--
-- Name: fk_customerid; Type: FK CONSTRAINT; Schema: public; Owner: chriskl
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT fk_customerid FOREIGN KEY (customerid) REFERENCES customers(customerid) ON DELETE SET NULL;


--
-- Name: fk_orderid; Type: FK CONSTRAINT; Schema: public; Owner: chriskl
--

ALTER TABLE ONLY orderlines
    ADD CONSTRAINT fk_orderid FOREIGN KEY (orderid) REFERENCES orders(orderid) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

