source delete_functions

echo "[functions] Deploying mapper functions"
gcloud functions deploy map \
--gen2 \
--runtime=nodejs16 \
--region=eu-west-2 \
--source=. \
--entry-point=src/functions/map \
--trigger-http \
--allow-unauthenticated

echo "[functions] Deploying reducer functions"
gcloud functions deploy reduce \
--gen2 \
--runtime=nodejs16 \
--region=eu-west-2 \
--source=. \
--entry-point=src/functions/reduce \
--trigger-http \
--allow-unauthenticated