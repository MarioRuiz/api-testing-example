
# This file is following the Request Hash specification:
# https://github.com/MarioRuiz/Request-Hash

# to get any value from this file directly from command line:
# ruby -r "./requests/example_reqres.rb" -e "p Requests::ExampleReqres.create_user._data"

# The responses included in this example are not mandatory to have them but
# they can be used to check if the WS is responding according to them

require "nice_hash"

module Requests
  module ExampleReqres

    # including example of responses in Ruby Hash object
    def self.get_user(id)
      {
        path: "/api/users/#{id}",
        responses: {
          "200": {
            message: "OK",
            data: {
              id: 2,
              first_name: "Janet",
              last_name: "Weaver",
              avatar: "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg",
            },
          },
          "404": {
            message: "Not Found",
          },
        },
      }
    end

    # including example of response 200 in JSON string format
    def self.list_users(page)
      {
        path: "/api/users?page=#{page}",
        responses: {
          '200': {
            message: "OK",
            data: '{
              "page": 2,
              "per_page": 3,
              "total": 12,
              "total_pages": 4,
              "data": [
                  {
                      "id": 4,
                      "first_name": "Eve",
                      "last_name": "Holt",
                      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/marcoramires/128.jpg"
                  },
                  {
                      "id": 5,
                      "first_name": "Charles",
                      "last_name": "Morris",
                      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/stephenmoon/128.jpg"
                  },
                  {
                      "id": 6,
                      "first_name": "Tracey",
                      "last_name": "Ramos",
                      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/bigmancho/128.jpg"
                  }
              ]
            }',
          },
        },

      }
    end

    # example of fixed post data, take in consideration instead, the examples on 
    # create_user_ex1 and create_user_ex2 request hashes
    def self.create_user()
      {
        path: "/api/users",
        data: {
          name: "morpheus",
          job: "leader",
        },
        responses: {
          '201': {
            message: "Created",
            data: {
              name: "morpheus",
              job: "leader",
              id: "440",
              createdAt: "2019-02-08T13:27:08.740Z",
            },
          },
        },
      }
    end

    # to be used instead of create_user, example of 
    # post data using random patterns: nice_hash gem
    def self.create_user_ex1()
      {
        path: "/api/users",
        data: {
          name: :"5-15:Ln", #from 5 to 15 letters and/or numbers
          job: :"leader|developer|tester|accountant", #one of these
        }
      }
    end

    # to be used instead of create_user, example of 
    # post data using random patterns, defaults and wrongs: nice_hash gem
    def self.create_user_ex2()
      {
        path: "/api/users",
        data: {
          name: {pattern: :"5-15:Ln", default: "morpheus", wrong: "^"},
          job: :"leader|developer|tester|accountant",
        }
      }
    end

    def self.update_user(id)
      {
        path: "/api/users#{id}",
        data: {
          name: "morpheus",
          job: "zion resident",
        },
        responses: {
          '200': {
            message: "Updated",
            data: {
              name: "morpheus",
              job: "zion resident",
              updatedAt: "2019-02-08T13:27:08.740Z",
            },
          },
        },

      }
    end

    def self.delete_user(id)
      {
        path: "/api/users/#{id}",
        responses: {
          '204': {message: "OK"},
        },
      }
    end
  end
end
