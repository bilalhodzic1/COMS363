CALL apoc.schema.assert({}, {});
match (n) detach delete n;
