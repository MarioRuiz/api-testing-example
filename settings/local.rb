
# Take in consideration this file is added to .gitignore file so won't be committed

# constants values to be used in case no ENV supplied in command line

# values to access the Uber API supplied on https://developer.uber.com
ENV['HOST'] ||= 'https://api.uber.com'
ENV['UBER_TOKEN'] ||= "The SERVER TOKEN for authenticating"

