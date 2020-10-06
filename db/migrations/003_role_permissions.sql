-- 003_role_permissions.sql

-- after schema creation and before function creation
alter default privileges revoke execute on functions from public;
grant usage on schema public to gripedotdev_anonymous, gripedotdev_user;

-- Grant query permissions on public.users to anon/user roles
grant select on table public.users to gripedotdev_anonymous, gripedotdev_user;
grant update, delete on table public.users to gripedotdev_user;

-- Grant query permissions on public.posts to anon/user roles
grant select on table public.posts to gripedotdev_anonymous, gripedotdev_user;
grant insert, update, delete on table public.posts to gripedotdev_user;
grant usage on sequence public.posts_id_seq to gripedotdev_user;

-- Grant query permissions on public.reactions to anon/user roles
grant select on table public.reactions to gripedotdev_anonymous, gripedotdev_user;
grant insert, update, delete on table public.reactions to gripedotdev_user;

-- Grant query permissions on public functions to anon/user roles
grant execute on function public.register_user(text, text, text) to gripedotdev_anonymous;
grant execute on function public.authenticate(text, text) to gripedotdev_anonymous, gripedotdev_user;
grant execute on function public.current_user() to gripedotdev_anonymous, gripedotdev_user;

-- Enable row-level security for tables with data owned by specific users
alter table public.users enable row level security;
alter table public.posts enable row level security;
alter table public.reactions enable row level security;

-- All data in public schema can be readable by anyone
create policy select_user on public.users for select using (true);
create policy select_post on public.posts for select using (true);
create policy select_reaction on public.reactions for select using (true);

-- A user is the only person that can update/delete their own user data
-- Insert is omitted because insert on users table is restricted to user registration
create policy update_user on public.users for update to gripedotdev_user
    using ("id" = nullif(current_setting('jwt.claims.user_id', true), '')::integer);

create policy delete_user on public.users for delete to gripedotdev_user
    using ("id" = nullif(current_setting('jwt.claims.user_id', true), '')::integer);

-- A user is the only person that can create/update/delete posts owned by their user ID
create policy insert_post on public.posts for insert to gripedotdev_user
    with check ("user_id" = nullif(current_setting('jwt.claims.user_id', true), '')::integer);

create policy update_post on public.posts for update to gripedotdev_user
    using ("user_id" = nullif(current_setting('jwt.claims.user_id', true), '')::integer);

create policy delete_post on public.posts for delete to gripedotdev_user
    using ("user_id" = nullif(current_setting('jwt.claims.user_id', true), '')::integer);

-- A user is the only person that can create/delete reactions owned by their user ID
-- Update is omitted on reactions table
create policy insert_reaction on public.reactions for insert to gripedotdev_user
    with check ("user_id" = nullif(current_setting('jwt.claims.user_id', true), '')::integer);

create policy update_reaction on public.reactions for update to gripedotdev_user
    using ("user_id" = nullif(current_setting('jwt.claims.user_id', true), '')::integer);

create policy delete_reaction on public.reactions for delete to gripedotdev_user
    using ("user_id" = nullif(current_setting('jwt.claims.user_id', true), '')::integer);
