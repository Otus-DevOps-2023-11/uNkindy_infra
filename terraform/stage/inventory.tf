resource "local_file" "inventory" {
  content = templatefile("templates/inventory.yml.tpl",
    {
      app =  module.app.external_ip_address_app
      db  =  module.db.external_ip_address_db
    }
  )
  filename = "../../ansible/inventory.yml"
}
