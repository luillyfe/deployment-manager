# Deployment Manager: A basic server in GO!
This guide shows how to deploy a very tiny, very small Server in go. 
Just one file (OK just two, but you totally can pass all the properties defined in .properties file via manual input).

## Deploying to Google Cloud
```bash
  gcloud deployment-manager deployments create qs-example \
    --template deployment.jinja \
    --properties $(cat '.properties' | tr '\n' ',') \
    --preview
```

## About the repo
I cannot stress this enough but the only files you need for the deployment to work are: ´.properties´ 
and ´deployment.jinja´. The rest of the files are already included in the startup-script property
of the deployment.jinja file.
```yaml
.properties       #key=value pair configs about deployment
deployment.jinja  #Collections of resources to be deployed
goweb.service     #Instructins for debian OS to start our service
main.go           #Our server
startup.sh        #The script is going to run as soon as the machine instance starts
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
