declare option output:method "xml";
declare option output:indent "yes";

<posts>{
  for $p in /posts/row
  order by $p/@ViewCount descending
  return <post>
          <title>{$p/@Title/string()}</title>
          <viewCount>{$p/@ViewCount/string()}</viewCount>
          </post> 
}</posts>
