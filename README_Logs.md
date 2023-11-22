# Monitoring Microservices application Logs using OTEL Collector via Docker  

OpeTelemetry Reference Documentation:  
https://opentelemetry.io/docs/  

Loki Receiver Reference Documentation:  
https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/receiver/lokireceiver   


Let’s imagine that you collect metrics and traces with OpenTelemetry collector and your application logs with Promtail. 

And now you want to move the logs collection configuration into the OpenTelemetry Collector along with other signals.  

The Loki receiver component will help you with that. All you need to do is add loki receiver to your OpenTelemetry Collector pipeline and change the current Promtail configuration, so it sends collected logs to the collector instead of Loki.  

Loki receiver will get this data in the Loki format and transform it to OTLP format and send it further through the processing pipeline.  

# 1. Clone the  repository:    

    cd otel-logs/
    docker compose up --force-recreate --remove-orphans --detach

# 2. Verify the Results with the below steps  

Open http://localhost:3000 and go to Explore, choose Loki datasource. 
Select container from the label filter dropdown from the value dropdown. 

You will see the with the new label exporter=OTLP was added. 

Using OpenTelemetry collector as a client of the Promtail allows to ingest loki formatted logs into the collector where they can be transformed to the OTLP format and processed by the collector pipeline. 

If you like you can change the backend and send your logs to another storage.
