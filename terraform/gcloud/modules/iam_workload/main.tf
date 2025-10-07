# https://zenn.dev/cloud_ace/articles/7fe428ac4f25c8
locals {
  project_id        = var.PROJECT_ID
  github_repo_owner = "FlutterKaigi"
  github_repo_name  = "2025"
}

resource "google_iam_workload_identity_pool" "main" {
  workload_identity_pool_id = "github"
  display_name              = "GitHub"
  description               = "GitHub Actions 用 Workload Identity Pool"
  disabled                  = false
  project                   = local.project_id
}

resource "google_iam_workload_identity_pool_provider" "main" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.main.workload_identity_pool_id
  workload_identity_pool_provider_id = "github"
  display_name                       = "GitHub"
  description                        = "GitHub Actions 用 Workload Identity Poolプロバイダ"
  disabled                           = false
  attribute_condition                = "assertion.repository_owner == \"${local.github_repo_owner}\""
  attribute_mapping = {
    "google.subject" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
  project = local.project_id
}

resource "google_service_account_iam_member" "workload_identity_sa_iam" {
  service_account_id = google_service_account.main.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principal://iam.googleapis.com/${google_iam_workload_identity_pool.main.name}/subject/${local.github_repo_owner}/${local.github_repo_name}"
}
