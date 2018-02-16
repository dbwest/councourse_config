gcloud iam service-accounts create concourse --display-name concourse
export SA_EMAIL=$(gcloud iam service-accounts list \
    --filter="displayName:concourse" --format='value(email)')
export PROJECT=$(gcloud info --format='value(config.project)')
gcloud projects add-iam-policy-binding $PROJECT \
    --role roles/storage.admin --member serviceAccount:$SA_EMAIL
gcloud iam service-accounts keys create concourse-sa.json \
    --iam-account $SA_EMAIL
