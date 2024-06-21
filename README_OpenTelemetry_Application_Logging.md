# Application Logging Monitoring System  via OpenTelemetry Collector
Reference Documentation: https://opentelemetry.io/docs/

# 1. Install ElasticSearch and Kibana on Ubuntu Machine:    
Please refer the below page to install Elasticsearch and Kibana on Ubuntu/Linux Box: 

    https://github.com/Bhoopesh123/efk-setup/blob/main/README_ELK_Ubuntu.md

# 2. Install Fluent-bit on Ubuntu Machine:  

    sudo sh -c 'curl https://packages.fluentbit.io/fluentbit.key | gpg --dearmor > /usr/share/keyrings/fluentbit-keyring.gpg'
    export CODENAME="jammy"
    echo "deb [signed-by=/usr/share/keyrings/fluentbit-keyring.gpg] https://packages.fluentbit.io/ubuntu/$CODENAME/ \$CODENAME main" | sudo tee /etc/apt/sources.list.d/fluentbit.list
    sudo apt-get update
    sudo apt-get install fluent-bit
    sudo systemctl start fluent-bit
    sudo systemctl status fluent-bit

    cd /etc/fluent-bit

Paste the contents from "fluent-bit.conf" from this repo to /etc/fluent-bit/fluent-bit.conf

Paste the contents from "filters.lua" from this repo to /etc/fluent-bit/filters.lua

    sudo systemctl status fluent-bit
    sudo systemctl stop fluent-bit
    sudo systemctl start fluent-bit

Check the fluent-bit service logs as below:

    journalctl -u fluent-bit -f

# 3. Install OpenTelemetry Collector Agent on Ubuntu Machine:  

Please run the below commands to install Otel Collector for receiving the metrics

    wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.88.0/otelcol-contrib_0.88.0_linux_amd64.deb
    sudo dpkg -i otelcol-contrib_0.88.0_linux_amd64.deb
    sudo cd /etc/otelcol-contrib
    sudo mv config.yaml config_orig.yaml
    sudo vi /etc/otelcol-contrib/config.yaml

    Paste the contents from "otelcol_config_logs.yaml" from this repo to /etc/otelcol-contrib/config.yaml

    Change the ipaddress(localhost) to prometheus server ip address

    sudo systemctl daemon-reload
    sudo service otelcol-contrib stop
    sudo service otelcol-contrib start
    sudo service otelcol-contrib status

Check the otelcol-contrib service logs as below:

    journalctl -u otelcol-contrib -f  

# 4. Check the Logs on Kibana  

    http://localhost:5601/

  
    
