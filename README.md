# CronJob_Automation

The Terraform code sets up an automated process on AWS. It first creates a Lambda function using the code from lambda_function.py, granting it permission to execute commands using AWS Systems Manager (SSM). Then, it configures an EventBridge rule to trigger this Lambda function on a schedule defined by a cron expression. This way, your Lambda function's code will be executed automatically at the specified times. In essence, it automates a task to run on your AWS resources on your desired schedule.

![Screenshot 2024-08-08 190329](https://github.com/user-attachments/assets/2f38e9dd-a2c9-466c-afa1-e22a8a8fb206)
![Screenshot 2024-08-08 190337](https://github.com/user-attachments/assets/64056c92-ec07-4610-b24d-3934e299dee6)
![Screenshot 2024-08-08 190357](https://github.com/user-attachments/assets/25e63df2-647a-4931-843d-7d47b10a5eb0)
![Screenshot 2024-08-08 190311](https://github.com/user-attachments/assets/fda0aa06-5c7c-49b1-943e-aa4d01df9daa)
![Screenshot 2024-08-08 190322](https://github.com/user-attachments/assets/65acc05c-afb0-4d67-aa4e-87e9e6afa961)
