# PostgresqlDbAvailabilityRateGrafana
This project allow you to get the availability rate of a Postgresql database in the InfluxDB database, and then permit Grafana to read the data. In extend, you can have your postgresql db availability rate in a grafana dashboard.


The bash script connect to the database at the choosen rate (default every minutes), get the status and write it into InfluxDB.

The SQL script is for the grafana widget, it grab the data in InfluxDB and show a curve from the timestamp framing you choose.
