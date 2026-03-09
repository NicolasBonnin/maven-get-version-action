FROM maven:3.9.9-eclipse-temurin-25-alpine
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
