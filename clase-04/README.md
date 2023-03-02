```
export AWS_ACCESS_KEY_ID=<your_access_key_id>
export AWS_SECRET_ACCESS_KEY=<your_secret_access_key>
export AWS_REGION=us-east-1
```

# Para crear el stack

`aws cloudformation create-stack --stack-name stack-nicolas-osorio --template-body file://vpc-server-rds.yml --region us-east-1`

# Para esperar la creación del stack
`aws cloudformation wait stack-create-complete --stack-name stack-nicolas-osorio --region us-east-1`

# Para validar que este creado
`aws cloudformation describe-stacks --stack-name stack-nicolas-osorio --region us-east-1`

# Para borrar el stack
`aws cloudformation delete-stack --stack-name stack-nicolas-osorio --region us-east-1`
