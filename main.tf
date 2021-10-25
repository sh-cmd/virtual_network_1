module "demo_rg" {
    source = "./modules/resounce_group"
    rg_name = var.rg_name
    location = var.location
}
module "demo_vn" {
    source = "./modules/virtual_network"
    location = var.location
    rg_name = var.rg_name
    sn_be_cidr = var.sn_be_cidr
    sn_fe_cidr = var.sn_fe_cidr
    sn_be_name = var.sn_be_name
    sn_fe_name = var.sn_fe_name
    vn_cidr = var.vn_cidr
    vn_name = var.vn_name
    depends_on = [
      module.demo_rg,
    ]
}
module "vm1" {
    source = "./modules/virtual_machine"
    location = var.location
    rg_name = var.rg_name
    vm_name = var.vm_name
    vm_size = var.vm_size
    vm_interface_name = var.vm_interface_name  
    subnet_be_id = "${module.demo_vn.subnet_be_id}"
}
module "security_group_backend" {
    source = "./modules/security_group"
    sg_name = var.sg_name
    location = var.location
    rg_name = var.rg_name
    subnet_be_id = "${module.demo_vn.subnet_be_id}"
}