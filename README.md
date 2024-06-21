# Construct

Construção de containers e scripts sh para diversos motivos.

## Instructions

```Basic usage
$ TOKEN_REP=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
$ docker build --build-arg TOKEN_REPO="$TOKEN_REP" --tag <repo> .
```

Handle gcloud.

```
$ gloud --version
$ gcloud init
$ gcloud config configurations list
$ gcloud auth application-default login
```

Google Artifacts

```
$ export REGION=us-west4
$ export PROJECT_ID=infinite-maxim-417114
$ gcloud config set project $PROJECT_ID
```

Criando repositório

```
$ gcloud artifacts repositories create hello-repo --repository-format=docker --location=$REGION --description="Docker repository"
$ gcloud artifacts repositories add-iam-policy-binding hello-repo --location=$REGION    --member=serviceAccount:1064480680406-compute@developer.gserviceaccount.com --role="roles/artifactregistry.reader"
$ gcloud auth configure-docker $REGION-docker.pkg.dev
```

Docker: Build, Run e Push para Google Artifacts

```
$ export PATHGA=$REGION-docker.pkg.dev/$PROJECT_ID
$ docker build -t $PATHGA/hello-repo/hello-app:v1 .
$ docker run --rm -p 8080:8080 $PATHGA/hello-repo/hello-app:v1
$ docker push $PATHGA/hello-repo/hello-app:v1
```