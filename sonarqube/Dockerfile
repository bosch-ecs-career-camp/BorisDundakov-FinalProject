FROM sonarqube:latest

# Download the Sonar Prometheus Exporter extension and place it in the plugins directory
ADD https://github.com/SonarQubeCommunity/sonar-prometheus-exporter/releases/download/1.0.0-SNAPSHOT/sonar-prometheus-exporter-1.0.0-SNAPSHOT.jar /opt/sonarqube/extensions/plugins/

# Expose the Prometheus metrics endpoint
EXPOSE 9000
