-- Seed companies and products
insert into companies (id,name,type,parent_id) values ('GAPARK','GAPARK','main',null) on conflict (id) do nothing;
insert into companies (id,name,type,parent_id) values ('CENTIMO','CENTIMO','financial_hub','GAPARK') on conflict (id) do nothing;
insert into companies (id,name,type,parent_id) values ('ARK','ARK','sub','GAPARK') on conflict (id) do nothing;
insert into companies (id,name,type,parent_id) values ('HULAMCO','HULAMCO','sub','GAPARK') on conflict (id) do nothing;
-- products
insert into products (id,company_id,name,slug,commission_levels,commission_depth,allocations,assistance_types) values
('ARK-DP','ARK','ARK Daily Subscription','ark-daily', array[10,5,3], 3, '{"assistance":0.5,"growth":0.3,"ops":0.2}'::jsonb, 'general') on conflict (id) do nothing;
insert into products (id,company_id,name,slug,commission_levels,commission_depth,allocations,assistance_types) values
('HLM-CASH','HULAMCO','Cash Loan Product','hulamco-cash', array[12,5,3], 3, '{"assistance":0.4,"growth":0.3,"ops":0.3}'::jsonb, 'financial') on conflict (id) do nothing;
insert into products (id,company_id,name,slug,commission_levels,commission_depth,allocations,assistance_types) values
('HLM-TRANS','HULAMCO','Transportation Financing','hulamco-trans', array[10,4,2], 3, '{"assistance":0.3,"growth":0.4,"ops":0.3}'::jsonb, 'transportation') on conflict (id) do nothing;
insert into products (id,company_id,name,slug,commission_levels,commission_depth,allocations,assistance_types) values
('CENT-FUND','CENTIMO','CENTIMO Growth Fund','cent-fund', array[]::int[], 0, '{"reserve":1.0}'::jsonb, '') on conflict (id) do nothing;
