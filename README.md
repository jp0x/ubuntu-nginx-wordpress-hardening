# Ubuntu Server Hardening con Nginx y WordPress en AWS

Este repositorio proporciona una implementación de hardening para un servidor Ubuntu corriendo una AMI de Bitnami con Nginx y WordPress, desplegado en AWS EC2. También incluye herramientas avanzadas de monitoreo como Prometheus y Grafana, así como un sistema de backup y recuperación utilizando AWS.

## Características Principales

1. **Hardening del servidor Ubuntu**:
   - **Configuración de UFW (Firewall)** para permitir solo el tráfico necesario.
   - **Mejora de la configuración de Nginx** con medidas de seguridad como headers adicionales y TLS.
   - **Hardening de SSH** para prevenir accesos no autorizados.

2. **Uso de AMI de Bitnami**:
   - Instalación rápida y optimizada de WordPress y Nginx en EC2 utilizando la AMI preconfigurada de Bitnami.

3. **Monitoreo Avanzado con Prometheus y Grafana**:
   - **Prometheus** para recopilar métricas del sistema (CPU, memoria, disco) y de Nginx.
   - **Grafana** para la visualización de las métricas con dashboards preconfigurados para WordPress y el servidor.
   - **Node Exporter** y **Nginx Exporter** para recopilar métricas del servidor y Nginx.

4. **Backup y Recuperación**:
   - **AWS Backup** para snapshots automáticos de la instancia EC2 y volúmenes asociados.
   - **S3 con versioning habilitado** para almacenamiento de datos críticos.

5. **Monitoreo en la Nube**:
   - **AWS CloudWatch** para métricas adicionales del entorno AWS.
   - **GuardDuty** habilitado para la detección de amenazas en tiempo real.
