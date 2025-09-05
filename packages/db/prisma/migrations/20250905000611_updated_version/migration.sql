/*
  Warnings:

  - The `status` column on the `books` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `customer_id` column on the `carts` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The primary key for the `customer_interests` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `categoriesId` on the `customer_interests` table. All the data in the column will be lost.
  - The primary key for the `customers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `customers` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the column `coupon_id` on the `orders` table. All the data in the column will be lost.
  - The `user_id` column on the `wishlists` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `book_jobs` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `book_stages` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `coupons` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[uuid]` on the table `customers` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[uuid]` on the table `orders` will be added. If there are existing duplicate values, this will fail.
  - Changed the type of `customer_id` on the `customer_addresses` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `customer_id` on the `customer_interests` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `category_id` on the `customer_interests` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - The required column `uuid` was added to the `customers` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Changed the type of `user_id` on the `exam_requests` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - The required column `uuid` was added to the `orders` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Changed the type of `customer_id` on the `orders` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Added the required column `updated_at` to the `paper_supply_orders` table without a default value. This is not possible if the table is not empty.
  - Changed the type of `user_id` on the `reviews` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "public"."invoice_status" AS ENUM ('DRAFT', 'ISSUED', 'FINALIZED', 'CANCELLED');

-- CreateEnum
CREATE TYPE "public"."discount_type" AS ENUM ('PERCENT', 'FLAT');

-- CreateEnum
CREATE TYPE "public"."discount_target" AS ENUM ('ORDER', 'ITEM', 'SHIPPING');

-- DropForeignKey
ALTER TABLE "public"."book_jobs" DROP CONSTRAINT "book_jobs_book_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."book_jobs" DROP CONSTRAINT "book_jobs_partner_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."book_stages" DROP CONSTRAINT "book_stages_book_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."carts" DROP CONSTRAINT "carts_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."customer_addresses" DROP CONSTRAINT "customer_addresses_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."customer_interests" DROP CONSTRAINT "customer_interests_categoriesId_fkey";

-- DropForeignKey
ALTER TABLE "public"."customer_interests" DROP CONSTRAINT "customer_interests_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."exam_requests" DROP CONSTRAINT "exam_requests_user_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."orders" DROP CONSTRAINT "orders_coupon_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."orders" DROP CONSTRAINT "orders_customer_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."reviews" DROP CONSTRAINT "reviews_user_id_fkey";

-- DropForeignKey
ALTER TABLE "public"."wishlists" DROP CONSTRAINT "wishlists_user_id_fkey";

-- AlterTable
ALTER TABLE "public"."books" DROP COLUMN "status",
ADD COLUMN     "status" TEXT;

-- AlterTable
ALTER TABLE "public"."carts" DROP COLUMN "customer_id",
ADD COLUMN     "customer_id" BIGINT;

-- AlterTable
ALTER TABLE "public"."customer_addresses" DROP COLUMN "customer_id",
ADD COLUMN     "customer_id" BIGINT NOT NULL;

-- AlterTable
ALTER TABLE "public"."customer_interests" DROP CONSTRAINT "customer_interests_pkey",
DROP COLUMN "categoriesId",
DROP COLUMN "customer_id",
ADD COLUMN     "customer_id" BIGINT NOT NULL,
DROP COLUMN "category_id",
ADD COLUMN     "category_id" BIGINT NOT NULL,
ADD CONSTRAINT "customer_interests_pkey" PRIMARY KEY ("customer_id", "category_id");

-- AlterTable
ALTER TABLE "public"."customers" DROP CONSTRAINT "customers_pkey",
ADD COLUMN     "uuid" TEXT NOT NULL,
DROP COLUMN "id",
ADD COLUMN     "id" BIGSERIAL NOT NULL,
ADD CONSTRAINT "customers_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "public"."exam_requests" DROP COLUMN "user_id",
ADD COLUMN     "user_id" BIGINT NOT NULL;

-- AlterTable
ALTER TABLE "public"."orders" DROP COLUMN "coupon_id",
ADD COLUMN     "uuid" TEXT NOT NULL,
DROP COLUMN "customer_id",
ADD COLUMN     "customer_id" BIGINT NOT NULL;

-- AlterTable
ALTER TABLE "public"."paper_supply_orders" ADD COLUMN     "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_at" TIMESTAMPTZ NOT NULL;

-- AlterTable
ALTER TABLE "public"."reviews" DROP COLUMN "user_id",
ADD COLUMN     "user_id" BIGINT NOT NULL;

-- AlterTable
ALTER TABLE "public"."wishlists" DROP COLUMN "user_id",
ADD COLUMN     "user_id" BIGINT;

-- DropTable
DROP TABLE "public"."book_jobs";

-- DropTable
DROP TABLE "public"."book_stages";

-- DropTable
DROP TABLE "public"."coupons";

-- CreateTable
CREATE TABLE "public"."staff" (
    "id" BIGSERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "phone" VARCHAR(10),
    "email" TEXT,
    "date_of_birth" DATE,
    "aadhaar_number" TEXT,
    "cv_url" TEXT,
    "joining_date" DATE,
    "salary" DECIMAL(10,2),
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "staff_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."invoices" (
    "id" BIGSERIAL NOT NULL,
    "invoice_no" TEXT NOT NULL,
    "uuid" TEXT NOT NULL,
    "status" "public"."invoice_status" NOT NULL,
    "customer_id" BIGINT,
    "customer_name" TEXT,
    "customer_phone" VARCHAR(10),
    "customer_email" TEXT,
    "billing_address_id" BIGINT,
    "warehouse_id" BIGINT,
    "salesman_id" BIGINT,
    "send_online_invoice" BOOLEAN NOT NULL DEFAULT false,
    "payment_mode" "public"."payment_mode",
    "payment_status" "public"."payment_status",
    "subtotal" DECIMAL(10,2) NOT NULL,
    "discount_total" DECIMAL(10,2) NOT NULL,
    "tax_total" DECIMAL(10,2) NOT NULL,
    "grand_total" DECIMAL(10,2) NOT NULL,
    "notes" TEXT,
    "issued_at" TIMESTAMPTZ,
    "finalized_at" TIMESTAMPTZ,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "invoices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."invoice_items" (
    "id" BIGSERIAL NOT NULL,
    "invoice_id" BIGINT NOT NULL,
    "book_id" BIGINT NOT NULL,
    "qty" INTEGER NOT NULL,
    "unit_price" DECIMAL(10,2) NOT NULL,
    "discount_amount" DECIMAL(10,2) NOT NULL,
    "tax_amount" DECIMAL(10,2) NOT NULL,
    "line_total" DECIMAL(10,2) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "invoice_items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."dtp_jobs" (
    "id" BIGSERIAL NOT NULL,
    "book_id" BIGINT NOT NULL,
    "partner_id" BIGINT NOT NULL,
    "status" "public"."job_status" NOT NULL,
    "date_received" DATE,
    "date_started" DATE,
    "due_date" DATE,
    "date_completed" DATE,
    "qty_expected" INTEGER,
    "qty_completed" INTEGER,
    "unit_cost" DECIMAL(10,2),
    "order_type" "public"."job_order_type" NOT NULL,
    "rate" DECIMAL(10,2),
    "total" DECIMAL(10,2),
    "is_paid" BOOLEAN NOT NULL DEFAULT false,
    "payment_mode" "public"."payment_mode",
    "is_due" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "dtp_jobs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."editing_jobs" (
    "id" BIGSERIAL NOT NULL,
    "book_id" BIGINT NOT NULL,
    "partner_id" BIGINT NOT NULL,
    "status" "public"."job_status" NOT NULL,
    "date_received" DATE,
    "date_started" DATE,
    "due_date" DATE,
    "date_completed" DATE,
    "unit_cost" DECIMAL(10,2),
    "order_type" "public"."job_order_type" NOT NULL,
    "rate" DECIMAL(10,2),
    "total" DECIMAL(10,2),
    "is_paid" BOOLEAN NOT NULL DEFAULT false,
    "payment_mode" "public"."payment_mode",
    "is_due" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "editing_jobs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."proofreading_jobs" (
    "id" BIGSERIAL NOT NULL,
    "book_id" BIGINT NOT NULL,
    "partner_id" BIGINT NOT NULL,
    "status" "public"."job_status" NOT NULL,
    "date_received" DATE,
    "date_started" DATE,
    "due_date" DATE,
    "date_completed" DATE,
    "unit_cost" DECIMAL(10,2),
    "order_type" "public"."job_order_type" NOT NULL,
    "rate" DECIMAL(10,2),
    "total" DECIMAL(10,2),
    "is_paid" BOOLEAN NOT NULL DEFAULT false,
    "payment_mode" "public"."payment_mode",
    "is_due" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "proofreading_jobs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."printing_jobs" (
    "id" BIGSERIAL NOT NULL,
    "book_id" BIGINT NOT NULL,
    "partner_id" BIGINT NOT NULL,
    "job_type" "public"."print_job_type" NOT NULL,
    "status" "public"."job_status" NOT NULL,
    "date_mailed" DATE,
    "date_started" DATE,
    "due_date" DATE,
    "date_completed" DATE,
    "qty_expected" INTEGER,
    "qty_completed" INTEGER,
    "unit_cost" DECIMAL(10,2),
    "order_type" "public"."job_order_type" NOT NULL,
    "rate" DECIMAL(10,2),
    "total" DECIMAL(10,2),
    "is_paid" BOOLEAN NOT NULL DEFAULT false,
    "payment_mode" "public"."payment_mode",
    "is_due" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "printing_jobs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."cover_design_jobs" (
    "id" BIGSERIAL NOT NULL,
    "book_id" BIGINT NOT NULL,
    "partner_id" BIGINT NOT NULL,
    "status" "public"."job_status" NOT NULL,
    "date_sent" DATE,
    "date_started" DATE,
    "due_date" DATE,
    "date_completed" DATE,
    "unit_cost" DECIMAL(10,2),
    "order_type" "public"."job_order_type" NOT NULL,
    "rate" DECIMAL(10,2),
    "total" DECIMAL(10,2),
    "is_paid" BOOLEAN NOT NULL DEFAULT false,
    "payment_mode" "public"."payment_mode",
    "is_due" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "cover_design_jobs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."cover_setting_jobs" (
    "id" BIGSERIAL NOT NULL,
    "book_id" BIGINT NOT NULL,
    "partner_id" BIGINT NOT NULL,
    "status" "public"."job_status" NOT NULL,
    "date_started" DATE,
    "due_date" DATE,
    "unit_cost" DECIMAL(10,2),
    "order_type" "public"."job_order_type" NOT NULL,
    "rate" DECIMAL(10,2),
    "total" DECIMAL(10,2),
    "is_paid" BOOLEAN NOT NULL DEFAULT false,
    "payment_mode" "public"."payment_mode",
    "is_due" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "cover_setting_jobs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."lamination_jobs" (
    "id" BIGSERIAL NOT NULL,
    "book_id" BIGINT NOT NULL,
    "partner_id" BIGINT NOT NULL,
    "status" "public"."job_status" NOT NULL,
    "date_received" DATE,
    "date_started" DATE,
    "due_date" DATE,
    "date_completed" DATE,
    "qty_expected" INTEGER,
    "qty_completed" INTEGER,
    "unit_cost" DECIMAL(10,2),
    "order_type" "public"."job_order_type" NOT NULL,
    "rate" DECIMAL(10,2),
    "total" DECIMAL(10,2),
    "is_paid" BOOLEAN NOT NULL DEFAULT false,
    "payment_mode" "public"."payment_mode",
    "is_due" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "lamination_jobs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."binding_jobs" (
    "id" BIGSERIAL NOT NULL,
    "book_id" BIGINT NOT NULL,
    "partner_id" BIGINT NOT NULL,
    "status" "public"."job_status" NOT NULL,
    "date_sent" DATE,
    "date_started" DATE,
    "due_date" DATE,
    "date_completed" DATE,
    "qty_expected" INTEGER,
    "qty_completed" INTEGER,
    "unit_cost" DECIMAL(10,2),
    "order_type" "public"."job_order_type" NOT NULL,
    "rate" DECIMAL(10,2),
    "total" DECIMAL(10,2),
    "is_paid" BOOLEAN NOT NULL DEFAULT false,
    "payment_mode" "public"."payment_mode",
    "is_due" BOOLEAN NOT NULL DEFAULT false,
    "notes" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "binding_jobs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."homepage_trending" (
    "id" BIGSERIAL NOT NULL,
    "book_id" BIGINT NOT NULL,
    "position" INTEGER NOT NULL,
    "starts_at" TIMESTAMP(3),
    "ends_at" TIMESTAMP(3),
    "created_by" BIGINT,
    "note" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "homepage_trending_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."homepage_upcoming" (
    "id" BIGSERIAL NOT NULL,
    "book_id" BIGINT NOT NULL,
    "expected_release_date" DATE,
    "preorder_enabled" BOOLEAN NOT NULL DEFAULT false,
    "position" INTEGER NOT NULL,
    "display_from" TIMESTAMP(3),
    "display_to" TIMESTAMP(3),
    "created_by" BIGINT,
    "note" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "homepage_upcoming_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."discounts" (
    "id" BIGSERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "code_required" BOOLEAN NOT NULL DEFAULT false,
    "target" "public"."discount_target" NOT NULL,
    "discount_type" "public"."discount_type" NOT NULL,
    "amount" DECIMAL(10,2) NOT NULL,
    "max_discount_amount" DECIMAL(10,2),
    "min_order_value" DECIMAL(10,2),
    "min_items_qty" INTEGER,
    "first_order_only" BOOLEAN NOT NULL DEFAULT false,
    "is_exclusive" BOOLEAN NOT NULL DEFAULT false,
    "once_per_order" BOOLEAN NOT NULL DEFAULT false,
    "starts_at" TIMESTAMP(3),
    "ends_at" TIMESTAMP(3),
    "usage_limit_total" INTEGER,
    "usage_limit_per_customer" INTEGER,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_by" BIGINT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "discounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."discount_codes" (
    "id" BIGSERIAL NOT NULL,
    "discount_id" BIGINT NOT NULL,
    "code" TEXT NOT NULL,
    "max_redemptions" INTEGER,
    "starts_at" TIMESTAMP(3),
    "ends_at" TIMESTAMP(3),
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "discount_codes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."discount_books" (
    "discount_id" BIGINT NOT NULL,
    "book_id" BIGINT NOT NULL,

    CONSTRAINT "discount_books_pkey" PRIMARY KEY ("discount_id","book_id")
);

-- CreateTable
CREATE TABLE "public"."discount_categories" (
    "discount_id" BIGINT NOT NULL,
    "category_id" BIGINT NOT NULL,

    CONSTRAINT "discount_categories_pkey" PRIMARY KEY ("discount_id","category_id")
);

-- CreateTable
CREATE TABLE "public"."discount_payment_modes" (
    "discount_id" BIGINT NOT NULL,
    "payment_mode" "public"."payment_mode" NOT NULL,

    CONSTRAINT "discount_payment_modes_pkey" PRIMARY KEY ("discount_id","payment_mode")
);

-- CreateTable
CREATE TABLE "public"."discount_customer_sources" (
    "discount_id" BIGINT NOT NULL,
    "source" "public"."customer_source" NOT NULL,

    CONSTRAINT "discount_customer_sources_pkey" PRIMARY KEY ("discount_id","source")
);

-- CreateTable
CREATE TABLE "public"."order_discounts" (
    "id" BIGSERIAL NOT NULL,
    "order_id" BIGINT NOT NULL,
    "discount_id" BIGINT NOT NULL,
    "discount_code_id" BIGINT,
    "amount_applied" DECIMAL(10,2) NOT NULL,
    "description" TEXT,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "order_discounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."order_item_discounts" (
    "id" BIGSERIAL NOT NULL,
    "order_item_id" BIGINT NOT NULL,
    "discount_id" BIGINT NOT NULL,
    "discount_code_id" BIGINT,
    "amount_applied" DECIMAL(10,2) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "order_item_discounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."discount_redemptions" (
    "id" BIGSERIAL NOT NULL,
    "discount_id" BIGINT NOT NULL,
    "discount_code_id" BIGINT NOT NULL,
    "order_id" BIGINT NOT NULL,
    "customer_id" BIGINT NOT NULL,
    "amount_applied" DECIMAL(10,2) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "discount_redemptions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."cart_discounts" (
    "id" BIGSERIAL NOT NULL,
    "cart_id" BIGINT NOT NULL,
    "discount_id" BIGINT NOT NULL,
    "discount_code_id" BIGINT,
    "amount_estimated" DECIMAL(10,2) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL,

    CONSTRAINT "cart_discounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."v_inventory_on_hand" (
    "book_id" BIGINT NOT NULL,
    "warehouse_id" BIGINT NOT NULL,
    "qty_on_hand" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "public"."v_book_stage_latest" (
    "book_id" BIGINT NOT NULL,
    "stage" "public"."stage" NOT NULL,
    "status" "public"."job_status" NOT NULL,
    "last_event_at" DATE
);

-- CreateIndex
CREATE UNIQUE INDEX "invoices_invoice_no_key" ON "public"."invoices"("invoice_no");

-- CreateIndex
CREATE UNIQUE INDEX "invoices_uuid_key" ON "public"."invoices"("uuid");

-- CreateIndex
CREATE INDEX "invoice_items_invoice_id_idx" ON "public"."invoice_items"("invoice_id");

-- CreateIndex
CREATE INDEX "invoice_items_book_id_idx" ON "public"."invoice_items"("book_id");

-- CreateIndex
CREATE UNIQUE INDEX "discount_codes_code_key" ON "public"."discount_codes"("code");

-- CreateIndex
CREATE INDEX "books_title_idx" ON "public"."books" USING GIN ("title" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "books_isbn_13_idx" ON "public"."books" USING GIN ("isbn_13" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "books_isbn_10_idx" ON "public"."books" USING GIN ("isbn_10" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "books_description_idx" ON "public"."books" USING GIN ("description" gin_trgm_ops);

-- CreateIndex
CREATE INDEX "cart_items_cart_id_idx" ON "public"."cart_items"("cart_id");

-- CreateIndex
CREATE INDEX "cart_items_book_id_idx" ON "public"."cart_items"("book_id");

-- CreateIndex
CREATE UNIQUE INDEX "customers_uuid_key" ON "public"."customers"("uuid");

-- CreateIndex
CREATE INDEX "customers_email_idx" ON "public"."customers"("email");

-- CreateIndex
CREATE INDEX "order_items_order_id_idx" ON "public"."order_items"("order_id");

-- CreateIndex
CREATE INDEX "order_items_book_id_idx" ON "public"."order_items"("book_id");

-- CreateIndex
CREATE UNIQUE INDEX "orders_uuid_key" ON "public"."orders"("uuid");

-- CreateIndex
CREATE INDEX "orders_customer_id_idx" ON "public"."orders"("customer_id");

-- CreateIndex
CREATE INDEX "orders_cart_id_idx" ON "public"."orders"("cart_id");

-- AddForeignKey
ALTER TABLE "public"."customer_interests" ADD CONSTRAINT "customer_interests_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."customer_interests" ADD CONSTRAINT "customer_interests_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."customer_addresses" ADD CONSTRAINT "customer_addresses_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."carts" ADD CONSTRAINT "carts_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."orders" ADD CONSTRAINT "orders_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."invoices" ADD CONSTRAINT "invoices_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."invoices" ADD CONSTRAINT "invoices_billing_address_id_fkey" FOREIGN KEY ("billing_address_id") REFERENCES "public"."addresses"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."invoices" ADD CONSTRAINT "invoices_warehouse_id_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "public"."warehouses"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."invoices" ADD CONSTRAINT "invoices_salesman_id_fkey" FOREIGN KEY ("salesman_id") REFERENCES "public"."staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."invoice_items" ADD CONSTRAINT "invoice_items_invoice_id_fkey" FOREIGN KEY ("invoice_id") REFERENCES "public"."invoices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."invoice_items" ADD CONSTRAINT "invoice_items_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."exam_requests" ADD CONSTRAINT "exam_requests_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."wishlists" ADD CONSTRAINT "wishlists_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."customers"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."reviews" ADD CONSTRAINT "reviews_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."dtp_jobs" ADD CONSTRAINT "dtp_jobs_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."dtp_jobs" ADD CONSTRAINT "dtp_jobs_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "public"."partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."editing_jobs" ADD CONSTRAINT "editing_jobs_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."editing_jobs" ADD CONSTRAINT "editing_jobs_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "public"."partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."proofreading_jobs" ADD CONSTRAINT "proofreading_jobs_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."proofreading_jobs" ADD CONSTRAINT "proofreading_jobs_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "public"."partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."printing_jobs" ADD CONSTRAINT "printing_jobs_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."printing_jobs" ADD CONSTRAINT "printing_jobs_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "public"."partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."cover_design_jobs" ADD CONSTRAINT "cover_design_jobs_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."cover_design_jobs" ADD CONSTRAINT "cover_design_jobs_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "public"."partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."cover_setting_jobs" ADD CONSTRAINT "cover_setting_jobs_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."cover_setting_jobs" ADD CONSTRAINT "cover_setting_jobs_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "public"."partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."lamination_jobs" ADD CONSTRAINT "lamination_jobs_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."lamination_jobs" ADD CONSTRAINT "lamination_jobs_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "public"."partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."binding_jobs" ADD CONSTRAINT "binding_jobs_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."binding_jobs" ADD CONSTRAINT "binding_jobs_partner_id_fkey" FOREIGN KEY ("partner_id") REFERENCES "public"."partners"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."homepage_trending" ADD CONSTRAINT "homepage_trending_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."homepage_trending" ADD CONSTRAINT "homepage_trending_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."homepage_upcoming" ADD CONSTRAINT "homepage_upcoming_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."homepage_upcoming" ADD CONSTRAINT "homepage_upcoming_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discounts" ADD CONSTRAINT "discounts_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "public"."staff"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discount_codes" ADD CONSTRAINT "discount_codes_discount_id_fkey" FOREIGN KEY ("discount_id") REFERENCES "public"."discounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discount_books" ADD CONSTRAINT "discount_books_discount_id_fkey" FOREIGN KEY ("discount_id") REFERENCES "public"."discounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discount_books" ADD CONSTRAINT "discount_books_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discount_categories" ADD CONSTRAINT "discount_categories_discount_id_fkey" FOREIGN KEY ("discount_id") REFERENCES "public"."discounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discount_categories" ADD CONSTRAINT "discount_categories_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discount_payment_modes" ADD CONSTRAINT "discount_payment_modes_discount_id_fkey" FOREIGN KEY ("discount_id") REFERENCES "public"."discounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discount_customer_sources" ADD CONSTRAINT "discount_customer_sources_discount_id_fkey" FOREIGN KEY ("discount_id") REFERENCES "public"."discounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."order_discounts" ADD CONSTRAINT "order_discounts_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."order_discounts" ADD CONSTRAINT "order_discounts_discount_id_fkey" FOREIGN KEY ("discount_id") REFERENCES "public"."discounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."order_discounts" ADD CONSTRAINT "order_discounts_discount_code_id_fkey" FOREIGN KEY ("discount_code_id") REFERENCES "public"."discount_codes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."order_item_discounts" ADD CONSTRAINT "order_item_discounts_order_item_id_fkey" FOREIGN KEY ("order_item_id") REFERENCES "public"."order_items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."order_item_discounts" ADD CONSTRAINT "order_item_discounts_discount_id_fkey" FOREIGN KEY ("discount_id") REFERENCES "public"."discounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."order_item_discounts" ADD CONSTRAINT "order_item_discounts_discount_code_id_fkey" FOREIGN KEY ("discount_code_id") REFERENCES "public"."discount_codes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discount_redemptions" ADD CONSTRAINT "discount_redemptions_discount_id_fkey" FOREIGN KEY ("discount_id") REFERENCES "public"."discounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discount_redemptions" ADD CONSTRAINT "discount_redemptions_discount_code_id_fkey" FOREIGN KEY ("discount_code_id") REFERENCES "public"."discount_codes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discount_redemptions" ADD CONSTRAINT "discount_redemptions_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."discount_redemptions" ADD CONSTRAINT "discount_redemptions_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "public"."customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."cart_discounts" ADD CONSTRAINT "cart_discounts_cart_id_fkey" FOREIGN KEY ("cart_id") REFERENCES "public"."carts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."cart_discounts" ADD CONSTRAINT "cart_discounts_discount_id_fkey" FOREIGN KEY ("discount_id") REFERENCES "public"."discounts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."cart_discounts" ADD CONSTRAINT "cart_discounts_discount_code_id_fkey" FOREIGN KEY ("discount_code_id") REFERENCES "public"."discount_codes"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."v_inventory_on_hand" ADD CONSTRAINT "v_inventory_on_hand_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."v_inventory_on_hand" ADD CONSTRAINT "v_inventory_on_hand_warehouse_id_fkey" FOREIGN KEY ("warehouse_id") REFERENCES "public"."warehouses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."v_book_stage_latest" ADD CONSTRAINT "v_book_stage_latest_book_id_fkey" FOREIGN KEY ("book_id") REFERENCES "public"."books"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
