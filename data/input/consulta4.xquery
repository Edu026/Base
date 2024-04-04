declare option output:method "xml";
declare option output:indent "yes";

let $tags := 
<tags>{
  for $t in tags/row[position() <= 10]
  order by xs:integer($t/@Count) descending
  return
    <tag>
      <name>{$t/@TagName/string()}</name>
    </tag>
}</tags>

let $distinctTags := distinct-values($tags/tag/name)
let $preguntas := posts/row
let $preguntasFilt :=   
    for $p in $preguntas
    where some $tag in $distinctTags satisfies contains($p/@Tags, $tag)
    let $c := $p/@ViewCount
    order by xs:integer($c) descending
    return
      if (position() le 100) then
        <post>{$p}</post>
      else ()
  

return
  <top-100-preguntas>
          {
            for $p in $preguntasFilt[position() le 100]
            return $p
        }
  </top-100-preguntas>
