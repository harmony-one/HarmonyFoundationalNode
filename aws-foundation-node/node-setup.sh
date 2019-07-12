#VARIABLES#
AWS_ACCESS_KEY=""
AWS_SECRET_ACCESS_KEY=""
REGION=""
INSTANCE_IP=""

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

    #storing it to aws configure to make it easy to destroy 
    echo "" >> ~/.aws/credentials
    echo "[profile harmony-foundational]" >> ~/.aws/credentials
    echo "aws_access_key_id = "$AWS_ACCESS_KEY"#harmony-node" >> ~/.aws/credentials
    echo "aws_secret_access_key ="$AWS_SECRET_ACCESS_KEY"#harmony-node" >> ~/.aws/credentials
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
}

function instance_login
{   
    INSTANCE_IP=${cat instance-ip.txt}
    echo "Your IP is: "$INSTANCE_IP
    ssh -i keys/harmony-foundation.pem ec2-user@$INSTANCE_IP
}

function create
{
   input_user_access_keys
   generate_login_keys 
   provision_terraform
   instance_login  
}

function destroy
{
    terraform destroy 
}

ACTION=$1

if [ -z "$ACTION" ]; then
   ACTION=launch
fi

case $ACTION in
   launch)  
         create ;;
   shutdown)
         destroy ;;
esac

exit 0
