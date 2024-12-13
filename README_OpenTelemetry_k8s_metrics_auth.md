# Monitoring Kubernetes Application via Open Telemetry Collector
Reference Documentation: https://opentelemetry.io/docs/

# 1. Install Prometheus on Minikube Cluster

    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts 
    helm repo update
    helm  upgrade --install my-prometheus prometheus-community/prometheus -f prom_auth.yaml


# 2. Install Grafana on Minikube cluster:    
Please refer the below page to install Prometheus on Cluster: 

    helm repo add grafana https://grafana.github.io/helm-charts
    helm install grafana grafana/grafana


# 3. Install OpenTelemetry Agent on Minikube cluster:    

    kubectl apply -f otel_k8s_config_auth.yaml

# 4. Validate the Data(Metrics) on Grafana

Metrics Validation:
To Search all of the time series data points grouping by job  

        count({__name__=~".+"}) by (job)