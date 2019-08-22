provider "ibm" {
region = "us-south"
softlayer_api_key = "badb2f4db6b047463c00744bb2104fddf9b6886378a797caa43f1dd856922bb5"
softlayer_username = "IBM1926963"
bluemix_api_key = "oImKWxZqcPUIr7PvPotDhircM-4ozY50uBBXdDmZG5-A"
}
resource "ibm_container_cluster" "cluster" {
  name              = "${var.cluster_name}${random_id.name.hex}"
  datacenter        = "${var.datacenter}"
  no_subnet         = true
  default_pool_size = 1
  machine_type      = "${var.machine_type}"
  isolation         = "${var.isolation}"
  public_vlan_id    = "${var.public_vlan_id}"
  private_vlan_id   = "${var.private_vlan_id}"
}


data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id = "${ibm_container_cluster.cluster.id}"
}

resource "random_id" "name" {
  byte_length = 4
}
