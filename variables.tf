variable name {
  type        = string
  description = "* name of the Azure Kubernetes Service. Changing this forces a new resource to be created."
}

variable location {
  type        = string
  description = "* location where the resource group should be created. For a list of all Azure locations, please consult this link or run az account list-locations --output table."
}

variable resource_group {
  type        = string
  description = "* name of the resource group in which to create the virtual network."
}

variable kubernetes_version {
  type        = string
  description = "* Vversion of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). NOTE: Upgrading your cluster may take up to 10 minutes per node."
}

variable app {
  type        = string
  description = "Adds a tag with the application name this resource group belogs to."
  default     = ""
}

variable environment {
  type        = string
  description = "environment name. If not specified, this module will use workspace as default value"
  default     = "default"
}

variable  availability_zones {
  type        = list(string)
  description = "list of availability zones in which the cluster should be spread ."
  default = ["1", "2", "3"]
}

variable client_id {
  type        = string
  description = "* client ID for the service principal."
}

variable client_secret {
  type        = string
  description = "* client Secret for the Service Principal."
}

variable node_resource_group {
  type        = string
  description = "name of the Resource Group where the Kubernetes Nodes should exist. Changing this forces a new resource to be created. If empty, this module will generate a friendly name"
  default     = ""
}

variable node_public_ip_enable {
  type        = bool
  description = "should nodes in this Node Pool have a Public IP Address? Defaults to false."
  default     = false
}

variable dns_prefix {
  type        = string
  description = "DNS prefix to append to the cluster"
  default     = ""
}

variable node_pool_name {
  type        = string
  description = "node pool name."
  default     = ""
}

variable node_pool_count {
  type        = number
  description = "number of pool virtual machines to create. Default: 3"
  default     = 3
}

variable node_pool_os_disk_size_gb {
  type        = number
  description = "size of the OS Disk which should be used for each agent in the Node Pool. Changing this forces a new resource to be created. Default: 60"
  default     = 60
}

variable "node_pool_max_pods" {
  type        = number
  description = "maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  default     = 60
}

variable "node_pool_type" {
  type        = string
  description = "type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets."
  default     = "VirtualMachineScaleSets"
}

variable "auto_scaling_enable" {
  type        = bool
  description = "should the Kubernetes Auto Scaler be enabled for this Node Pool? Defaults to false."
  default     = false
}

variable "auto_scaling_min_count" {
  type        = number
  description = "minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100"
  default     = 0
}

variable "auto_scaling_max_count" {
  type        = number
  description = "(maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 100."
  default     = 0
}

variable "kube_dashboard_enabled" {
  type        = bool
  description = "Is the Kubernetes Dashboard enabled?"
  default     = false
}

variable node_pool_vm_size {
  type        = string
  description = "VM Size to create in the default node pool. Default: Standard_DS3_v2"
  default     = "Standard_DS3_v2"
}

variable network_plugin {
  type        = string
  description = "network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created. Defaults to azure"
  default     = "azure"
}

variable network_docker_bridge_cidr {
  type        = string
  description = "IP address (in CIDR notation) used as the Docker bridge IP address on nodes. This is required when network_plugin is set to azure. Changing this forces a new resource to be created. Defaults to 172.17.0.1/16"
  default     = "172.17.0.1/16"
}

variable network_policy {
  type        = string
  description = "Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. This field can only be set when network_plugin is set to azure. Currently supported values are calico and azure. Changing this forces a new resource to be created. Defaults to calico"
  default     = "calico"
}

variable network_load_balancer_sku {
  type        = string
  description = "Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are basic and standard. Defaults to basic."
  default     = "basic"
}

variable rbac_enabled {
  type        = bool
  description = "Is Role Based Access Control Enabled? Changing this forces a new resource to be created. Defaults to true"
  default     = true
}

variable rbac_aad {
  type        = bool
  description = "Use Azure Active Directory as RBAC system. If not client_app_id is provided, this module will try creating an Azure Application for you"
  default     = false
}

variable rbac_aad_admin {
  type        = string
  description = "Default Azure Active Directory user assigned as cluster administrator"
  default     = null
}

variable rbac_aad_client_app_id {
  type        = string
  description = " Client ID of an Azure Active Directory Application. Changing this forces a new resource to be created."
  default     = null
}

variable rbac_aad_server_app_id {
  type        = string
  description = "Server ID of an Azure Active Directory Application. Changing this forces a new resource to be created."
  default     = null
}

variable rbac_aad_server_app_secret {
  type        = string
  description = "Server Secret of an Azure Active Directory Application. Changing this forces a new resource to be created."
  default     = null
}

variable rbac_aad_tenant_id {
  type        = string
  description = "Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used. Changing this forces a new resource to be created."
  default     = null
}

variable linux_admin_username {
  type        = string
  description = "Admin Username for the Cluster. Changing this forces a new resource to be created. Defaults to aks"
  default     = "aks"
}

variable linux_ssh_key {
  type        = string
  description = "*Public SSH Key used to access the cluster. Changing this forces a new resource to be created."
}

variable vnet_nsg_enabled {
  type        = bool
  description = "Adds NSG to the VNET."
  default     = false
}

variable oms_log_analytics_workspace_id {
  type        = string
  description = "The Log Analytics Workspace id where the OMS should store logs."
  default     = null
}

variable api_server_authorized_ip_ranges {
  type        = list(string)
  description = "IP ranges to whitelist for incoming traffic to the masters."
  default     = []
}

variable http_application_routing_enabled {
  type        = bool
  description = "Enables http application routing"
  default     = false
}

variable enable_pod_security_policy {
  type        = bool
  description = "Enables http application routing"
  default     = false
}