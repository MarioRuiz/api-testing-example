# required libraries
require 'nice_http'
require 'nice_hash'
require 'pathname'

# Local defaults
require_relative 'local'

# Global settings
# in case supplied HOST=XXXXX in command line or added to ENV variables
# fex: HOST=mybeautifulhost.amazonws.com
# if not supplied then it will take the values from ./settings/local.rb
ROOT_DIR = Pathname.new(__FILE__).join("..").join("..")
# HOST to test reqres API
REQREST = { host: 'https://reqres.in', 
            headers: {}
          }
# HOST to test Uber API
UBER = { host: ENV['HOST'], 
         headers: { Authorization: "Token #{ENV['UBER_TOKEN']}"}
       }

# the logs will be stored on the name of the file we run and extension .log
NiceHttp.log = :file_run

# Requests
require_relative '../requests/example_reqres'
require_relative '../requests/swagger/uber.yaml'

