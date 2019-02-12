

# you can also instead run in bash: open_api_import ./requests/swagger/uber.yaml -fT

require 'open_api_import'

OpenApiImport.from "./requests/swagger/uber.yaml", name_for_module: :tags_file
