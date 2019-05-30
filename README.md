# quizmo
Quiz administration service handling trivia-type questions, responses, contestants, scoring and qualification

Uses GraphQL API serviced by MongoDB data store


# Pre-requisites
- GNUPG
`brew install gnupg`

- RVM
```
https://rvm.io/
# Note: replace `gpg2` with `gpg` in the first command
```

- MongoDB - mongo has CLI client: https://docs.mongodb.com/mongoid/master/tutorials/mongoid-rails/
```
brew install mongodb
```

# Install Packages
Install latest stable Ruby Version
```
rvm install 2.6.3
# Note: in case of error follow the recommendation for PERL setup and re-run
```

Now go the installed ruby
```
rvm list
rvm use 2.6.3
which ruby
ruby --version
```

Confirm gem environment and install app gems
```
gem env
bundle config build.nokogiri --use-system-libraries && bundle install
```

Run tests
`bundle exec rspec`

## Setup dev db
1. Start mongo & seed db
```
brew services start mongodb
rails db:create
rails db:seed
```

2. Start dev server 
`rails s`

3. Use GraphQL in browser - http://localhost:3000/graphiql


## GraphQL Example Queries
```

query {
  questions {
    name
    category {
      name
      rubric {
        name
        unit_score
        pass_deduction
      }
    }
    answers {
      name
      correct
    }
  }
}

mutation {
  createQuestion(
    name: "What crawls, stands and hops all at the same time?", 
    category: "open", 
    answers: [{name: "A dark-billed platypus", correct: true},
    					{name: "Honey badger", correct: true}]
  ) {
    name
    category {
      name
      rubric {
        name
        unit_score
        pass_deduction
      }
    }
    answers {
      name
      correct
    }
  }
}

mutation {
  categoryCreate(
    name: "all-or-nothing", 
    rubric: "openly") {
      name
      rubric {
        name
        unit_score
        pass_deduction
      }
    }
}
```
