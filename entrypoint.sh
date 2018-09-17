#!bin/sh
./run_synthea -p 10
ls output/fhir
aws s3 ls $S3_BUCKET_PATH
