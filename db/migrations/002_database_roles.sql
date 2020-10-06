-- 002_database_roles.sql

-- Anonymous "reader" role
create role gripedotdev_anonymous;
grant gripedotdev_anonymous to gripedotdev;
comment on role gripedotdev_anonymous is 'Role for readonly access to public objects.';

-- Role granted to logged in users
create role gripedotdev_user;
grant gripedotdev_user to gripedotdev;
comment on role gripedotdev_user is 'Role for read/write access to public objects owned by the currently logged in user.';

-- Token used to pass information for authenticated users.
create type public.jwt_token as (
    "role" text,
    "user_id" integer,
    "exp" bigint
);

-- Login function
create function public.authenticate(
    "email_address" text,
    "password" text
) returns public.jwt_token as $$
declare
    "account" private.login_credentials;
begin
    select a.* into "account"
        from private.login_credentials as a
        where a."email" = "email_address";

    if "account"."password_hash" = crypt("password", "account"."password_hash") then
        return ('gripedotdev_user', "account"."user_id", extract(epoch from (now() + interval '2 days')))::"public"."jwt_token";
    else
        return null;
    end if;
end;
$$ language plpgsql strict security definer;

comment on function public.authenticate(text, text) is 'Creates a JWT token that will securely identify a user and give them certain permissions. This token expires in 2 days.';

-- Gets the current user
create function public.current_user() returns public.users as $$
    select * from
    public.users
    where users.id = (nullif(current_setting('jwt.claims.user_id', true), '')::integer);
$$ language sql stable;

comment on function public.current_user() is 'Gets the user record identified by the JWT in the HTTP header.';
