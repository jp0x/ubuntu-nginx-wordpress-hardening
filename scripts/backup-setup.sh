#!/bin/bash

# Configuración de AWS Backup y creación de snapshots automáticos
echo "Configurando backup en AWS..."

# Crear un backup de la instancia EC2 y almacenar en S3
INSTANCE_ID=$(aws ec2 describe-instances --query "Reservations[0].Instances[0].InstanceId" --output text)
SNAPSHOT_DESCRIPTION="Backup de WordPress en EC2"
BACKUP_S3_BUCKET="your-s3-bucket-name"  # Cambia por tu nombre de bucket

# Crear snapshot de la instancia EC2
SNAPSHOT_ID=$(aws ec2 create-snapshot --volume-id $(aws ec2 describe-instances --instance-id $INSTANCE_ID --query 'Reservations[].Instances[].BlockDeviceMappings[].Ebs.VolumeId' --output text) --description "$SNAPSHOT_DESCRIPTION" --query 'SnapshotId' --output text)

# Guardar snapshot en S3
aws s3 cp "s3://$BACKUP_S3_BUCKET" "s3://$BACKUP_S3_BUCKET/backup_$SNAPSHOT_ID/"
