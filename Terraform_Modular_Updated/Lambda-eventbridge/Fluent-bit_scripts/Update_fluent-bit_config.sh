#!/bin/bash

# Backup the original configuration file
cp /etc/fluent-bit/fluent-bit.conf /etc/fluent-bit/fluent-bit.conf.bak

# Update the Flush interval
sed -i 's/flush        1/flush        300/' /etc/fluent-bit/fluent-bit.conf

# Append new INPUT and OUTPUT configurations
cat << EOF >> /etc/fluent-bit/fluent-bit.conf

[INPUT]
    Name          tail
    Path          /var/log/cron.log
    Tag           cron.job.logs
    Refresh_Interval 100
    DB            /var/log/flb_cron_jobs.db
    Mem_Buf_Limit 5MB
    Skip_Long_Lines On
    Parser        cron_log_parser

[INPUT]
    Name          tail
    Path          /var/log/cron.log
    Tag           error.logs
    Refresh_Interval 10
    DB            /var/log/flb_app_logs.db
    Mem_Buf_Limit 5MB
    Skip_Long_Lines On
    Parser        error_log_parser

[OUTPUT]
    Name            cloudwatch_logs
    Match           cron.job.logs
    region          us-east-1
    log_group_name  1851_backend_DEV_CRON_logs
    log_stream_name DEV_cron_logs
    auto_create_group true
    log_retention_days 30

[OUTPUT]
    Name            cloudwatch_logs
    Match           error.logs
    region          us-east-1
    log_group_name  1851_backend_DEV_CRON_logs
    log_stream_name DEV_cron_error_logs
    auto_create_group true
    log_retention_days 30
EOF

echo "Fluent Bit configuration has been updated."