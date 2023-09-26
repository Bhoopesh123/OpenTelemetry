# Monitoring Microservices application using OpenTelemetry 
Reference Documentation: https://opentelemetry.io/docs/

# 1. Install and Configure Microservices Application:  

    cd opentelemetry-app
    kubectl create namespace otel-demo
    kubectl apply -f .

# 2. Install and Configure Open Telemetry Collector:  

This will collect traces from application and captures at the collector port.

    cd opentelemetry-collector
    kubectl apply -f .

# 3. Install and Configure Jaeger:  

    cd jaeger
    kubectl apply -f .

# 4. Install and Configure Prometheus:  

    cd prometheus
    kubectl apply -f .

# 5. Install and Configure Grafana:  

    cd grafana
    kubectl apply -f .