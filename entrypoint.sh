#!bin/sh
./run_synthea -p 10
ls output/fhir
aws configure set region us-east-1
aws s3 ls $S3_BUCKET_PATH
