-- test_data.sql

\connect "gripedotdev";

INSERT INTO "users" ("id", "name") VALUES
(1,	'Dylan Sheffer'),
(2,	'Austin Schaffer'),
(3,	'Tim Giles'),
(4,	'Blair Stinson');

INSERT INTO "posts" ("id", "content", "created", "icon", "user_id") VALUES
(5,	'my life is nothing but gripes',	'2020-09-30 18:20:08.298457',	'🗿',	3),
(6,	'there has to be a better patching process than:

1) Do work
2) Merge to dev
3) verify it works on dev
4) blindly cherry-pick to staging
5) hope it works once a new staging post happens',	'2020-09-30 18:21:14.502485',	'🤦',	4),
(7,	'New Android continues to disappoint',	'2020-09-30 18:21:41.17065',	'👌',	1),
(8,	'The python tools for VSCode are pretty good, but the linter only runs on the current file when you save the current file, so you can''t refactor things by:

1. Deleting the thing
2. Resolving the errors',	'2020-09-30 18:22:40.871817',	'🕴',	2),
(9,	'Who the fuck thought it would be a good idea to nest all java projects in at minimum 3 folder',	'2020-09-30 18:23:15.462048',	'😡',	4),
(11,	'You can''t run and test firebase locally',	'2020-09-30 18:24:12.071185',	'🙄',	2),
(10,	'My team at work is 1 person work now. Also, all the official work repos are on my personal github

¯\_(ツ)_/¯

That''s not a shrug emote, that''s me carrying the department on my back',	'2020-09-30 18:23:52.553874',	'🤷',	NULL),
(12,	'Working out makes me sore 😡',	'2020-09-30 18:23:15.462048',	'😡',	1);

INSERT INTO "reactions" ("user_id", "post_id", "reaction") VALUES
(1,	7,	'💯'),
(2,	7,	'💯'),
(3,	7,	'💯'),
(4,	7,	'💯'),
(1,	8,	'💯'),
(2,	8,	'💯'),
(3,	8,	'💯'),
(4,	8,	'💯'),
(1,	8,	'🗿'),
(2,	8,	'🗿'),
(3,	8,	'🗿'),
(4,	8,	'🗿');
