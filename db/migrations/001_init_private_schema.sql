-- 001_init_private_schema.sql

-- private schema for non-public objects
create schema "private";

-- loads the "pgcrypto" extension in both schemas
create extension if not exists "pgcrypto" schema "public";
create extension if not exists "pgcrypto" schema "private";

-- private "login_credentials" table for user login info
create table "private"."login_credentials" (
    "user_id" integer primary key references public.users("id") on delete cascade,
    "email" text not null unique check (email ~* '^.+@.+\..+$'),
    "password_hash" text not null
);
create index "login_credentials_email" on "private"."login_credentials" using btree ("email");

-- Function for creating user accounts
create function "public"."register_user"(
    "name" text,
    "email" text,
    "password" text
) returns "public"."users" as $$
declare
  "user" "public"."users";
begin
  insert into "public"."users" ("name") values
    ("name")
    returning * into "user";

  insert into "private"."login_credentials" ("user_id", "email", "password_hash") values
    ("user"."id", "email", crypt("password", gen_salt('bf')));

  return "user";
end;
$$ language plpgsql strict security definer;

-- TODO:
--  - restrict post/reaction creation to a logged in user
--  - add a username column?
--  - add roles and set default postgraphile role to anonymous role
--  - https://www.graphile.org/postgraphile/postgresql-schema-design/#postgres-roles
