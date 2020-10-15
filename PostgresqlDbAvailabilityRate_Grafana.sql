SELECT AVG(100/(COUNT(current_status)/COUNT(SELECT * FROM "taux_dispo" WHERE current_status='up')))
FROM "taux_dispo"
WHERE $timeFilter
GROUP BY time(1m) fill(null)
