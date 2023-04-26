MATCH (s:students{ssn:'746897816'}) set s.name ='Scott';
MATCH (s:students{ssn:'746897816'})-[m:majors]->(p:degrees),(d:degrees{level:'MS', name:'Computer Science'}) delete m create (s)-[:majors{level:d.level, name:d.name, snum:s.snum}]->(d);
MATCH (s:students)-[r:register]->(c:courses) where r.regtime = 'Spring2021' delete r;
