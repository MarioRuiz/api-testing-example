# API testing example

The purpose of this document is to be an easy guide for devs and testers to start testing REST APIs just in minutes.

For the examples we will be testing the [**Uber**](https://api.uber.com) API using a YAML Swagger / Open API file and [**Reqres**](https://reqres.in/) API using a normal Request Hash file.

To generate the Request Hashes from a **Swagger** / **Open API file**, run the file ./utils/import_swagger.rb or use the **open_api_import** command line executable.


# Installation

1. Install Ruby >=2.4. Recommended last 2.5 stable release. To see which version you already have installed: `ruby -v`
    * [Ruby Installation](https://www.ruby-lang.org/en/documentation/installation/)

2. Install the libraries we use by running from root folder:
    ```bash
    bundle install
    ```    
    
# Documentation

## General 
  * [Ruby in 20 minutes](https://www.ruby-lang.org/en/documentation/quickstart/)
  * [Ruby from other languages](https://www.ruby-lang.org/en/documentation/ruby-from-other-languages/)
  * [Ruby Cheat Sheet](https://learnxinyminutes.com/docs/ruby/)

## Libraries
  * [RSpec](http://rspec.info/), [RSpec CheatSheet](https://devhints.io/rspec)
  * [nice_http](https://github.com/MarioRuiz/nice_http)
  * [nice_hash](https://github.com/MarioRuiz/nice_hash)
  * [open_api_import](https://github.com/MarioRuiz/open_api_import)

# Running tests

To run all the tests:
```bash
rspec
```

To run a particular test file:
```bash
rspec ./spec/my_test_spec.rb
```

To run a particular test (example) inside a test file, add the line number where the test is:
```bash
rspec ./spec/my_test_spec.rb:42
```

The default values to set all tests are on `settings` folder. You can pass parameters to overwrite the settings in command line or ENV variables.

```bash
HOST=10.20.30.50 rspec ./spec/my_test_spec.rb
```
