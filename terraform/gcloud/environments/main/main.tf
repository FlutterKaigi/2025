module "iam_workload" {
  source = "../../modules/iam_workload"
  PROJECT_ID = "flutterkaigi-2025"
  REGION = "asia-northeast1"
}
