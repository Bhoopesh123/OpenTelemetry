# Monitoring System and Node Exporter Metrics via Telemetry Collector
Reference Documentation: https://opentelemetry.io/docs/

# 1. OTEL an Overview:   

OpenTelemetry, also known as OTel, is a vendor-neutral open source Observability framework for instrumenting, generating, collecting, and exporting telemetry data such as traces, metrics, and logs.  

As an industry-standard, OpenTelemetry is supported by more than 40 observability vendors, integrated by many libraries, services, and apps, and adopted by numerous end users. 

# 2. What is OpenTelemetry?

OpenTelemetry is:

An Observability framework and toolkit designed to create and manage telemetry data such as traces, metrics, and logs.

Vendor- and tool-agnostic, meaning that it can be used with a broad variety of Observability backends, including open source tools like Jaeger and Prometheus, as well as commercial offerings. 

Not an observability backend like Jaeger, Prometheus, or other commercial vendors. 

Focused on the generation, collection, management, and export of telemetry. A major goal of OpenTelemetry is that you can easily instrument your applications or systems, no matter their language, infrastructure, or runtime environment. The storage and visualization of telemetry is intentionally left to other tools.  

# 3. What is observability?  

Observability is the ability to understand the internal state of a system by examining its outputs. In the context of software, this means being able to understand the internal state of a system by examining its telemetry data, which includes traces, metrics, and logs

# 4. Why OpenTelemetry?  
OpenTelemetry satisfies the need for observability while following two key principles:

You own the data that you generate. There’s no vendor lock-in.
You only have to learn a single set of APIs and conventions.
Both principles combined grant teams and organizations the flexibility they need in today’s modern computing world.

# 5. Collector 

Vendor-agnostic way to receive, process and export telemetry data.

The OpenTelemetry Collector offers a vendor-agnostic implementation of how to receive, process and export telemetry data. 
It removes the need to run, operate, and maintain multiple agents/collectors. 
This works with improved scalability and supports open source observability data formats (e.g. Jaeger, Prometheus, Fluent Bit, etc.) sending to one or more open source or commercial backends. 
The local Collector agent is the default location to which instrumentation libraries export their telemetry data.

# 6. Collector Configuration structure  

The structure of any Collector configuration file consists of four classes of pipeline components that access telemetry data:

Receivers 
Processors 
Exporters 
Connectors 

# 7. Receivers 

Receivers collect telemetry from one or more sources. They can be pull or push based, and may support one or more data sources.  

# 8. Processors 

Processors take the data collected by receivers and modify or transform it before sending it to the exporters. 
Data processing happens according to rules or settings defined for each processor, which might include filtering, dropping, renaming, or recalculating telemetry, among other operations. 
The order of the processors in a pipeline determines the order of the processing operations that the Collector applies to the signal.

# 8. Exporters 

Exporters send data to one or more backends or destinations. Exporters can be pull or push based, and may support one or more data sources.

Each key within the exporters section defines an exporter instance, The key follows the type/name format, where type specifies the exporter type (e.g., otlp, kafka, prometheus), and name (optional) can be appended to provide a unique name for multiple instance of the same type. 

# 9. Connectors 

Connectors join two pipelines, acting as both exporter and receiver. A connector consumes data as an exporter at the end of one pipeline and emits data as a receiver at the beginning of another pipeline. The data consumed and emitted may be of the same type or of different data types. You can use connectors to summarize consumed data, replicate it, or route it.

You can configure one or more connectors using the connectors section of the Collector configuration file. By default, no connectors are configured. Each type of connector is designed to work with one or more pairs of data types and may only be used to connect pipelines accordingly.  

The following example shows the count connector and how it’s configured in the pipelines section. 

# 10. Extensions  

Extensions are optional components that expand the capabilities of the Collector to accomplish tasks not directly involved with processing telemetry data. 

For example, you can add extensions for Collector health monitoring, service discovery, or data forwarding, among others.

# 11. Service section
The service section is used to configure what components are enabled in the Collector based on the configuration found in the receivers, processors, exporters, and extensions sections. If a component is configured, but not defined within the service section, then it’s not enabled.

The service section consists of three subsections:

Extensions
Pipelines
Telemetry

# 12. Other Information 

The use and expansion of environment variables is supported in the Collector configuration. For example to use the values stored on the DB_KEY and OPERATION environment variables you can write the following:  

    processors:
    attributes/example:
        actions:
        - key: ${env:DB_KEY}
            action: ${env:OPERATION}


