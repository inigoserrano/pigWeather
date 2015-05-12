datos = LOAD '/Users/inigo/proyectos/pigWeather/EasyWeather.txt' USING PigStorage('\t') AS (No:int, Time:chararray, Interval:chararray, Indoor_Humidity:chararray, Indoor_Temperature:chararray, Outdoor_Humidity:chararray, Outdoor_Temperature:int, Absolute_Pressure:chararray, WindGust:chararray, Direction:chararray, Relative_Pressure:chararray, Dewpoint:chararray, Windchill:chararray, Hour_Rainfall:chararray, veinticuatro_hour_Rainfall:chararray, Week_Rainfall:chararray, Month_Rainfall:chararray, Total_Rainfall:chararray, Wind_Level:chararray, Gust_Level:chararray);

fechaYTemperatura = FOREACH datos GENERATE Outdoor_Temperature, SUBSTRING(Time,0,10);

agrupados = GROUP fechaYTemperatura BY $1;

maximos = FOREACH agrupados GENERATE group, MAX(fechaYTemperatura.Outdoor_Temperature);
minimos = FOREACH agrupados GENERATE group, MIN(fechaYTemperatura.Outdoor_Temperature);
media = FOREACH agrupados GENERATE group, AVG(fechaYTemperatura.Outdoor_Temperature);

STORE maximos INTO '/Users/inigo/proyectos/pigWeather/maximos' USING PigStorage('\t');
STORE minimos INTO '/Users/inigo/proyectos/pigWeather/minimos' USING PigStorage('\t');
STORE media INTO '/Users/inigo/proyectos/pigWeather/media' USING PigStorage('\t');



