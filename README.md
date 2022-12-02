# README

## What this application does

To create a realtime search box, where users search articles, and then to have analytics that display what users were searching for.

Your goal is to record their input in realtime and ultimately display analytics & trends on what people are searching for the most. (this is not about search itself, but really about analytics behind it)

It’s per user - so don't blend other users data

Don’t worry too much about populating it with articles, we only really care about the search, and search analytics. We don’t care how good your search engine is, but rather how good your algorithm for figuring out what people searched for.


## Development

To install project:
1) Install Ruby, Rails and gems
2) Setup database

```bash
bundle exec rake db:create
bundle exec rake db:migrate
```

3) Run server

```
bundle exec rails s
```

