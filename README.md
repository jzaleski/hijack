hijack
======

[![Build Status](https://secure.travis-ci.org/jzaleski/hijack.png?branch=master)](http://travis-ci.org/jzaleski/hijack)

Pluggable MUD client written in Ruby

## Supported Games

- Dragonrealms
- Gemstone IV
- PyMUD

## Prerequisites

* `ruby` >= `2.1.10` (or current `jruby`)
* `rbenv` or `rvm`
* `screen`
* An active *DR* or *GSIV* account

## Quickstart

**Clone this repository:**
```bash
git clone git@github.com:jzaleski/hijack.git
```

_(The follow steps asssume you have changed your working directory to "hijack"
and have initialized the repository w/ `rbenv` / `rvm` or equivalent)_

**Install `bundler`:**
```bash
gem install bundler
```

**Install dependencies:**
```bash
bundle install
```

**Run tests to ensure everything is properly bootstrapped:**
```bash
rake test
```

**Connect to a game (_GSIV_ in this example):**
```bash
bin/launch \
  --game=gemstone \
  --bridge=gemstone_prime \
  --account=<your-account-name> \
  --password=<your-password> \
  --character=<your-character-name> \
  --enable-lich-net=true;
```

_(The above can also be put into a configuration file and passed into `launch`
as: `--config-file=<path-to-your-config-file>`)_

## Contributing

1. Fork it ( http://github.com/jzaleski/hijack/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
