export IMAGE_FAMILY="tf-latest-cu92"
export ZONE="us-west1-b"
export INSTANCE_NAME="kwame-instance"
export INSTANCE_TYPE="n1-standard-8"
gcloud compute instances create $INSTANCE_NAME \
        --zone=$ZONE \
        --image-family=$IMAGE_FAMILY \
        --maintenance-policy=TERMINATE \
        --accelerator="type=nvidia-tesla-v100,count=8" \
        --machine-type=$INSTANCE_TYPE \
        --boot-disk-size=120GB \
        --metadata="install-nvidia-driver=True"

#List all instances
gcloud compute instances list

#View status of instance
gcloud compute instances describe $INSTANCE_NAME

#Accessing new instance
gcloud compute ssh $INSTANCE_NAME

#Stopping instance
gcloud compute instances stop $INSTANCE_NAME