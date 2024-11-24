# Monitoring Kubernetes Application via Open Telemetry Collector
Reference Documentation: https://opentelemetry.io/docs/

# 1. Install Application on Minikube cluster:    
Please refer the below page to install Prometheus on Cluster: 

    cd app_traces 
    
    kubectl apply -f .

# 2. Install Prometheus Node Exporter on Minikube Cluster

    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts 
    helm repo update
    helm install node-exporter prometheus-community/prometheus-node-exporter


# 3. Install OpenTelemetry Agent on Minikube cluster:    

    helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts  

    helm upgrade --install my-opentelemetry-collector open-telemetry/opentelemetry-collector -f otel_k8s_metrics_logs_traces_values.yaml

# 4. Validate the Data(Metrics Logs Traces) on Grafana Cloud

Metrics Validation:
To Search all of the time series data points grouping by job  

        count({__name__=~".+"}) by (job)