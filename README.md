Name: Matheus Arruda Ferreira de Santana.

## AWS-S3 with Jenkins and Terraform.

### Prerequisites (Install the latest git package, terraform and Jenkins)

#### Install Latest Git Package

- Check if you have git on your machine. To check, first type the key combination Ctrl + Alt + T and execute the command: `git --version`;
- If nothing appears after you execute the above command, install git on your machine. To do that, on the terminal, type the command `sudo apt install git-all`;
- Now, check the install of git by running: `git --version`;
- You need to clone this repository.

#### Install Terraform:

- Go to the terminal and enter the command: `curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -`;
- Then enter the command: `sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"`;
- To install Terraform from the new repository enter the command: `sudo apt install terraform`;
- Now check the install of Terraform by running: `terraform --version`.

#### Install Jenkins:

- To install jenkins, on the terminal enter the following commands:

```
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install jenkins
```

##### Start Jenkins:

- Type the command: `sudo systemctl daemon-reload`;
- After that, you can start jenkins with the command: `sudo systemctl start jenkins`;
- You can check the status of the Jenkins service using the command: `sudo systemctl status jenkins`;

##### Unlock Jenkins:

- To unlock and access jenkins, go to the browser and enter the url: `http://localhost:8080` and waits until unlock jenkins page appears;
- To put the password, on terminal type the command: `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`. This command will print the password at console. Copy the password and paste on the unlock jenkins page and click on continue.
- After unlocking Jenkins, the Customize Jenkins page appears. Click on the "Install suggested plugins" option.
- When the Create First Admin User page appears, specify the details for your administrator user in the respective fields and click Save and Finish. 


### AWS:

#### Create environment variables to store your access key, secret key and key pair name:

- Now, on the terminal enter the following commands to store your AWS credentials:
`export AWS_Access_Key={your-aws-access}`;
`export AWS_Secret_Key={your-aws-secret-key}`;
`export AWS_Region={your-aws-Region}`; 

### Pipeline:

#### Job1 - Build-and-launch:
- Create a new job on Jenkins, put the name "Build-and-launch" for the job and click in the option: Pipeline. On the tab "Advanced Project Options", go to "Definition" and select the option "Pipeline Script from SCM";
- After that, on "SCM" select the option "Git";
- Then paste this link: https://github.com/MatheusSantana95/aws-s3;
- On the option "Branch Specifier (blank for 'any')", type `*/master`;
- On the option "Script Path", type `Build-and-launch/Jenkinsfile`; 
- Finally, click on save.

#### Job2 - Destroy:
- Create a new job on Jenkins, put the name "Launch" for the job and click in the option: Pipeline;
- On the tab "Advanced Project Options", go to "Definition" and select the option "Pipeline Script from SCM";
- After that, on "SCM" select the option "Git";
- Then paste this link: https://github.com/MatheusSantana95/aws-s3;
- On the option "Branch Specifier (blank for 'any')", type `*/master`;
- On the option "Script Path", type `destroy/Jenkinsfile`;
-  Finally, click on save.

#### Building the jobs:

- Go to your jenkins "Dashboard" and select the first job that you´ve created and select the option "Build now".
- Wait until the proccess finish.
- If you receive the message "SUCCESS", your job was build successfully.
- If you received the message "FAILURE", please repeat all the proccess of this tutorial carefully.
- Go to your jenkins "Dashboard" and select the second job that you´ve created and select the option "Build now".
- Wait until the proccess finish.
- If you receive the message "SUCCESS", your job was build successfully.
- If you received the message "FAILURE", please repeat all the proccess of this tutorial carefully.