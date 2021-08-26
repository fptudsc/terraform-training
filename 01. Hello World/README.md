# Terraform 101

## 1. Init Terraform CLI
```bash
$ terraform init
```
- Result
```
Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v3.49.0...
- Installed hashicorp/aws v3.49.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## 2. Plan
```bash
$ terraform plan
```

- Result
```diff
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.my_vpc will be created
  + resource "aws_vpc" "my_vpc" {
+      + arn                              = (known after apply)
+      + assign_generated_ipv6_cidr_block = false
+      + cidr_block                       = "10.0.0.0/16"
+      + default_network_acl_id           = (known after apply)
+      + default_route_table_id           = (known after apply)
+      + default_security_group_id        = (known after apply)
+      + dhcp_options_id                  = (known after apply)
+      + enable_classiclink               = (known after apply)
+      + enable_classiclink_dns_support   = (known after apply)
+      + enable_dns_hostnames             = (known after apply)
+      + enable_dns_support               = true
+      + id                               = (known after apply)
+      + instance_tenancy                 = "default"
+      + ipv6_association_id              = (known after apply)
+      + ipv6_cidr_block                  = (known after apply)
+      + main_route_table_id              = (known after apply)
+      + owner_id                         = (known after apply)
+      + tags_all                         = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.
```

## 3. Apply
```bash
$ terraform apply
```

- Result
```diff
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_vpc.my_vpc will be created
  + resource "aws_vpc" "my_vpc" {
+      + arn                              = (known after apply)
+      + assign_generated_ipv6_cidr_block = false
+      + cidr_block                       = "10.0.0.0/16"
+      + default_network_acl_id           = (known after apply)
+      + default_route_table_id           = (known after apply)
+      + default_security_group_id        = (known after apply)
+      + dhcp_options_id                  = (known after apply)
+      + enable_classiclink               = (known after apply)
+      + enable_classiclink_dns_support   = (known after apply)
+      + enable_dns_hostnames             = (known after apply)
+      + enable_dns_support               = true
+      + id                               = (known after apply)
+      + instance_tenancy                 = "default"
+      + ipv6_association_id              = (known after apply)
+      + ipv6_cidr_block                  = (known after apply)
+      + main_route_table_id              = (known after apply)
+      + owner_id                         = (known after apply)
+      + tags_all                         = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value:
```

- Enter `yes`, then Result:
```
aws_vpc.my_vpc: Creating...
aws_vpc.my_vpc: Creation complete after 2s [id=vpc-0d98a7f1af573435f]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

## 4. Destroy
```bash
$ terraform destroy
```

```diff
aws_vpc.my_vpc: Refreshing state... [id=vpc-0d98a7f1af573435f]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # aws_vpc.my_vpc has been changed
  ~ resource "aws_vpc" "my_vpc" {
        id                               = "vpc-0d98a7f1af573435f"
      + tags                             = {}
        # (15 unchanged attributes hidden)
    }

Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to
undo or respond to these changes.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_vpc.my_vpc will be destroyed
  - resource "aws_vpc" "my_vpc" {
-      - arn                              = "arn:aws:ec2:ap-southeast-1:651382753631:vpc/vpc-0d98a7f1af573435f" -> null
-      - assign_generated_ipv6_cidr_block = false -> null
-      - cidr_block                       = "10.0.0.0/16" -> null
-      - default_network_acl_id           = "acl-09d01d28fc36eed00" -> null
-      - default_route_table_id           = "rtb-0a8500ccf17a31119" -> null
-      - default_security_group_id        = "sg-08fb7b391141f4700" -> null
-      - dhcp_options_id                  = "dopt-7cb5771a" -> null
-      - enable_classiclink               = false -> null
-      - enable_classiclink_dns_support   = false -> null
-      - enable_dns_hostnames             = false -> null
-      - enable_dns_support               = true -> null
-      - id                               = "vpc-0d98a7f1af573435f" -> null
-      - instance_tenancy                 = "default" -> null
-      - main_route_table_id              = "rtb-0a8500ccf17a31119" -> null
-      - owner_id                         = "651382753631" -> null
-      - tags                             = {} -> null
-      - tags_all                         = {} -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value:
```

- Enter `yes`, then Result:
```
aws_vpc.my_vpc: Destroying... [id=vpc-0d98a7f1af573435f]
aws_vpc.my_vpc: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
```