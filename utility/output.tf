# output "out_inst_supported" {
#     value = [for t in data.aws_ec2_instance_type_offerings.my_inst_type1 : t.instance_types]
# }

# Second Ouput

output "supported_aZs_v2" {
    value = keys({
        for az, details in data.aws_ec2_instance_type_offerings.my_inst_type1: az => details.instance_types 
        if length(details.instance_types) != 0
    })
  
}