# Serverless_template

> Remember, Makefile is always your friend 
```
Create project 
> make setup runtime={使用したい言語} p_name={作成したいプロジェクト名} aws_id={AWSアカウントID} 
``` 

# Select runtime

``` 
Already supported
・aws-python
・aws-python3
・aws-go
・aws-nodejs
・aws-nodejs-typescript (node_modulesの仕様を理解する必要あり) 

Not compatible
・aws-nodejs-ecma-script
・aws-kotlin-jvm-maven
・aws-kotlin-jvm-gradle
・aws-kotlin-nodejs-gradle
・aws-groovy-gradle
・aws-java-maven
・aws-java-gradle
・aws-scala-sbt
・aws-csharp
・aws-fsharp
```