# invariant

## Description

Given a [command](https://github.com/cypriss/mutations) like:

```ruby
class MyCommand < Mutations::Command
  extend Invariant

  # ...
end
```

Run your commands with invariants that are ensured to be checked:

```ruby
MyCommand.run_with_invariants do |x|
  if x.try(:app_id)
    x.app_id == current_admin.app.id
  end
end
```
