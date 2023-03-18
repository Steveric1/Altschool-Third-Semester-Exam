//assigning the value of the variable declared
vpc_cidr        = "10.2.0.0/16"
public-1A_cidr  = "10.2.1.0/24"
public-1B_cidr  = "10.2.2.0/24"
public-1C_cidr  = "10.2.3.0/24"
private-1A_cidr = "10.2.4.0/24"
private-1B_cidr = "10.2.5.0/24"
private-1C_cidr = "10.2.6.0/24"

//assigning the value for the master instance variable declared
ami           = "ami-0557a15b87f6559cf"
instance_type = "t3.medium"
key_name      = "server"
key_pairs     = "server.pem"

//assigning the value for the worker instance variable declared
# worker_ami           = "ami-005f9685cb30f234b"
# worker_instance_type = "t2.micro"
# worker_key_name      = "server"

//assigning the value for the worker2 instance varaible declared
# worker2_ami           = "ami-005f9685cb30f234b"
# worker2_instance_type = "t2.micro"
# worker2_key_name      = "server"