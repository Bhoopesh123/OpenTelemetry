# Application Metrics Monitoring System  via OpenTelemetry Collector
Reference Documentation: https://opentelemetry.io/docs/

# 1. Install Prometheus on Ubuntu Machine:    
Please refer the below page to install Prometheus on Ubuntu/Linux Box: 

    https://github.com/Bhoopesh123/Grafana_onprem/blob/main/Prometheus.yml

# 2. Install Grafana on Ubuntu Machine:  
Please refer the below page to install Prometheus on Ubuntu/Linux Box: 

    https://github.com/Bhoopesh123/Grafana_onprem/blob/main/Grafana.yml

# 3. Install Zipikn on Ubuntu Machine:  

Reference Documentation: https://zipkin.io/pages/quickstart.html

    brew install zipkin
    # to run in foreground
    zipkin
    # to run in background
    brew services start zipkin

# 4. Install OpenTelemetry Collector Agent on Ubuntu Machine:  

Please run the below commands to install Otel Collector for receiving the metrics

    wget https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.88.0/otelcol-contrib_0.88.0_linux_amd64.deb
    sudo dpkg -i otelcol-contrib_0.88.0_linux_amd64.deb
    sudo cd /etc/otelcol-contrib
    sudo mv config.yaml config_orig.yaml
    sudo vi /etc/otelcol-contrib/config.yaml

    Paste the contents from "otelcol_config_petclinic_traces.yaml" from this repo to /etc/otelcol-contrib/config.yaml

    Change the ipaddress(localhost) to prometheus server ip address

    sudo systemctl daemon-reload
    sudo service otelcol-contrib stop
    sudo service otelcol-contrib start
    sudo service otelcol-contrib status


# 5. Install Application (Petclinic) on Ubuntu Machine: 
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

Download opentelemetry java agent for Auto Instrumentation  
Reference Documentation: 

https://github.com/open-telemetry/opentelemetry-java-instrumentation 

    wget https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar


Set OTEL Agent Environment Variables  

    export OTEL_METRIC_EXPORT_INTERVAL=5000 \
    && export OTEL_EXPORTER_OTLP_METRICS_TEMPORALITY_PREFERENCE=DELTA \
    && export OTEL_EXPORTER_OTLP_METRICS_DEFAULT_HISTOGRAM_AGGREGATION=BASE2_EXPONENTIAL_BUCKET_HISTOGRAM \
    && export OTEL_LOGS_EXPORTER=none \
    && export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4318 \
    && export OTEL_EXPORTER_OTLP_COMPRESSION=gzip \
    && export OTEL_EXPERIMENTAL_EXPORTER_OTLP_RETRY_ENABLED=true \
    && export OTEL_SERVICE_NAME=agent-nr-config \
    && export OTEL_RESOURCE_ATTRIBUTES=service.instance.id=1234 \
    && export OTEL_EXPERIMENTAL_RESOURCE_DISABLED_KEYS=process.command_line,process.command_args \
    && export OTEL_ATTRIBUTE_VALUE_LENGTH_LIMIT=4095 \
    && export OTEL_EXPORTER_OTLP_TRACES_ENDPOINT=http://localhost:4318/v1/traces \
    && export OTEL_TRACES_EXPORTER=otlp

Start the Petclinic Application

    java -javaagent:./opentelemetry-javaagent.jar -Dotel.service.name=petclinic -jar target/*.jar

Check the application on port like as below:  

http://localhost:8080


# 6. Check the Application Traces on Zipkin  

Search All traces on zipkin  

    http://localhost:9411/

# 7. Add Zipkin as a Datasource in Grafana and visuaize the traces
  
    
