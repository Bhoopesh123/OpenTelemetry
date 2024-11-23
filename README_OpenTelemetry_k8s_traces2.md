# Monitoring Kubernetes Pod Logs via Open Telemetry Collector
Reference Documentation: https://opentelemetry.io/docs/

# 1. Install Application on Minikube cluster:    
Please refer the below page to install Prometheus on Cluster: 

    cd app_traces
    kubectl apply -f .


# 3. Install OpenTelemetry Agent on Minikube cluster:    

    helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
    helm upgrade --install my-opentelemetry-collector open-telemetry/opentelemetry-collector -f otel_k8s_traces_values.yaml


