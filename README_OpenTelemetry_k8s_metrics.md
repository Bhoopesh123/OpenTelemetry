# Monitoring System and Node Exporter Metrics via Telemetry Collector
Reference Documentation: https://opentelemetry.io/docs/

# 1. Install Prometheus on Minikube cluster:    
Please refer the below page to install Prometheus on Cluster: 

    helm install prometheus prometheus-community/prometheus -f prometheus.yaml

# 2. Install Grafana on Minikube cluster:    
Please refer the below page to install Prometheus on Cluster: 

    helm repo add grafana https://grafana.github.io/helm-charts
    helm install grafana grafana/grafana

# 3. Install OpenTelemetry Agent on Minikube cluster:    

    kubectl apply -f otel_k8s_config.yaml

# 4. Add the below Dashboard id in Grafana  

To Search all of the time series data points grouping by job  

        count({__name__=~".+"}) by (job)

Add the below dashboards to see the data from Node Exporter and Kube State Metrics exporters.  

    1860
    315
    6417
