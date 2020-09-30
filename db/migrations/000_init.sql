-- Adminer 4.7.7 PostgreSQL dump

\connect "gripedotdev";

CREATE SEQUENCE posts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."posts" IF NOT EXISTS (
    "id" integer DEFAULT nextval('posts_id_seq') NOT NULL,
    "content" text NOT NULL,
    "created" timestamp NOT NULL,
    "updated" timestamp NOT NULL,
    "icon" character varying(255) NOT NULL,
    "user_id" integer,
    CONSTRAINT "posts_id" PRIMARY KEY ("id"),
    CONSTRAINT "posts_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE SET NULL NOT DEFERRABLE
) WITH (oids = false);

CREATE TABLE "public"."reactions" IF NOT EXISTS (
    "user_id" integer NOT NULL,
    "post_id" integer NOT NULL,
    "reaction" character varying(255) NOT NULL,
    CONSTRAINT "reactions_post_id_fkey" FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE NOT DEFERRABLE,
    CONSTRAINT "reactions_user_id_fkey" FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "reactions_post_id" ON "public"."reactions" USING btree ("post_id");

CREATE INDEX "reactions_user_id" ON "public"."reactions" USING btree ("user_id");

CREATE SEQUENCE users_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."users" IF NOT EXISTS (
    "id" integer DEFAULT nextval('users_id_seq') NOT NULL,
    "name" text NOT NULL,
    "info" json NOT NULL,
    CONSTRAINT "users_id" PRIMARY KEY ("id")
) WITH (oids = false);
