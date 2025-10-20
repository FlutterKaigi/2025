output "private_key_pem" {
  value     = tls_private_key.alloy_grpc.private_key_pem
  sensitive = true
}

output "cert_request_pem" {
  value     = tls_cert_request.alloy_grpc.cert_request_pem
  sensitive = true
}
