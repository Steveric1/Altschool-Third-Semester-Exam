output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public-1A" {
  value = aws_subnet.public-1A.id
}

output "public-1B" {
  value = aws_subnet.public-1B.id
}

output "public-1C" {
  value = aws_subnet.public-1C.id
}

output "route-table" {
  value = aws_route_table.public.id
}

output "internet-gateway" {
  value = aws_internet_gateway.igw.id
}