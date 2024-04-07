declare option output:method "xml";
declare option output:indent "yes";

let $posts := posts/row
 
let $users :=  <users>{
    for $u in /users/row
    let $p_cnt := count($posts[@OwnerUserId = $u/@Id])
    return
      <user>
        <username>{$u/@DisplayName/string()}</username>
        <n_preguntes>{$p_cnt}</n_preguntes>
      </user>
  }</users>
  
for $uu in $users/user
order by xs:integer($uu/n_preguntes) descending 
return $uu