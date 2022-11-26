echo "[booting] 💻 Starting bootstrap process"

echo "[init] ☁️ Creating cloud functions"
source tasks/deploy_functions.sh

echo "[init] Creating pubsub topics"
