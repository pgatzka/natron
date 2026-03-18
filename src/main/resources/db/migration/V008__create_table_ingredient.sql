create table ingredient
(
    id         uuid                     not null primary key default gen_random_uuid(),
    created_at timestamp with time zone not null             default now(),
    updated_at timestamp with time zone not null             default now(),
    recipe_id  uuid                     not null references recipe (id) on delete cascade,
    name       varchar(255)             not null,
    comment    varchar(255),
    unit       unit,
    quantity   decimal(10, 3) check ( quantity >= 0 ),
    check ( (quantity is null and unit is null) or ((quantity is not null and unit is not null)) ),
    unique (recipe_id, name)
);
