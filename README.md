# mysql-client-wait-docker
This docker container offers a SQL CLI for mysql. This container will wait till mysql server is ready

## Examples

docker-compose.yml
```
version: '3'

services:
  mysql:
    image: mysql:5.6
    container_name: mysql
    environment:
      - MYSQL_ROOT_PASSWORD=1234
      - MYSQL_DATABASE=test

  populate:
    image: fmulero/mysql-client-wait-docker
    container_name: populate
    environment:
      - DB_PASSWORD=1234
      - DB_NAME=test
      - DB_HOST=mysql
      - DB_USER=root
    depends_on:
      - mysql
    command: "DROP TABLE IF EXISTS TEST; CREATE TABLE TEST (CREATION_DATE DATETIME(6), MESSAGE LONGTEXT NOT NULL);"

```

## Author
- **[Fran Mulero]**
### Mentions
Based on the job of Michael Ruocco
[flyway-wait-docker]: https://github.com/michaelruocco/flyway-wait-docker