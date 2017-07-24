
# sonarqube

## Usage

Setup a database instance if not use embedded H2 database. 

    docker-compose up -d

  http://admin:admin@sonarqube.local:9000

Use with maven

  see: http://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+Maven
  
    mvn sonar:sonar -Dsonar.host.url=http://sonarqube.local:9000
  
Use Embedded H2 database

    mvn sonar:sonar -Dsonar.host.url=http://sonarqube.local:9000 -Dsonar.jdbc.url="jdbc:h2:tcp://sonarqube.local/sonar"

Use Other database

You can link a postgresql (recommended) or mysql database.

Create database for sonarqube on postgresql

see: https://github.com/sameersbn/docker-postgresql/issues/58

`docker exec -it postgresql.local psql -U postgres -c "CREATE DATABASE sonar;"`
`docker exec -it postgresql.local psql -U postgres -c "CREATE USER sonar SUPERUSER PASSWORD 'sonar';"`
`docker exec -it postgresql.local psql -U postgres -c "GRANT ALL PRIVILEGES ON DATABASE sonar TO sonar;"`

or

```
psql -v ON_ERROR_STOP=1 -h postgresql.local --username "user" <<-EOSQL
    CREATE DATABASE sonar;
    CREATE USER sonar SUPERUSER PASSWORD 'sonar';
    GRANT ALL PRIVILEGES ON DATABASE sonar TO sonar;
EOSQL
```

`psql -h postgresql.local -d sonar -U sonar -W`

## References

see: https://hub.docker.com/_/sonarqube/
see: https://github.com/SonarSource/docker-sonarqube/blob/master/recipes.md
