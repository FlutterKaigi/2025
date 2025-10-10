module "firebase" {
  source = "../../module/firebase"

  env = "staging"
  package_name_suffix = ".stg"
}
