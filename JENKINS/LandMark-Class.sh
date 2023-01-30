	- Jenkins is a very important aspect of DevOps. Jenkins is an open source continuous integration and continuous deployment tool written in Java
	- Platforms where Jenkins can be installed are Linux, windows, MacOS
	- It is a multi-platform tool
	- Jenkins started in 2004 by Oracle. It was called Hudson at the time and the Jenkins community took over the tool in 2011 and it became an open source technology
	- What is Jenks used for? It is used for continuous integration
	- When trying to build a application developers build their code and commit to git.
	- Continuous integration is the ability for Jenkins to connect with all other tools in the CICD pipeline process to help with the CICD process
	- Continuous integration is a development practice where  developers integrate their code into a shared remote repository frequently, preferably several times a day. Each integration is verified by an automated build (including test) to detect integration errors as quickly as possible. 
	- Here all the steps are automated after the code is committed by the developers
	- Continuous delivery 
	- UAT is user acceptance testing
	- Jenkins is configured in such a way that when the developer commits the code to GitHub it ensure that a maven build takes place
	- Maven validates, compiles, test and packages the code
	- The application is first taken to the staging/Testing environment for more testing. Some of the testing are performance, integration, regression and security(Penetration) testing. 
	- So if the package runs well in Dev, we want to run in Pre-prod before moving it to Prod. 
	- Immediately the code is added to GitHub Jenkins triggered a build by connecting with Maven, SonarQube etc
	- Jenkins connects with SonarQube for code quality analysis and connects with Nexus as well
	- Additional testing is performed before code is deployed
	- If testing process is automated then we will achieve continuous deployment
	- If testing is done manually i.e. someone manually giving approval then it is known as continuous delivery and not deployment
	- An example of someone manually approving the testing process ca be the client
	- Internal project in Landmark: In house --> Continuous deployment
	- External projects with clients --> Continuous delivery
	- Difference between continuous deployment and continuous delivery depends on the nature of the applications. Critical projects that usually require robust testing such as government applications have to go through continuous delivery and non-critical applications go through continuous deployment
	- Jenkins comes as community edition (free) and enterprise edition which is not free. Enterprise version is called cloud based version
INSTALLING JENKINS
	- https://www.redhat.com/sysadmin/install-jenkins-rhel8
	- See the above article for steps to install Jenkins
	Prerequisites for installing Jenkins
	 Note: These steps worked at the date of publication and may no longer be accurate. Please review the latest documentation on installing Java for your distribution of Linux. 
	Java needs to be installed and configured on the server on which you want to configure Jenkins. OpenJDK is preferred with Jenkins, but you can also use any other version of Java.
	# yum install java-11-openjdk-devel
	If multiple Java versions are installed on your server, you can specify the default Java version using this command:
	# update-alternatives --config java
	Install the wget tool in your operating system to fetch the Jenkins repository:
	# yum install wget
	Installing Jenkins
	To install Jenkins on to your operating system, follow the latest documentation provided by Jenkins. At the time of writing, you first need to configure yum by adding the Jenkins repository and then import the repository GPG key:
	 wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo#
	 rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
	You can check the presence of the repo using this command:
	# yum repolist
	The following links are for the LTS version for Jenkins. You can also use the latest build.
	When the repository is updated, you need to install Jenkins and start the service. Using the systemctl start command starts the Jenkins service and enabling the service will start it on bootup.
	To check if the Jenkins service is running, use the command:
	# systemctl status jenkins
	You also need to add Jenkins service to run with firewall and add its exception so that it is available to access from the outside world. Finally, we need to reload the firewall service for the changes to take effect.
	# firewall-cmd --add-port=8080/tcp --permanent# firewall-cmd --reload
	To check the firewall status and accessible ports, use the firewall-cmd command:
	# firewall-cmd --list-all
	Now, the Jenkins server will be running on port 8080 for our server.
	Configuring Jenkins
	You can configure the Jenkins service on port 8080 of your system, but Jenkins is temporarily locked with a password present in the  /var/lib/jenkins/secrets/initialAdminPassword file. You can access Jenkins by providing the password after reading the file.
	Image
	
	Remember to open the file with root user permissions as it is not accessible otherwise.
	Install the suggested plugins for Jenkins. They are compatible with most versions, but if you want to do something specific, you can also select and work with the plugins you wish.
	Image
	
	The plugins will take some time to install depending on the connectivity speed, so be patient.
	Create an admin user. Make sure you remember the username and password, as they are the credentials for accessing the Jenkins WebUI.
	Image
	
	Specify if you wish to change the port for your Jenkins. It is preferred to use Jenkins on 8080 port.
	Image
	
	Jenkins setup is complete and it can be accessed with the URL that is configured for it.
	Image
	
	
	From <https://www.redhat.com/sysadmin/install-jenkins-rhel8> 
	
	- My username for Jenkins is Njibrigthain100 and password is Pigeons@2022
	- Jenkins uses plugins
	- Jenkins is used for continuous integration, continuous delivery, continuous monitoring, continuous deployment, continuous security, continuous security and continuous development
	
	INSTALLING NEXUS
	- Create a user called nexus and sudo into that user
	- https://devopscube.com/how-to-install-latest-sonatype-nexus-3-on-linux/
	Sonatype Nexus is one of the best open-source artifact management tools. It is some tool that you cannot avoid in your CI/CD pipeline. It effectively manages deployable artifacts.
	Sonatype Nexus System Requirements
		Minimum 1 VCPU & 2 GB Memory
		Server firewall opened for port 22 & 8081
		OpenJDK 8
		All Nexus processes should run as a non-root nexus user.
	Note: For production setup, please consider minimum production hardware requirements based on the nexus usage and data storage. Check out the official system requirements document for detailed information
	Sonatype Nexus 3 on Linux ec2
	This article guides you to install and configure Sonatype Nexus 3 in a secure way on an ec2 Linux System.
	Note: This was tested on a Redhat machine and it will work on Centos or related Linux flavors as well.
	Step 1: Login to your Linux server and update the yum packages. Also install required utilities.
	sudo yum update -y
sudo yum install wget -y
	Step 2: Install OpenJDK 1.8
	sudo yum install java-1.8.0-openjdk.x86_64 -y
	Step 3: Create a directory named app and cd into the directory.
	sudo mkdir /app && cd /app
	Step 4: Download the latest nexus. You can get the latest download links fo for nexus from here.
	sudo wget -O nexus.tar.gz https://download.sonatype.com/nexus/3/latest-unix.tar.gz
	Untar the downloaded file.
	sudo tar -xvf nexus.tar.gz
	Rename the untared file to nexus.
	sudo mv nexus-3* nexus
	Step 5: As a good security practice, it is not advised to run nexus service with root privileges. So create a new user named nexus to run the nexus service.
	sudo adduser nexus
	Change the ownership of nexus files and nexus data directory to nexus user.
	sudo chmod -R 775 /app/nexus 
	sudo chmod -R 775 /app/sonatype-work 
	sudo chown -R nexus:nexus /app/nexus
sudo chown -R nexus:nexus /app/sonatype-work
	Step 6: Open /app/nexus/bin/nexus.rc file
	sudo vi  /app/nexus/bin/nexus.rc
	Uncomment run_as_user parameter and set it as following.
	run_as_user="nexus"
	Step 7: If you want to change the default nexus data directory, open the nexus properties file and change the data directory -Dkaraf.data parameter to a preferred location as shown below. If you don’t specify anything, by default nexus data directory will be set to /app/sonatype-work/nexus3
	Tip: For production setup, it is is always better to mount the nexus data directory to a separate data disk attached to the server. So that backup and restore can be done easily.
	Create Nexus as a service
	Sudo ln -s /app/nexus/bin/nexus /etc/init.d/nexus 
	Switch to the nexus user and start the nexus service as follows 
	Sudo systemctl start nexus
	Sudo systemctl enable nexus 
	- Sonaqube runs on port 900 so after running all the commands you can do a telnet on the server ip n port 9000
	- So it will look like telnet xxx.xx.xx.xxx  9000 where xxx.xx.xx.xxx is the server IP
	- You can get the server IP by running hostname -I
	- The output should say connected
	

	
	
	
	
	
	
	






























