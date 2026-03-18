create trigger set_updated_at
    before update
    on recipe
    for each row
execute procedure set_updated_at();
