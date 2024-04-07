declare option output:method "xml";
declare option output:indent "yes";

(:
PostTypeId = 1 Preguntas
PostTypeId = 2 Respuestas
:)

let $preguntes := 

  for $p in /posts/row[@PostTypeId="1"]
  
  let $mva := 
    for $a in posts/row[@ParentId = $p/@Id]
    order by xs:integer($a/@Score) descending
    return <answer>{$a/@Body}</answer> 
    
  let $votescount := count(votes/row[@PostId = $p/@Id])
    
  order by xs:integer($p/@Score) descending
   
  return 
  <pregunta>
    <title>{$p/@Title/string()}</title>
    <body>{$p/@Body/string()}</body>
    <mostVotedAnswer>{$mva[1]/@Body/string()}</mostVotedAnswer>
    <votes>{$votescount}</votes>
    <tags>{$p/@Tags/string()}</tags>
  </pregunta>
  
return $preguntes