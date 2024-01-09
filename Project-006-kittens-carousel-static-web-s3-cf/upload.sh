#! /bin/bash
folder=/f/github/MyProject/Project-006-kittens-carousel-static-web-s3-cf/static-web
bucket_name=$(aws s3api list-buckets --query 'Buckets[].{Name: Name, CreationDate: CreationDate}' --output text | sort | tail -1 | awk -F' ' '{print $2}')
aws s3 cp $folder/index.html s3://$bucket_name
echo "index.html was uploaded"
aws s3 cp $folder/cat0.jpg s3://$bucket_name
aws s3 cp $folder/cat1.jpg s3://$bucket_name
aws s3 cp $folder/cat2.jpg s3://$bucket_name
echo "All cat images were uploaded"
aws s3 ls s3://$bucket_name
