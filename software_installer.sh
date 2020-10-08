#!/bin/bash

# Check whether the user is running the script as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
else

	#
	# Vim, htop, Git, Thunderbird, Python3.8
	#
	
		apt update
		apt install -y vim npm htop git thunderbird python3.8 python3-pip 

		# Download and Install Stoplight Studio
		wget https://github.com/stoplightio/studio/releases/latest/download/stoplight-studio-linux-x86_64.AppImage

		mv stoplight-studio-linux-x86_64.AppImage /bin/stoplight
		chmod +x /bin/stoplight
	
	#
	# MLFlow
	#
		pip3 install mlflow


	#
	# Postman
	#

		# Download
		wget https://dl.pstmn.io/download/latest/linux64

		# Extract the downloaded tar.gz
		tar -xzvf linux64

		# Copy the dir into opt dir
		cp -r Postman /opt/

		# Make a symbolic link into /usr/local/bin such to be able to run Postman via cli
		ln -s /opt/Postman/Postman /usr/local/bin/postman

	#
	# Jetbeans Toolbox
	#

		# Download
		wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.18.7455.tar.gz

		# Extract the tar.gz
		tar -xzvf jetbrains-toolbox-1.18.7455.tar.gz

		# Copy the tar.gz into /opt
		cp -r jetbrains-toolbox-1.18.7455 /opt

		# Make a symbolic link into /usr/local/bin such to be able to run Jetbrains Toolbox via cli
		ln /opt/jetbrains-toolbox-1.18.7455/jetbrains-toolbox /usr/local/bin/jetbrains-toolbox

	#
	# Docker (from https://docs.docker.com/engine/install/ubuntu/)
	#

		# Set up the repository
		apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

		# Add Docker’s official GPG key:
		curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

		# Verify that you now have the key with the fingerprint
		apt-key fingerprint 0EBFCD88
	
		# Set up the stable repository
		add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

		# Install Docker Engine
		apt-get update
 		apt-get install -y docker-ce docker-ce-cli containerd.io

	#
	# Java JDK 15
	#

		# Download the deb package
		#wget https://download.oracle.com/otn-pub/java/jdk/15+36/779bf45e88a44cbd9ea6621d33e33db1/jdk-15_linux-x64_bin.deb
	
		# Install Java JDK 15
		#dpkg -i jdk-15_linux-x64_bin.deb

		# Clean the current directory
		#rm *.tar.gz *.deb

	#
	# Anaconda
	#
	wget https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh
	chomod +x Anaconda3-2020.07-Linux-x86_64.sh
	bash Anaconda3-2020.07-Linux-x86_64.sh
fi
