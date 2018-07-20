README

# TeamPay


Paying for your team sports and games.

  - Create games
  - Google API auth/login
  - Stripe payments

# New Features!

  - Well, not so much


TODO:
  - Roles: Administrator and Player
  - Email functionality (Payment requests and confirmations/updates)
  - Slack functionality - Nice!
  - Refined features: model validations, Homepage and routes...
  - Heroku?!
  - Test coverage
  - Design 101
  - Design 202
  - UX for beginners, 101

> Main thing it to fix the *TODO* in the code first.


### Tech

Dillinger uses a number of open source projects to work properly:

* [ROR] - Ruby on Rails framework
* [Ruby] - Ruby
* [Google] - Google API
* [Stripe] - Stripe

### Installation

> Install RBENV
> Ruby 2.5.1
> Bundler
> PostgreSQL
> Google API with tokens
> Stripe API with tokens

```sh
$ git clone https://github.com/riaandeklerk/teampay.git
$ bundle install
$ RACK_ENV=development RAILS_ENV=development bundle exec rails db:create
$ RACK_ENV=development RAILS_ENV=development bundle exec rails db:migrate
$ RACK_ENV=development RAILS_ENV=development \
GOOGLE_CLIENT_ID=<id-here> \
GOOGLE_CLIENT_SECRET=<secret-here> \
PUBLISHABLE_KEY=<stripe-pub-key-here> \
SECRET_KEY=<stripe-secrets-here> \
bundle exec rails s
```

For test/Heroku environments...

```sh
$ 
```

For production environments...

```sh
$ 
```


| Plugin | README |
| ------ | ------ |
| Dropbox | [plugins/dropbox/README.md][PlDb] |
| Github | [plugins/github/README.md][PlGh] |
| Google Drive | [plugins/googledrive/README.md][PlGd] |
| OneDrive | [plugins/onedrive/README.md][PlOd] |
| Medium | [plugins/medium/README.md][PlMe] |
| Google Analytics | [plugins/googleanalytics/README.md][PlGa] |


### Development


First Tab:
```sh
$ 
```

#### Kubernetes + Google Cloud

See [KUBERNETES.md](https://github.com/joemccann/dillinger/blob/master/KUBERNETES.md)


License
----

MIT


**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [ruby]: https://www.ruby-lang.org/en/
   [ror]: https://rubyonrails.org/
   [google]: https://console.developers.google.com/
   [stripe]: https://stripe.com/nz
