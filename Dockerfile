# docker build --network=host -t natron .
# docker run -p 8080:8080 --env-file .env -v natron_logs:/app/logs natron

FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app

COPY .mvn/ .mvn/
COPY mvnw pom.xml ./

RUN --mount=type=cache,target=/root/.m2 \
    ./mvnw dependency:go-offline -q

COPY src/ src/

RUN --mount=type=cache,target=/root/.m2 \
    --mount=type=cache,target=/root/.vaadin \
    ./mvnw clean package -Pproduction -DskipTests -q

# ---- Runtime Stage ----
FROM eclipse-temurin:21-jre

WORKDIR /app

RUN groupadd -r spring && useradd -r -g spring spring
USER spring

COPY --from=builder /app/target/natron-*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]