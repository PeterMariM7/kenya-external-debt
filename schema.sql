CREATE SCHEMA IF NOT EXISTS "Kenya_Debt";

CREATE TABLE "Kenya_Debt".kenya_external_debt (
    year TEXT,
    debt NUMERIC,
    country_name TEXT
);
