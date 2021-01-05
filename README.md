# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Development Environment

Dependencies:

- ruby 2.7.1 (assuming this was installed with rbenv)
- postgresql 12.1
- node 10.12

```bash
bundle install
yarn install
rake db:create
rake db:migrate
foreman start
```

### Environment Variables

```
ADMIN_USER=alex
ADMIN_PASS=XYZXYZ
NUM_READINGS=6
RANDOMIZED_READINGS=enabled
HIGHLIGHTS=enabled
```

## Testing Environment

To run the unit and integration tests you can use `rake` or `guard`.

```bash
foreman run bundle exec rake
foreman run bundle exec rails test # equivalent
```

Or to run tests after changes to any file

```bash
foreman run bundle exec guard
```

## Contributing

### Single commit

Create a single commit with your changes, then close the issue by copying
the commit hash. For example:

```
Resolved in r4711
```

### Multi commit

Create a pull request and tag the issue that it is resolving in the description.
For example:

```
Fixes #12
```
