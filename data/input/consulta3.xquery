declare option output:method "xml";
declare option output:indent "yes";

<tags>{
  for $t in tags/row
  order by xs:integer($t/@Count) descending
  return
    <tag>
      <name>{$t/@TagName/string()}</name>
      <count>{ $t/@Count}</count>
    </tag>
}</tags>
