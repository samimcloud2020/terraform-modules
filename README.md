# terraform-modules



There are 3 possible workarounds depending on your specific scenario in order to solve it:

Case 1
If you have a backup of your AWS S3 terrform.tfstate file you could restored your state backend "s3" {key = "path/to/terraform.tfstate"} 
to an older version. Re try terraform init and validate if it works well.

Case 2
Remove the out-of-sync entry in AWS DynamoDB Table. There will be a LockID entry in the table containing state and expected checksum 
which you should delete and that will be re-generated after re-running terraform init.

IMPORTANT CONSIDERATIONS:

During this process you'll lose the lock state protection, which prevents others from acquiring the lock and 
potentially 2 people could simultaneously be updating the same resources corrupting your state.
Please consider using terraform refresh command (https://www.terraform.io/docs/commands/refresh.html), 
which is used to reconcile the state Terraform knows about (via its state file) with the real-world infrastructure.
This can be used to detect any drift from the last-known state, and to update the state file.
Delete DynamoDB LockID table entry -> Screenshoot:
enter image description here

Case 3
If after a terraform destroy you have manually deleted your AWS S3 terraform.tfstate file and then probably trying 
to spin up a new instance of all the tfstate declared resources, meaning you're working from scratch,
you could just update your AWS S3 terrform.tfstate state backend key "s3" {key = "path/to/terraform.tfstate"} 
to a new one "s3" {key = "new-path/to/terraform.tfstate"}. Retry terraform init and validate that this should works well.
This workaround has the limitation that you haven't really solved the root cause, you're just by-passing the problem using a new key for the S3 tfstate.
