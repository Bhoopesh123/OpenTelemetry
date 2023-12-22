# Monitoring System and Node Exporter Metrics via Telemetry Collector
Reference Documentation: https://opentelemetry.io/docs/

# 1. Install Prometheus on Ubuntu Machine:    
Please refer the below page to install Prometheus on Ubuntu/Linux Box: 

    https://github.com/Bhoopesh123/Grafana_onprem/blob/main/Prometheus.yml

# 2. Install Grafana on Ubuntu Machine:  
Please refer the below page to install Prometheus on Ubuntu/Linux Box: 

    https://github.com/Bhoopesh123/Grafana_onprem/blob/main/Grafana.yml

# 3. Install NodeExporter on Ubuntu Machine: 
Please refer the below page to install Prometheus on Ubuntu/Linux Box: 

    https://github.com/Bhoopesh123/Grafana_onprem/blob/main/NodeExporter.yml

# 4. Install OpenTelemetry Collector Agent on Ubuntu Machine:  

Please run the below commands to install Otel Collector for receiving the metrics

    wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.88.0/otelcol-contrib_0.88.0_linux_amd64.deb
    sudo dpkg -i otelcol-contrib_0.88.0_linux_amd64.deb
    sudo cd /etc/otelcol-contrib
    sudo mv config.yaml config_orig.yaml
    sudo vi /etc/otelcol-contrib/config.yaml

    Paste the contents from "otelcol_config.yaml" from this repo to /etc/otelcol-contrib/config.yaml

    Change the ipaddress(localhost) to prometheus server ip address

    sudo systemctl daemon-reload
    sudo service otelcol-contrib stop
    sudo service otelcol-contrib start
    sudo service otelcol-contrib status

# 5. Add the below Dashboard id in Grafana
To Search all of the time series data points grouping by job
        count({__name__=~".+"}) by (job)

    1860
    15983
