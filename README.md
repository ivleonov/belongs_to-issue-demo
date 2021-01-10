# README

This is demo of the issue with `belongs_to` association based on custom `primary_id`.
In this example we have two models `Parent` and `Child`.
`Child` refers to `Parent` by custom primary id - `external_id`.

```ruby
# app/models/parent.rb
class Parent < ApplicationRecord
end

# app/models/child.rb
class Child < ApplicationRecord
  self.table_name = 'children'

  belongs_to :parent, class_name: 'Parent', primary_key: 'external_id'
end
```

The problem is that search by association does not work as expected:
```ruby
parent = Parent.create!.reload
Child.create!(parent: parent)

# This one returns nil (expected - child created above)
Child.find_by(parent: parent)
```

### Steps to reproduce the issue:
```bash
git clone git@github.com:ivleonov/belongs_to-issue-demo.git
cd belongs_to-issue-demo
docker-compose up --build --detach
docker-compose exec web rake demo
```
