create trigger set_updated_at
    before update
    on ingredient
    for each row
execute procedure set_updated_at();
