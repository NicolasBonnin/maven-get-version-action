FROM maven:3.9.9-eclipse-temurin-21-alpine
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
