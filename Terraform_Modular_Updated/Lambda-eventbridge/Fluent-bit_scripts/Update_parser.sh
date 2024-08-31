#!/bin/bash

# Define the content to be appended
parser_config="
[PARSER]
    Name        cron_log_parser
    Format      regex
    Regex       ^(?<timestamp>\\w{3} \\d{2} \\d{2}:\\d{2}:\\d{2}) (?<host>[^\\s]+) CRON\\[(?<pid>\\d+)\\]: \\((?<user>[^\\)]+)\\) CMD \\((?<command>.*)\\)$
    Time_Key    timestamp
    Time_Format %b %d %H:%M:%S
    Time_Keep   On

[PARSER]
    Name        error_log_parser
    Format      regex
    Regex       ^(?<level>\\w+) - (?<start_date>\\d{4}-\\d{2}-\\d{2}) - (?<end_date>\\d{4}-\\d{2}-\\d{2}) - (?<message>.*)$
"

# Append the content to the file
echo "$parser_config" | sudo tee -a /etc/fluent-bit/parsers.conf
sudo systemctl restart fluent-bit