-- CreateIndex
CREATE INDEX "authors_name_idx" ON "public"."authors" USING GIN ("name" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "binding_jobs_book_id_idx" ON "public"."binding_jobs"("book_id");

-- CreateIndex
CREATE INDEX "binding_jobs_partner_id_idx" ON "public"."binding_jobs"("partner_id");

-- CreateIndex
CREATE INDEX "binding_jobs_status_idx" ON "public"."binding_jobs"("status");

-- CreateIndex
CREATE INDEX "binding_jobs_due_date_idx" ON "public"."binding_jobs"("due_date");

-- CreateIndex
CREATE INDEX "binding_jobs_date_completed_idx" ON "public"."binding_jobs"("date_completed");

-- CreateIndex
CREATE INDEX "blogs_title_idx" ON "public"."blogs" USING GIN ("title" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "blogs_category_idx" ON "public"."blogs"("category");

-- CreateIndex
CREATE INDEX "book_authors_book_id_idx" ON "public"."book_authors"("book_id");

-- CreateIndex
CREATE INDEX "book_authors_author_id_idx" ON "public"."book_authors"("author_id");

-- CreateIndex
CREATE INDEX "books_subtitle_idx" ON "public"."books" USING GIN ("subtitle" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "books_language_id_idx" ON "public"."books"("language_id");

-- CreateIndex
CREATE INDEX "books_category_id_idx" ON "public"."books"("category_id");

-- CreateIndex
CREATE INDEX "books_status_idx" ON "public"."books"("status");

-- CreateIndex
CREATE INDEX "cart_discounts_cart_id_idx" ON "public"."cart_discounts"("cart_id");

-- CreateIndex
CREATE INDEX "cart_discounts_discount_id_idx" ON "public"."cart_discounts"("discount_id");

-- CreateIndex
CREATE INDEX "cart_discounts_discount_code_id_idx" ON "public"."cart_discounts"("discount_code_id");

-- CreateIndex
CREATE INDEX "carts_customer_id_idx" ON "public"."carts"("customer_id");

-- CreateIndex
CREATE INDEX "carts_status_idx" ON "public"."carts"("status");

-- CreateIndex
CREATE INDEX "categories_name_idx" ON "public"."categories" USING GIN ("name" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "cover_design_jobs_book_id_idx" ON "public"."cover_design_jobs"("book_id");

-- CreateIndex
CREATE INDEX "cover_design_jobs_partner_id_idx" ON "public"."cover_design_jobs"("partner_id");

-- CreateIndex
CREATE INDEX "cover_design_jobs_status_idx" ON "public"."cover_design_jobs"("status");

-- CreateIndex
CREATE INDEX "cover_design_jobs_due_date_idx" ON "public"."cover_design_jobs"("due_date");

-- CreateIndex
CREATE INDEX "cover_design_jobs_date_completed_idx" ON "public"."cover_design_jobs"("date_completed");

-- CreateIndex
CREATE INDEX "cover_setting_jobs_book_id_idx" ON "public"."cover_setting_jobs"("book_id");

-- CreateIndex
CREATE INDEX "cover_setting_jobs_partner_id_idx" ON "public"."cover_setting_jobs"("partner_id");

-- CreateIndex
CREATE INDEX "cover_setting_jobs_status_idx" ON "public"."cover_setting_jobs"("status");

-- CreateIndex
CREATE INDEX "cover_setting_jobs_due_date_idx" ON "public"."cover_setting_jobs"("due_date");

-- CreateIndex
CREATE INDEX "customer_interests_category_id_idx" ON "public"."customer_interests"("category_id");

-- CreateIndex
CREATE INDEX "customers_phone_idx" ON "public"."customers"("phone");

-- CreateIndex
CREATE INDEX "customers_name_idx" ON "public"."customers" USING GIN ("name" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "discount_books_book_id_idx" ON "public"."discount_books"("book_id");

-- CreateIndex
CREATE INDEX "discount_categories_category_id_idx" ON "public"."discount_categories"("category_id");

-- CreateIndex
CREATE INDEX "discount_codes_discount_id_idx" ON "public"."discount_codes"("discount_id");

-- CreateIndex
CREATE INDEX "discount_codes_is_active_idx" ON "public"."discount_codes"("is_active");

-- CreateIndex
CREATE INDEX "discount_codes_starts_at_idx" ON "public"."discount_codes"("starts_at");

-- CreateIndex
CREATE INDEX "discount_codes_ends_at_idx" ON "public"."discount_codes"("ends_at");

-- CreateIndex
CREATE INDEX "discount_customer_sources_source_idx" ON "public"."discount_customer_sources"("source");

-- CreateIndex
CREATE INDEX "discount_payment_modes_payment_mode_idx" ON "public"."discount_payment_modes"("payment_mode");

-- CreateIndex
CREATE INDEX "discount_redemptions_discount_id_idx" ON "public"."discount_redemptions"("discount_id");

-- CreateIndex
CREATE INDEX "discount_redemptions_discount_code_id_idx" ON "public"."discount_redemptions"("discount_code_id");

-- CreateIndex
CREATE INDEX "discount_redemptions_order_id_idx" ON "public"."discount_redemptions"("order_id");

-- CreateIndex
CREATE INDEX "discount_redemptions_customer_id_idx" ON "public"."discount_redemptions"("customer_id");

-- CreateIndex
CREATE INDEX "discounts_is_active_idx" ON "public"."discounts"("is_active");

-- CreateIndex
CREATE INDEX "discounts_target_idx" ON "public"."discounts"("target");

-- CreateIndex
CREATE INDEX "discounts_discount_type_idx" ON "public"."discounts"("discount_type");

-- CreateIndex
CREATE INDEX "discounts_starts_at_idx" ON "public"."discounts"("starts_at");

-- CreateIndex
CREATE INDEX "discounts_ends_at_idx" ON "public"."discounts"("ends_at");

-- CreateIndex
CREATE INDEX "discounts_name_idx" ON "public"."discounts" USING GIN ("name" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "dtp_jobs_book_id_idx" ON "public"."dtp_jobs"("book_id");

-- CreateIndex
CREATE INDEX "dtp_jobs_partner_id_idx" ON "public"."dtp_jobs"("partner_id");

-- CreateIndex
CREATE INDEX "dtp_jobs_status_idx" ON "public"."dtp_jobs"("status");

-- CreateIndex
CREATE INDEX "dtp_jobs_due_date_idx" ON "public"."dtp_jobs"("due_date");

-- CreateIndex
CREATE INDEX "dtp_jobs_date_completed_idx" ON "public"."dtp_jobs"("date_completed");

-- CreateIndex
CREATE INDEX "editing_jobs_book_id_idx" ON "public"."editing_jobs"("book_id");

-- CreateIndex
CREATE INDEX "editing_jobs_partner_id_idx" ON "public"."editing_jobs"("partner_id");

-- CreateIndex
CREATE INDEX "editing_jobs_status_idx" ON "public"."editing_jobs"("status");

-- CreateIndex
CREATE INDEX "editing_jobs_due_date_idx" ON "public"."editing_jobs"("due_date");

-- CreateIndex
CREATE INDEX "editing_jobs_date_completed_idx" ON "public"."editing_jobs"("date_completed");

-- CreateIndex
CREATE INDEX "editing_jobs_notes_idx" ON "public"."editing_jobs" USING GIN ("notes" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "exam_requests_user_id_idx" ON "public"."exam_requests"("user_id");

-- CreateIndex
CREATE INDEX "exam_requests_book_id_idx" ON "public"."exam_requests"("book_id");

-- CreateIndex
CREATE INDEX "exam_requests_status_idx" ON "public"."exam_requests"("status");

-- CreateIndex
CREATE INDEX "exam_requests_created_at_idx" ON "public"."exam_requests"("created_at");

-- CreateIndex
CREATE INDEX "homepage_trending_book_id_idx" ON "public"."homepage_trending"("book_id");

-- CreateIndex
CREATE INDEX "homepage_trending_created_by_idx" ON "public"."homepage_trending"("created_by");

-- CreateIndex
CREATE INDEX "homepage_trending_position_idx" ON "public"."homepage_trending"("position");

-- CreateIndex
CREATE INDEX "homepage_upcoming_book_id_idx" ON "public"."homepage_upcoming"("book_id");

-- CreateIndex
CREATE INDEX "homepage_upcoming_created_by_idx" ON "public"."homepage_upcoming"("created_by");

-- CreateIndex
CREATE INDEX "homepage_upcoming_preorder_enabled_idx" ON "public"."homepage_upcoming"("preorder_enabled");

-- CreateIndex
CREATE INDEX "homepage_upcoming_expected_release_date_idx" ON "public"."homepage_upcoming"("expected_release_date");

-- CreateIndex
CREATE INDEX "invoices_customer_id_idx" ON "public"."invoices"("customer_id");

-- CreateIndex
CREATE INDEX "invoices_billing_address_id_idx" ON "public"."invoices"("billing_address_id");

-- CreateIndex
CREATE INDEX "invoices_warehouse_id_idx" ON "public"."invoices"("warehouse_id");

-- CreateIndex
CREATE INDEX "invoices_salesman_id_idx" ON "public"."invoices"("salesman_id");

-- CreateIndex
CREATE INDEX "invoices_status_idx" ON "public"."invoices"("status");

-- CreateIndex
CREATE INDEX "invoices_issued_at_idx" ON "public"."invoices"("issued_at");

-- CreateIndex
CREATE INDEX "invoices_finalized_at_idx" ON "public"."invoices"("finalized_at");

-- CreateIndex
CREATE INDEX "invoices_customer_name_idx" ON "public"."invoices" USING GIN ("customer_name" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "lamination_jobs_book_id_idx" ON "public"."lamination_jobs"("book_id");

-- CreateIndex
CREATE INDEX "lamination_jobs_partner_id_idx" ON "public"."lamination_jobs"("partner_id");

-- CreateIndex
CREATE INDEX "lamination_jobs_status_idx" ON "public"."lamination_jobs"("status");

-- CreateIndex
CREATE INDEX "lamination_jobs_due_date_idx" ON "public"."lamination_jobs"("due_date");

-- CreateIndex
CREATE INDEX "lamination_jobs_date_completed_idx" ON "public"."lamination_jobs"("date_completed");

-- CreateIndex
CREATE INDEX "languages_name_idx" ON "public"."languages" USING GIN ("name" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "order_discounts_order_id_idx" ON "public"."order_discounts"("order_id");

-- CreateIndex
CREATE INDEX "order_discounts_discount_id_idx" ON "public"."order_discounts"("discount_id");

-- CreateIndex
CREATE INDEX "order_discounts_discount_code_id_idx" ON "public"."order_discounts"("discount_code_id");

-- CreateIndex
CREATE INDEX "order_events_order_id_idx" ON "public"."order_events"("order_id");

-- CreateIndex
CREATE INDEX "order_events_event_type_idx" ON "public"."order_events"("event_type");

-- CreateIndex
CREATE INDEX "order_item_discounts_order_item_id_idx" ON "public"."order_item_discounts"("order_item_id");

-- CreateIndex
CREATE INDEX "order_item_discounts_discount_id_idx" ON "public"."order_item_discounts"("discount_id");

-- CreateIndex
CREATE INDEX "order_item_discounts_discount_code_id_idx" ON "public"."order_item_discounts"("discount_code_id");

-- CreateIndex
CREATE INDEX "orders_billing_address_id_idx" ON "public"."orders"("billing_address_id");

-- CreateIndex
CREATE INDEX "orders_shipping_address_id_idx" ON "public"."orders"("shipping_address_id");

-- CreateIndex
CREATE INDEX "orders_status_idx" ON "public"."orders"("status");

-- CreateIndex
CREATE INDEX "orders_payment_status_idx" ON "public"."orders"("payment_status");

-- CreateIndex
CREATE INDEX "paper_supply_orders_partner_id_idx" ON "public"."paper_supply_orders"("partner_id");

-- CreateIndex
CREATE INDEX "paper_supply_orders_status_idx" ON "public"."paper_supply_orders"("status");

-- CreateIndex
CREATE INDEX "paper_supply_orders_date_expected_idx" ON "public"."paper_supply_orders"("date_expected");

-- CreateIndex
CREATE INDEX "paper_supply_orders_date_completed_idx" ON "public"."paper_supply_orders"("date_completed");

-- CreateIndex
CREATE INDEX "partners_address_id_idx" ON "public"."partners"("address_id");

-- CreateIndex
CREATE INDEX "partners_type_idx" ON "public"."partners"("type");

-- CreateIndex
CREATE INDEX "partners_name_idx" ON "public"."partners" USING GIN ("name" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "payments_order_id_idx" ON "public"."payments"("order_id");

-- CreateIndex
CREATE INDEX "payments_status_idx" ON "public"."payments"("status");

-- CreateIndex
CREATE INDEX "payments_mode_idx" ON "public"."payments"("mode");

-- CreateIndex
CREATE INDEX "print_runs_book_id_idx" ON "public"."print_runs"("book_id");

-- CreateIndex
CREATE INDEX "print_runs_printer_inner_id_idx" ON "public"."print_runs"("printer_inner_id");

-- CreateIndex
CREATE INDEX "print_runs_printer_cover_id_idx" ON "public"."print_runs"("printer_cover_id");

-- CreateIndex
CREATE INDEX "print_runs_run_no_idx" ON "public"."print_runs"("run_no");

-- CreateIndex
CREATE INDEX "printing_jobs_book_id_idx" ON "public"."printing_jobs"("book_id");

-- CreateIndex
CREATE INDEX "printing_jobs_partner_id_idx" ON "public"."printing_jobs"("partner_id");

-- CreateIndex
CREATE INDEX "printing_jobs_job_type_idx" ON "public"."printing_jobs"("job_type");

-- CreateIndex
CREATE INDEX "printing_jobs_status_idx" ON "public"."printing_jobs"("status");

-- CreateIndex
CREATE INDEX "printing_jobs_due_date_idx" ON "public"."printing_jobs"("due_date");

-- CreateIndex
CREATE INDEX "printing_jobs_date_completed_idx" ON "public"."printing_jobs"("date_completed");

-- CreateIndex
CREATE INDEX "proofreading_jobs_book_id_idx" ON "public"."proofreading_jobs"("book_id");

-- CreateIndex
CREATE INDEX "proofreading_jobs_partner_id_idx" ON "public"."proofreading_jobs"("partner_id");

-- CreateIndex
CREATE INDEX "proofreading_jobs_status_idx" ON "public"."proofreading_jobs"("status");

-- CreateIndex
CREATE INDEX "proofreading_jobs_due_date_idx" ON "public"."proofreading_jobs"("due_date");

-- CreateIndex
CREATE INDEX "proofreading_jobs_date_completed_idx" ON "public"."proofreading_jobs"("date_completed");

-- CreateIndex
CREATE INDEX "refunds_payment_id_idx" ON "public"."refunds"("payment_id");

-- CreateIndex
CREATE INDEX "refunds_status_idx" ON "public"."refunds"("status");

-- CreateIndex
CREATE INDEX "reviews_book_id_idx" ON "public"."reviews"("book_id");

-- CreateIndex
CREATE INDEX "reviews_user_id_idx" ON "public"."reviews"("user_id");

-- CreateIndex
CREATE INDEX "reviews_rating_idx" ON "public"."reviews"("rating");

-- CreateIndex
CREATE INDEX "reviews_comment_idx" ON "public"."reviews" USING GIN ("comment" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "shipment_items_shipment_id_idx" ON "public"."shipment_items"("shipment_id");

-- CreateIndex
CREATE INDEX "shipment_items_order_item_id_idx" ON "public"."shipment_items"("order_item_id");

-- CreateIndex
CREATE INDEX "shipments_order_id_idx" ON "public"."shipments"("order_id");

-- CreateIndex
CREATE INDEX "shipments_warehouse_id_idx" ON "public"."shipments"("warehouse_id");

-- CreateIndex
CREATE INDEX "shipments_shipping_address_id_idx" ON "public"."shipments"("shipping_address_id");

-- CreateIndex
CREATE INDEX "shipments_status_idx" ON "public"."shipments"("status");

-- CreateIndex
CREATE INDEX "staff_name_idx" ON "public"."staff" USING GIN ("name" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "stock_movements_book_id_idx" ON "public"."stock_movements"("book_id");

-- CreateIndex
CREATE INDEX "stock_movements_print_run_id_idx" ON "public"."stock_movements"("print_run_id");

-- CreateIndex
CREATE INDEX "stock_movements_warehouse_id_idx" ON "public"."stock_movements"("warehouse_id");

-- CreateIndex
CREATE INDEX "stock_movements_dir_idx" ON "public"."stock_movements"("dir");

-- CreateIndex
CREATE INDEX "stock_movements_reason_idx" ON "public"."stock_movements" USING GIN ("reason" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "stock_reservations_order_item_id_idx" ON "public"."stock_reservations"("order_item_id");

-- CreateIndex
CREATE INDEX "stock_reservations_warehouse_id_idx" ON "public"."stock_reservations"("warehouse_id");

-- CreateIndex
CREATE INDEX "warehouses_address_id_idx" ON "public"."warehouses"("address_id");

-- CreateIndex
CREATE INDEX "wishlists_user_id_idx" ON "public"."wishlists"("user_id");

-- CreateIndex
CREATE INDEX "wishlists_session_id_idx" ON "public"."wishlists"("session_id");

-- CreateIndex
CREATE INDEX "wishlists_book_id_idx" ON "public"."wishlists"("book_id");
