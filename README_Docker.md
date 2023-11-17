# Monitoring Microservices application using OpenTelemetry via Docker
Reference Documentation: https://opentelemetry.io/docs/

# 1. Clone the Demo repository:    

    git clone https://github.com/open-telemetry/opentelemetry-demo.git
    cd opentelemetry-demo/
    docker compose up --force-recreate --remove-orphans --detach

# 2. Verify the web store and Telemetry  
Once the images are built and containers are started you can access:

Web store: http://localhost:8080/  
Grafana: http://localhost:8080/grafana/  
Feature Flags UI: http://localhost:8080/feature/  
Load Generator UI: http://localhost:8080/loadgen/  
Jaeger UI: http://localhost:8080/jaeger/ui/  
