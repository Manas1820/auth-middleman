local typedefs = require "kong.db.schema.typedefs"


local PLUGIN_NAME = "guard"

-- The schema for the plugin
local schema = {
  name = PLUGIN_NAME,
  fields = {
    { protocols = typedefs.protocols_http },
    { consumer = typedefs.no_consumer },
    { config = {
        type = "record",
        fields = {
            { validation_endpoint = typedefs.url({ required = true }) },
            { token_header	= typedefs.header_name{ default = "Authorization", required = true } },
        },
        },
    },
}
}
return schema