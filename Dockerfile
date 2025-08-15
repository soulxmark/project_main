# Step 1: Build the WAR file using Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Step 2: Run the WAR file in Tomcat
FROM tomcat:9.0
COPY --from=build /app/target/project_main.war /usr/local/tomcat/webapps/project_main.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
# Note: Ensure that the WAR file is named 'project_main.war' in the target directory.
# Adjust the WAR file name in the COPY command if necessary.