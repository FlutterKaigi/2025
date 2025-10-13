module "cloud_platform" {
  source = "../../module/cloud_platform"

  env       = local.env
  env_short = local.env_short
}

module "firebase" {
  source = "../../module/firebase"

  env                 = local.env
  project_id          = module.cloud_platform.project_id
  package_name_suffix = local.package_name_suffix
}


output "project_id" {
  value = module.cloud_platform.project_id
}
