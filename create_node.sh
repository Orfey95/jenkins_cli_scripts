#!/bin/bash


# Creation Jenkins node

# Variables
username=$1
password=$2
jenkins_url=$3
name=$4
description=$5
remoteFS=$6
numExecutors=$7
host=$8
credentialsId=$9
label=${10}

# Default node xml
echo '<?xml version="1.1" encoding="UTF-8"?>
<slave>
  <name>replace_name</name>
  <description>replace_description</description>
  <remoteFS>replace_remoteFS</remoteFS>
  <numExecutors>replace_numExecutors</numExecutors>
  <mode>NORMAL</mode>
  <retentionStrategy class="hudson.slaves.RetentionStrategy$Always"/>
  <launcher class="hudson.plugins.sshslaves.SSHLauncher" plugin="ssh-slaves@1.31.1">
    <host>replace_host</host>
    <port>22</port>
    <credentialsId>replace_credentialsId</credentialsId>
    <launchTimeoutSeconds>60</launchTimeoutSeconds>
    <maxNumRetries>10</maxNumRetries>
    <retryWaitTime>15</retryWaitTime>
    <sshHostKeyVerificationStrategy class="hudson.plugins.sshslaves.verifiers.ManuallyTrustedKeyVerificationStrategy">
      <requireInitialManualTrust>false</requireInitialManualTrust>
    </sshHostKeyVerificationStrategy>
    <tcpNoDelay>true</tcpNoDelay>
  </launcher>
  <label>replace_label</label>
  <nodeProperties/>
</slave>' > $HOME/node_code

# Node xml configuration
sed -i "s/<name>replace_name/<name>$name/" $HOME/node_code
sed -i "s/<description>replace_description/<description>$description/" $HOME/node_code
sed -i "s!<remoteFS>replace_remoteFS!<remoteFS>$remoteFS!" $HOME/node_code
sed -i "s/<numExecutors>replace_numExecutors/<numExecutors>$numExecutors/" $HOME/node_code
sed -i "s/<host>replace_host/<host>$host/" $HOME/node_code
sed -i "s/<credentialsId>replace_credentialsId/<credentialsId>$credentialsId/" $HOME/node_code
sed -i "s/<label>replace_label/<label>$label/" $HOME/node_code

# Create node
cat $HOME/node_code | java -jar $HOME/jenkins-cli.jar -auth $username:$password -s http://$jenkins_url:8080 create-node

# Remove node xml
rm $HOME/node_code
