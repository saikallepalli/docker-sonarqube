# docker-sonarqube

Sonarqube docker image

`docker-compose pull` or `docker-compose build`

Recover admin password

```mysql
use sonar;

describe users;

update users set crypted_password = '88c991e39bb88b94178123a849606905ebf440f5', salt='6522f3c5007ae910ad690bb1bdbf264a34884c6d' where login = 'admin';
```
