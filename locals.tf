locals {   
    azure_firewall = { for azure_firewall in var.azure_firewall_list : azure_firewall.name  => azure_firewall }     
}