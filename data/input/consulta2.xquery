declare option output:method "xml";
declare option output:indent "yes";

let $posts := doc("/home/super/Baixades/coffee.stackexchange.com/Posts.xml")/posts/row
return 
  <users>{
    for $u in /users/row
    return
      <user>
        <username>{$u/@DisplayName/string()}</username>
        <n_preguntes>{
          let $user_id := $u/@Id
          return count($posts[@OwnerUserId = $user_id])
        }</n_preguntes>
      </user>
  }</users>
