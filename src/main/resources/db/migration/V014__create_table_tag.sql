create table tag
(
    id         uuid                     not null primary key default gen_random_uuid(),
    created_at timestamp with time zone not null             default now(),
    updated_at timestamp with time zone not null             default now(),
    recipe_id  uuid                     not null references recipe (id) on delete cascade,
    name       varchar(50)              not null
);
