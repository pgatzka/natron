create table recipe
(
    id          uuid                     not null primary key default gen_random_uuid(),
    created_at  timestamp with time zone not null             default now(),
    updated_at  timestamp with time zone not null             default now(),
    account_id  uuid                     not null references account (id) on delete cascade,
    name        varchar(255)             not null,
    description text,
    servings    int                      not null,
    check ( servings > 0 )
);
