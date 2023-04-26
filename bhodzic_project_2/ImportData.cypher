LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vROrskhgTXDn0YC0bMnn9pSZG0fguBT8qSemdN8iJyNqhhn9bQ6z5X-3Lw1I3lFBmNyfDVohA4ZfOHi/pub?gid=946458172&single=true&output=csv' AS line
 create (n:students)
 set n = line,
 n.snum = toInteger(line.snum);
 create constraint s_snum for (s:students) require(s.snum) is unique;
create constraint s_ssn for (s:students) require(s.ssn) is unique;
 LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQl4ewanefLXz_qsNa1FEYimkQoPWLighjsYtUicQ2ZAfje3BJNvIq2LHLMsTtNhSRq3bdDudFwSA47/pub?gid=1395040011&single=true&output=csv' AS line
 create (n:courses)
 set n = line,
 n.number = toInteger(line.number),
 n.credithours = toInteger(line.credithours),
 n.dcode = toInteger(line.dcode);
 create constraint c_number for (c:courses) require(c.number) is unique;
 LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQmzlXmZkQbRaV4gcSaMRINRlEypaOZjMNBNutAHj2Eij4CgpfYni54oj5pFtNAb1k5vCu6pQlsuSBN/pub?gid=1817942933&single=true&output=csv' as line
 create (n:degrees)
 set n = line,
 n.dcode = toInteger(line.dcode);
 create constraint d_level_name for (d:degrees) require(d.name, d.level) is unique;
 LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSZjB-njgyoNAS7hhgvyqPMKs7gSEAzRzj55XrDsS4Ly_Q5pS2XWIWe-Qnx_UsszAxs7GZDT8z9N6l6/pub?gid=1270533085&single=true&output=csv' as line
 create (n:departments)
 set n = line,
 n.dcode = toInteger(line.dcode);
create constraint d_name for (d:departments) require(d.name) is unique;
create constraint d_code for (d:departments) require(d.code) is unique;
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vShYSEUl5j9HpV0GngP4AIk_3wlIfQXK-OF3zCxiL6TkDZ69ultb734LN5LPBq9oKAfcl-T1iqQkS1q/pub?gid=995703209&single=true&output=csv' as line
MATCH (s:students{snum:toInteger(line.snum)}),(d:degrees{level:line.level, name:line.name})
create (s)-[:majors{snum:toInteger(line.snum),name:line.name,level:line.level}]->(d);
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vQEhGIicNxhMTy6z0bpzPZIlSneFOorg0Sp6ApOFlHf0uz3aNuZAHB1KoXNssjqrGPksWXjEdBJeZ1j/pub?gid=1971279781&single=true&output=csv' as line
MATCH (s:students{snum:toInteger(line.snum)}),(d:degrees{level:line.level, name:line.name})
create (s)-[:minor{snum:toInteger(line.snum),name:line.name,level:line.level}]->(d);
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/e/2PACX-1vT7DgJc6JrTXz0JI5QUy4Vf8EbUipytjzLBLTRYe9qCQai62-4wxQFAnW5VUzHI0YZcKzt3_aGZS_GD/pub?gid=147295713&single=true&output=csv' as line
MATCH (s:students{snum:toInteger(line.snum)}),(c:courses{number:toInteger(line.course_number)})
create (s)-[:register{snum:toInteger(line.snum),course_number:toInteger(line.course_number),regtime:line.regtime,grade:line.grade}]->(c);
MATCH (d:degrees), (p:departments)
where d.dcode = p.dcode
create (p)-[:administers{level:d.level, name:d.name, dcode:p.dcode}]->(d);
MATCH (c:courses), (d:departments)
where c.dcode = d.dcode
create (d)-[:offers{dcode:d.dcode, course_number:c.number}]->(c);
