# README

This is demo of issue with `belongs_to` association based on custom `primary_id`.
In this example we have two models `Parent` and `Child`.
`Child` refers to `Parent` by custom primary id - `external_id`.
The problem is that search by association does not work as expected:
```ruby
parent = Parent.create!.reload
Child.create!(parent: parent)

# This one returns nil (expected - child created above)
Child.find_by(parent: parent)
```

### Steps to reproduce an issue:
```bash
# build and start application
docker-compose up --build --detach
docker-compose exec web rake demo
```
