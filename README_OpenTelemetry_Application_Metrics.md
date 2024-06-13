# Application Metrics Monitoring System  via OpenTelemetry Collector
Reference Documentation: https://opentelemetry.io/docs/

# 1. Install Prometheus on Ubuntu Machine:    
Please refer the below page to install Prometheus on Ubuntu/Linux Box: 

    https://github.com/Bhoopesh123/Grafana_onprem/blob/main/Prometheus.yml

# 2. Install Grafana on Ubuntu Machine:  
Please refer the below page to install Prometheus on Ubuntu/Linux Box: 

    https://github.com/Bhoopesh123/Grafana_onprem/blob/main/Grafana.yml

# 3. Install Application (Petclinic) on Ubuntu Machine: 
Reference Documentation: https://github.com/spring-projects/spring-petclinic  

Please follow the below commands to install Springboot Application

    git clone https://github.com/spring-projects/spring-petclinic.git
    cd spring-petclinic

Add below dependencies in pom.xml for enabling metrics endpoint 

sudo vi pom.xml

    <!-- Spring and Spring Boot dependencies -->
    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-actuator</artifactId>
    </dependency>

    <dependency>
      <groupId>io.micrometer</groupId>
      <artifactId>micrometer-registry-prometheus</artifactId>
    </dependency>


Add the following configuration to your application.properties file:

    cd spring-petclinic/src/main/resources
    sudo vi application.properties

    management.endpoints.web.exposure.include=*
    management.metrics.export.prometheus.enabled=true

Create the maven package

    ./mvnw package -Dmaven.test.skip=true 

Start the Petclinic Application

    java -jar target/*.jar 

Check the application on port like as below:  

http://localhost:8080


# 4. Install OpenTelemetry Collector Agent on Ubuntu Machine:  

Please run the below commands to install Otel Collector for receiving the metrics

    wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.88.0/otelcol-contrib_0.88.0_linux_amd64.deb
    sudo dpkg -i otelcol-contrib_0.88.0_linux_amd64.deb
    sudo cd /etc/otelcol-contrib
    sudo mv config.yaml config_orig.yaml
    sudo vi /etc/otelcol-contrib/config.yaml

    Paste the contents from "otelcol_config_petclinic.yaml" from this repo to /etc/otelcol-contrib/config.yaml

    Change the ipaddress(localhost) to prometheus server ip address

    sudo systemctl daemon-reload
    sudo service otelcol-contrib stop
    sudo service otelcol-contrib start
    sudo service otelcol-contrib status

# 5. Check the Application metrics on Grafana
To Search all of the time series data points grouping by job  

    count({__name__=~".+"}) by (job)

# 5. Server Requests count for App endpoints
  
    http_server_requests_seconds_count{job="petclinic_otel",status!="200"}
