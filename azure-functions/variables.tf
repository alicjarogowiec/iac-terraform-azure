variable "resource_group_name" {
  type        = string
  description = "Nazwa grupy zasobów"
}

variable "location" {
  type        = string
  description = "Lokalizacja zasobów"
}

variable "storage_account_name" {
  type        = string
  description = "Nazwa konta magazynu"
}

variable "storage_account_tier" {
  type        = string
  description = "Typ konta magazynu"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Typ replikacji konta magazynu"
}

variable "app_service_plan_name" {
  type        = string
  description = "Nazwa planu usługi aplikacji"
}

variable "app_service_plan_sku_name" {
  type        = string
  description = "Nazwa SKU planu usługi aplikacji"
}

variable "function_app_name" {
  type        = string
  description = "Nazwa aplikacji funkcji"
}

variable "function_app_runtime" {
  type        = string
  description = "Wersja środowiska uruchomieniowego aplikacji funkcji"
}

variable "function_app_functions" {
  type        = list(map(string))
  description = "Lista funkcji wraz z ich konfiguracją"
}

variable "storage_account_access_key" {
  type        = string
  description = "Klucz dostępu do konta magazynu"
}
