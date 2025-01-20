#!/bin/bash

# Configuración de AWS CloudWatch y GuardDuty
echo "Configurando monitoreo en AWS..."

# Activar CloudWatch
aws logs create-log-group --log-group-name /aws/ec2/wordpress
aws logs create-log-stream --log-group-name /aws/ec2/wordpress --log-stream-name wordpress-log-stream

# Activar GuardDuty
aws guardduty create-detector --enable
