# Use the official elastic-agent Docker image as the base image
FROM docker.elastic.co/beats/elastic-agent:8.8.1

# Set environment variables
ENV FLEET_ENROLL="1" \
    FLEET_INSECURE="true" \
    FLEET_URL="https://2f1fae74578649c795aec020c5a5ce87.fleet.eastus2.azure.elastic-cloud.com:443" \
    FLEET_ENROLLMENT_TOKEN="XzhqQzE0Z0JtczhCRzE0Qm5ZUVI6zElidmt4bUJRSS13V0JzelNaeG1DUQ==" \
    KIBANA_HOST="http://kibana:5601" \
    KIBANA_FLEET_USERNAME="elastic" \
    KIBANA_FLEET_PASSWORD="changeme"

# Copy the YAML file into the Docker image
COPY elastic-agent.yaml /elastic-agent.yaml

# Run the Elastic Agent with the YAML configuration
CMD ["elastic-agent", "run", "-c", "/elastic-agent.yaml"]
