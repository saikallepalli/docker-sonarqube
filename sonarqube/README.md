
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

## References

see: https://hub.docker.com/_/sonarqube/
see: https://github.com/SonarSource/docker-sonarqube/blob/master/recipes.md
