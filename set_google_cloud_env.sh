export PROJECT=$(gcloud info --format='value(config.project)')
export BUCKET=$PROJECT-helm-repo
export PASSWORD=$(openssl rand -base64 15)
