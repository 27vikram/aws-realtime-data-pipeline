-- Query 1: Retrieve all records
SELECT * 
FROM processed_data;

-- Query 2: Filter high-temperature events
SELECT * 
FROM processed_data
WHERE temperature > 30
ORDER BY timestamp DESC;

-- Query 3: Count events per device
SELECT device_id, COUNT(*) AS event_count
FROM processed_data
GROUP BY device_id
ORDER BY event_count DESC;

-- Query 4: Calculate average temperature and humidity per device
SELECT 
    device_id, 
    AVG(temperature) AS avg_temperature, 
    AVG(humidity) AS avg_humidity
FROM processed_data
GROUP BY device_id;

-- Query 5: Find the maximum temperature recorded for each device
SELECT 
    device_id, 
    MAX(temperature) AS max_temperature
FROM processed_data
GROUP BY device_id;

-- Query 6: Identify devices with inactive status
SELECT *
FROM processed_data
WHERE status = 'inactive';
