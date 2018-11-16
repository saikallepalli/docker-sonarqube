# docker-sonarqube

Sonarqube docker image

## Plugins

see: http://www.sonarplugins.com/

## Usage

Setup a database instance if not use embedded H2 database. 

   `docker-compose pull` or `docker-compose build`
   `docker-compose up -d`

  http://admin:admin@sonarqube:9000


Use with maven

  see: http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+Maven
  
    mvn sonar:sonar -Dsonar.host.url=http://sonarqube:9000


Use Embedded H2 database

    mvn sonar:sonar -Dsonar.host.url=http://sonarqube:9000 -Dsonar.jdbc.url="jdbc:h2:tcp://sonarqube/sonar"


Use Other database

You can link a postgresql (recommended) or mysql database.


Create database for sonarqube on mysql (mariadb not supported)

`docker exec -it mysql56 mysql -u root -proot_pass -e 'CREATE DATABASE IF NOT EXISTS `sonar`; SHOW DATABASES;'`
`docker exec -it mysql56 mysql -u root -proot_pass -e "CREATE USER 'sonar'@'%' IDENTIFIED BY 'sonar';"`
`docker exec -it mysql56 mysql -u root -proot_pass -e "GRANT ALL PRIVILEGES ON sonar.* TO 'sonar'@'%'; FLUSH PRIVILEGES;"`


Recover admin password

```mysql
use sonar;

describe users;

update users set crypted_password = '88c991e39bb88b94178123a849606905ebf440f5', salt='6522f3c5007ae910ad690bb1bdbf264a34884c6d' where login = 'admin';
```


Create database for sonarqube on postgresql

see: https://github.com/sameersbn/docker-postgresql/issues/58

`docker exec -it postgres psql -U postgres -c "CREATE DATABASE sonar;"`
`docker exec -it postgres psql -U postgres -c "CREATE USER sonar SUPERUSER PASSWORD 'sonar';"`
`docker exec -it postgres psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE sonar TO sonar;"`

or

```
psql -v ON_ERROR_STOP=1 -h postgres --username "user" <<-EOSQL
    CREATE DATABASE sonar;
    CREATE USER sonar SUPERUSER PASSWORD 'sonar';
    GRANT ALL PRIVILEGES ON DATABASE sonar TO sonar;
EOSQL
```

`psql -h postgres -d sonar -U sonar -W`


Enable organization support (not works)
organizations feature is developed for SonarCloud and not support for SonarQube
see: https://next.sonarqube.com/sonarqube/web_api/api/organizations/enable_support

    curl -XPOST -u admin:admin "http://sonarqube:9000/api/organizations/enable_support"


## References

see: https://hub.docker.com/_/sonarqube/
see: https://github.com/SonarSource/docker-sonarqube/blob/master/recipes.md
