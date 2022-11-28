# GCP Serverless MapReduce
This program uses google cloud's serverless architecture in order to find all the anagrams across x no. books stored in a publuc storage bukcet

## Getting Started
These commands will need to be ran within a GCP project of your choosing.

### Prerequisite
- A GCP project has been set up
- A Firebase project has been set up and linked to project made in GCP
### Installation
1. Open the Google Cloud Shell
2. Create bucket 
   ``` 
   gsutil mb -l europe-west2 gs://<BUCKET_NAME>
   ```
3. Run the following commands to start up your mapper functions (trigger set to bucket upload)
   ```
   gcloud functions delete map --region europe-west2 
   gcloud functions deploy map \
   --runtime=nodejs16 \
   --region=europe-west2 \
   --source=. \
   --entry-point=src/functions/map \
   --trigger-bucket=gs://<BUCKET_NAME> \
   --allow-unauthenticated
   ```



   
<!-- 3. Simiarly, run the following commands to start up your reducer functions
   ```
   reducer commands
   ```
4. Create pubsub topics using the following commands
   ```
   topic commands
   ```
5. Create realtime database

6. Create firebase firestore -->

### Running
1. To start the process, copy the contents from the public bucket into the books folder
   ```
   gsutil -m cp -r gs://coc105-gutenburg-5000books/*.txt gs://<BUCKET_NAME>
   ```