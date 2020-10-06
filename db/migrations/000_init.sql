-- 000_init.sql

-- users table
create sequence "users_id_seq" increment 1 minvalue 1 maxvalue 2147483647 start 1 cache 1;
create table public.users (
    "id" integer primary key default nextval('users_id_seq') not null,
    "name" text not null
);

-- posts table, FK on users table
create sequence "posts_id_seq" increment 1 minvalue 1 maxvalue 2147483647 start 1 cache 1;
create table public.posts (
    "id" integer primary key default nextval('posts_id_seq') not null,
    "content" text not null,
    "created" timestamp not null,
    "icon" character varying(255) not null,
    "user_id" integer references users(id) on delete set null not deferrable
);

create index "posts_user_id" on public.posts using btree ("user_id");

-- reactions table, FKs on users/posts tables
create table public.reactions (
    "user_id" integer not null references users(id) on delete cascade not deferrable,
    "post_id" integer not null references posts(id) on delete cascade not deferrable,
    "reaction" character varying(255) not null,
    constraint "reactions_user_id_post_id_reaction" unique ("user_id", "post_id", "reaction")
);

create index "reactions_post_id" on public.reactions using btree ("post_id");
create index "reactions_user_id" on public.reactions using btree ("user_id");
