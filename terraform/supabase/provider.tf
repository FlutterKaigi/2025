terraform {
  required_version = "1.11.4"
  required_providers {
    # https://registry.terraform.io/providers/supabase/supabase/latest
    supabase = {
      source  = "supabase/supabase"
      version = "1.5.1"
    }
  }
}

provider "supabase" {
  access_token = var.SUPABASE_ACCESS_TOKEN
}
