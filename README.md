# jenkins-docker
Jenkins server, based on the weekly releases ([jenkinsci/jenkins](https://hub.docker.com/r/jenkinsci/jenkins/)) with pre installed docker and docker-compose. 

### Start jenkins with docker.sock
```
docker run -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock jenkins
```

For more information read the jenkins [documentation](https://hub.docker.com/r/jenkinsci/jenkins/)
