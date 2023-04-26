MATCH (s:students) where s.name = "Becky" return s.ssn, s.snum;
MATCH (s:students{ssn:'123097834'})-[:majors]->(d:degrees) return d.name, d.level;
MATCH (d:departments{name:'Computer Science'})-[:administers]->(p:degrees) return p.name, p.level;
MATCH (s:students)-[:minor]->(d:degrees) return s.sname;
MATCH (s:students)-[:minor]->(d:degrees) return count(s.snum);
MATCH (s:students)-[:register]->(c:courses) where c.name = 'Algorithm' return s.name, s.snum;
MATCH (s:students)-[r:register]->(c:courses) where c.number = 363 return s.name, r.grade;
MATCH (s:students) return s.name, s.snum order by s.dob asc limit 1;
MATCH (s:students) return s.name, s.snum order by s.dob desc limit 1;
MATCH (s:students) where s.name contains 'n' or s.name contains 'N' return s.name, s.ssn, s.snum;
MATCH (s:students) where not s.name contains 'n' and not s.name contains 'N' return s.name, s.ssn, s.snum;
MATCH (s:students)-[r:register]->(c:courses) return c.number, c.name, count(r.snum);
MATCH (s:students)-[r:register]->(c:courses) where r.regtime = 'Fall2020' return s.name;
MATCH (d:departments)-[:offers]->(c:courses) where d.name = 'Computer Science' return c.name, c.number;
MATCH (d:departments)-[:offers]->(c:courses) where d.name = 'Computer Science' or d.name = 'Landscape Architect' return c.number, c.name
