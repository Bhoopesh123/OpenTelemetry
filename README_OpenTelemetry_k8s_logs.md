# Monitoring Kubernetes Pod Logs via Open Telemetry Collector
Reference Documentation: https://opentelemetry.io/docs/

# 1. Install Prometheus on Minikube cluster:    
Please refer the below page to install Prometheus on Cluster: 

    helm install prometheus prometheus-community/prometheus -f prometheus.yaml

# 2. Install Grafana on Minikube cluster:    
Please refer the below page to install Prometheus on Cluster: 

    helm repo add grafana https://grafana.github.io/helm-charts
    helm install grafana grafana/grafana

# 3. Install OpenTelemetry Agent on Minikube cluster:    

    helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
    helm upgrade --install my-opentelemetry-collector open-telemetry/opentelemetry-collector -f otel_k8s_logs_values.yaml


