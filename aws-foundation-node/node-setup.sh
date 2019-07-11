#VARIABLES#
AWS_ACCESS_KEY=""
AWS_SECRET_ACCESS_KEY=""
REGION=""

function input_user_access_keys
{
    #Need check-if-exists logic
    echo "Enter the geography where you want to run the instance: us-west-1, us-east-1 etc:"
    read REGION
    echo "Enter your AWS ACCESS KEY"
    read AWS_ACCESS_KEY
    echo "You entered: "$AWS_ACCESS_KEY
    echo "Enter your AWS SECRET ACCESS KEY"
    read AWS_SECRET_ACCESS_KEY
}

function generate_login_keys 
{   
    #Check if they already exist
    mkdir -p "keys/"
    ssh-keygen -N '' -f keys/harmony-foundation
    cp keys/harmony-foundation keys/harmony-foundation.pem
}
function provision_terraform
{   
    echo "Setting up your AWS INSTANCE ..."
    region='aws_region='$REGION
    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY
    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
    terraform apply -var=$region
    terraform output instance_ips
}

input_user_access_keys
generate_login_keys
provision_terraform
