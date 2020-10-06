-- 001_private_schema.sql

-- private schema for non-public objects
create schema "private";
comment on schema private is 'Private schema for non-public objects that should not be exposed through the GraphQL API.';

-- loads the "pgcrypto" extension in both schemas
create extension if not exists "pgcrypto" schema "public";
create extension if not exists "pgcrypto" schema "private";

-- private "login_credentials" table for user login info
create table private.login_credentials (
    "user_id" integer primary key references public.users("id") on delete cascade,
    "email" text not null unique check (email ~* '^.+@.+\..+$'),
    "password_hash" text not null
);

create index "login_credentials_email" on private.login_credentials using btree ("email");

comment on table private.login_credentials is 'Holds the email address and password_hash for a user account. 1-to-1 relation to the public.users table.';

-- Function for creating user accounts
create function public.register_user(
    "name" text,
    "email" text,
    "password" text
) returns public.users as $$
declare
    "user" public.users;
begin
    insert into public.users ("name")
        values ("name")
        returning * into "user";

    insert into private.login_credentials ("user_id", "email", "password_hash")
        values ("user"."id", "email", crypt("password", gen_salt('bf')));

  return "user";
end;
$$ language plpgsql strict security definer;

comment on function public.register_user(text, text, text) is 'Creates a user account in the users table and associates a login_credentials record with the user. Allows the user to log in using an email/password combination.';
