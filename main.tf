provider "restapi" {
  uri                  = "http://127.0.0.1:8080/"
  debug                = true
  write_returns_object = true
}

# This will make information about the user named "John Doe" available by finding him by first name
data "restapi_object" "John" {
  path = "/api/objects"
  search_key = "first"
  search_value = "John"
  depends_on = ["restapi_object.Foo"]
}

# This will ADD the user named "Foo" as a managed resource
resource "restapi_object" "Foo" {
  path = "/api/objects"
  data = "{ \"id\": \"1234\", \"first\": \"Foo\", \"last\": \"Bar\" }"
}

#Congrats to Jane and John! They got married. Give them the same last name by using variable interpolation
resource "restapi_object" "Jane" {
  path = "/api/objects"
  data = "{ \"id\": \"7788\", \"first\": \"Jane\" }"
}
