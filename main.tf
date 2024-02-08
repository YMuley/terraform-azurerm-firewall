# --------- firewall ------------
resource "azurerm_firewall" "azure_firewall" {
    for_each            = local.azure_firewall
        name                = each.value.name
        resource_group_name = var.resource_group_output[each.value.resource_group_name].name
        location            = each.value.location == null ? var.default_values.location : each.value.location
        sku_name            = each.value.sku_name
        sku_tier            = each.value.sku_tier
       // firewall_policy_id  = each.value.firewall_policy_name == null ? null : var.azure_firewall_policy_output[each.value.firewall_policy_name].id
        dns_servers         = length(each.value.dns_servers) == 0 ? null : each.value.dns_servers
        private_ip_ranges   = length(each.value.private_ip_ranges)  == 0 ? null :  each.value.private_ip_ranges     
        zones               = length(each.value.zones) == 0 ? null : each.value.zones
        threat_intel_mode   = each.value.threat_intel_mode == null ? "Alert" : each.value.threat_intel_mode

        dynamic "ip_configuration" {
            for_each = each.value.ip_configuration
            content {
                name                 = ip_configuration.value.name
                subnet_id            = var.subnet_output[format("%s/AzureFirewallSubnet",ip_configuration.value.virtual_network_name)].id
                public_ip_address_id = var.public_ip_output[ip_configuration.value.public_ip_name].id
            }
            
        }  

        # dynamic "management_ip_configuration" {
        #     for_each = each.value.management_ip_configuration
        #     content{
        #         name  = management_ip_configuration.value.name
        #         subnet_id  = var.subnet_output[format("%s/AzureFirewallManagementSubnet",management_ip_configuration.value.virtual_network_name)].id  
        #         public_ip_address_id  = var.public_ip_output[management_ip_configuration.value.public_ip_name].id
        #     }            
        # }
        
        # tags                = each.value.tags == null ? var.default_values.tags : each.value.tags

}