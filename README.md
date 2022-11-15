# terraform-3tier-main
Problem Statement:

One virtual network tied in three subnets.  
Each subnet will have one virtual machine.  
First virtual machine -> allow inbound traffic from internet only.  
Second virtual machine -> entertain traffic from first virtual machine only and can reply the same virtual machine again.  
App can connect to database and database can connect to app but database cannot connect to web  

Module  

resourcegroup - creating resourcegroup  
networking - creating azure virtual network and required subnets  
securitygroup - creating network security group, setting desired security rules and associating them to subnets  
compute - creating availability sets, network interfaces and virtual machines  
database - creating database server and database  
