create table step
(
    id          uuid                     not null primary key default gen_random_uuid(),
    created_at  timestamp with time zone not null             default now(),
    updated_at  timestamp with time zone not null             default now(),
    recipe_id   uuid                     not null references recipe (id) on delete cascade,
    position    int                      not null check ( position >= 0 ),
    description text                     not null
);
