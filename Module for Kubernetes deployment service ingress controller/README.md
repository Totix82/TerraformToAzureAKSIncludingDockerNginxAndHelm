This module will
Install provider Helm.
Create Nginx ingress controller and ingress service for port 80 and 3306 for MariaDB
Will deploy a MariaDB database as a service. 

File terraform.tfvar will hold Azure Subscription credentials' values and MariaDB credentials' values.
File terraform.tf will hold Azure Subscription variables and MariaDB variables.
File outputs.tf will hold load_balancer_hostname and load_balancer_ip.