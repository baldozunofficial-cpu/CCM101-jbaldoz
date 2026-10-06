# Container Observability

## Application Logs

The log line showing the 404 error:


172.17.0.1 - - [05/Oct/2026:23:55:42 +0000] "GET /hidden-admin-page HTTP/1.1" 404 153 "-" "curl/8.5.0" "-"

Application logs are vital for troubleshooting because they record exactly what happened and when, such as which page was requested and what error was returned. Without them, you would have to guess why something broke instead of tracing the problem to its source.
