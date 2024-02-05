resource "local_file" "inventory_stage" {
  content = templatefile("templates/inventory.yml.tpl",
    {
      app =  module.app.external_ip_address_app
      db  =  module.db.external_ip_address_db
    }
  )
  filename = "../../ansible/environments/stage/inventory.yml"
}

resource "local_file" "inventory_prod" {
  content = templatefile("templates/inventory.yml.tpl",
    {
      app =  module.app.external_ip_address_app
      db  =  module.db.external_ip_address_db
    }
  )
  filename = "../../ansible/environments/prod/inventory.yml"
}
