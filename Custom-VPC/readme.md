A custom VPC (Virtual Private Cloud) is a logically isolated network in AWS where we define our own IP range, subnets, routing, and security.
Main VPC attributes/components
CIDR Block: Defines the IP range, e.g. 10.0.0.0/16
Public Subnets: Used for internet-facing resources such as ALBs or public EC2 instances.
Private Subnets: Used for backend EC2, application servers, and databases that should not be directly accessible from the internet.
Availability Zones: Deploy subnets across at least 2 AZs for high availability.
Internet Gateway (IGW): Provides internet connectivity to resources in public subnets.
NAT Gateway: Allows resources in private subnets to access the internet for updates/downloads without accepting inbound internet connections.
Elastic IP: A NAT Gateway uses an Elastic IP for its public internet-facing address.
Route Tables: Control where network traffic is directed.
Public route: 0.0.0.0/0 → Internet Gateway
Private route: 0.0.0.0/0 → NAT Gateway
Security Groups: Stateful firewall rules applied to resources such as EC2 instances and ALBs.
Network ACLs: Stateless subnet-level traffic controls.
DNS Support: Enables DNS resolution inside the VPC.
VPC Flow Logs: Can record network traffic metadata for troubleshooting and monitoring.