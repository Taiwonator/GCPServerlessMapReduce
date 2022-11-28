GIT_EMAIL='taiwonator77@gmail.com'
GIT_NAME='Michael Taiwo'
BUCKET_NAME='my-cloud-computing-storage-bucket'
MAP='map'
MAPPER_COUNT=1

echo "[booting] 💻 Starting bootstrap process"
git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_NAME
# Removes existing project folder
cd ~
rm -rf GCPServerlessMapReduce/
# Clones latest project files
git clone https://github.com/Taiwonator/GCPServerlessMapReduce.git
cd GCPServerlessMapReduce

echo "[init] 🗑️ Creating storage bucket"
# Deletes previous bucket
gsutil rb -f gs://$BUCKET_NAME 
# Creates storage bucket for ebooks
gsutil mb -l europe-west2 gs://$BUCKET_NAME
echo "[init] 🗑️ Successfully created buckets"

echo "[init] ☁️ Create mapper functions"
# Tries to delete function if already exits
gcloud functions delete $MAP --region europe-west2 --no-user-output-enabled --quiet
# Creates new map function
gcloud functions deploy $MAP \
    --runtime=nodejs16 \
    --region=europe-west2 \
    --source=. \
    --entry-point=map \
    --trigger-bucket=gs://$BUCKET_NAME \
    --allow-unauthenticated \
    --max-instances=$MAPPER_COUNT
echo "[init] ☁️ Successfully created mapper functions"

# echo "[init] Creating pubsub topics"
