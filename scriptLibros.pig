REGISTER /Users/inigo/pig-0.14.0/lib/piggybank.jar
DEFINE XPath org.apache.pig.piggybank.evaluation.xml.XPath();
 
A =  LOAD '/Users/inigo/proyectos/pigWeather/libros.xml' using org.apache.pig.piggybank.storage.XMLLoader('BOOK') as (x:chararray);
 
B = FOREACH A GENERATE XPath(x, 'BOOK/AUTHOR'), XPath(x, 'BOOK/PRICE');
dump B;