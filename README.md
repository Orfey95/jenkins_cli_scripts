## Create node
List of parametrs:
- username - Jenkins username;
- password - Jenkins password;
- jenkins_url - Jenkins URL;
- name - name of node;
- description - description of node;
- remoteFS - root directory of node;
- numExecutors - number of executors
- host - URL of node;
- credentialsId - id of credentials;
- label - labels of node.

Example:
```
vagrant@ubuntu:~$ bash create_node username 1234 localhost cli_node "my cli node" /home/ubuntu 3 10.20.30.40 test-slave "cli_node ubuntu"
```
