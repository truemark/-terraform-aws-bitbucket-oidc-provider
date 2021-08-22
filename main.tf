locals {
  url = "https://api.bitbucket.org/2.0/workspaces/${var.workspace_name}/pipelines-config/identity/oidc"
  client_id_list = [
    "ari:cloud:bitbucket::workspace/${var.workspace_uuid}"
  ]
  thumbprint_list = concat(var.additional_thumbprints,
  [
    "a031c46782e6e6c662c2c87c76da9aa62ccabd8e"
  ])
}

resource "aws_iam_openid_connect_provider" "bitbucket" {
  count = var.create_provider ? 1 : 0
  url = local.url
  client_id_list = local.client_id_list
  thumbprint_list = local.thumbprint_list
}