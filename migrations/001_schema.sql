-- Basic schema for GAPARK system
create extension if not exists pgcrypto;
create table if not exists companies (id text primary key, name text, type text, parent_id text, metadata jsonb, created_at timestamptz default now());
create table if not exists products (id text primary key, company_id text, name text, slug text, commission_levels int[], commission_depth int, allocations jsonb, assistance_types text, created_at timestamptz default now());
create table if not exists users (id uuid primary key default gen_random_uuid(), main_member_code text unique, full_name text, email text unique, phone text, role text default 'client', status text default 'active', public_key text, created_at timestamptz default now());
create table if not exists member_enrollments (id uuid primary key default gen_random_uuid(), member_id uuid references users(id), product_id text references products(id), enrolled_at timestamptz default now(), sponsor_member_id uuid, unique(member_id, product_id));
create table if not exists payments (id uuid primary key default gen_random_uuid(), member_id uuid references users(id), product_id text, agent_id uuid, amount_cents bigint, channel text, status text default 'pending', collection_date date default now(), created_at timestamptz default now());
create table if not exists commissions (id uuid primary key default gen_random_uuid(), payment_id uuid references payments(id), beneficiary_id uuid references users(id), product_id text, level int, amount_cents bigint, created_at timestamptz default now());
create table if not exists forfeitures (id uuid primary key default gen_random_uuid(), product_id text, forfeiture_date date, amount_cents bigint, distributed boolean default false, distribution jsonb, created_at timestamptz default now());
create table if not exists offline_events (id text primary key, device_id text, event_type text, payload jsonb, signature text, synced boolean default false, created_at timestamptz default now());
create table if not exists affiliates (id text primary key, name text, company_id text, types text, contact jsonb, api_key text, created_at timestamptz default now());
create table if not exists audit_log (id uuid primary key default gen_random_uuid(), actor_id uuid, action text, context jsonb, created_at timestamptz default now());
