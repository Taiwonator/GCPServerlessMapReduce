BUCKET_NAME='my-cloud-computing-storage-bucket'
MAP='map'
MAPPER_COUNT=1

echo "[booting] 💻 Starting bootstrap process"

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
    --region=eu-west-2 \
    --source=. \
    --entry-point=src/functions/map \
    --trigger-bucket=gs://$BUCKET_NAME \
    --allow-unauthenticated
    --max-instances=$MAPPER_COUNT
echo "[init] ☁️ Successfully created mapper functions"

# echo "[init] Creating pubsub topics"
