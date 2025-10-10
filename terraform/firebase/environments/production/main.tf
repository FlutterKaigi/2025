module "firebase" {
  source = "../../module/firebase"

  env                 = "production"
  package_name_suffix = ""
}
