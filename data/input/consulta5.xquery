declare option output:method "xml";
declare option output:indent "yes";

(:
PostTypeId = 1 Preguntas
PostTypeId = 2 Respuestas
:)

let $preguntes := 

  for $p in /posts/row
  
  let $mva := ""
  
  let $votescount := count(votes/row[@PostId = $p/@Id])
    
  order by $p/@Score descending
   
  return 
  <pregunta>
    <title>{$p/@Title/string()}</title>
    <body>{$p/@Body/string()}</body>
    <mostVotedAnswer>{$mva}</mostVotedAnswer>
    <votes>{$votescount}</votes>
    <Tags>{$p/@Tags/string()}</Tags>
  </pregunta>
  
return $preguntes