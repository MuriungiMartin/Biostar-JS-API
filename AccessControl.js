var SessionId;

function loginXHR(loginId,password,uri)
{

var data = `{\r\n    \`User\`: {\r\n        \`login_id\`: \`${loginId}\`,\r\n        \`password\`: \`${password}\`\r\n    }\r\n}`;
var xhr = new XMLHttpRequest();
xhr.withCredentials = false;


xhr.addEventListener(`readystatechange`, function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open(`POST`, `${uri}/api/login`);
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',)

  xhr.send(data);

// xhr.onload=()=>{
//   if(xhr.status==200){
// console.log(xhr.response)
//   }else{
//     console.log(`error ${xhr.status}`)
//   }
// }
xhr.onreadystatechange = () => {
  if (xhr.readyState === xhr.HEADERS_RECEIVED) {
    SessionId = xhr.getResponseHeader(`bs-session-id`)
  }
}
localStorage.setItem('bs-session-id', SessionId);

}
function logout(uri)
{
// WARNING: For POST requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener(`readystatechange`, function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});
SessionId=localStorage.getItem('bs-session-id');
xhr.open(`POST`, `${uri}/api/logout`);
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',),
xhr.setRequestHeader('bs-session-id',SessionId)
xhr.send();  
}

function CreateNewAccessGroup(name,description,user_id,UserGroup,access_level,uri)
{
  // WARNING: For POST requests, body is set to null by browsers.
var data = `{\r\n    \`AccessGroup\`: {\r\n        \`name\`: \`${name}\`,\r\n        \`description\`: \`${description}\`,\r\n      
  \`users\`: [{\`user_id\`: ${user_id}}],\r\n        \`user_groups\`: [{\`id\`: ${UserGroup}}],\r\n       
   \`access_levels\`: [{\`id\`: ${access_level}}],\r\n        \`floor_levels\`: [{\`\`: \`32769\`,\`name\`: \`floor_test\`,\`$$hashKey\`: \`object:20863\`}]\r\n    }\r\n}`;

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener(`readystatechange`, function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});
SessionId=localStorage.getItem('bs-session-id');
xhr.open(`POST`, `${uri}/api/access_groups`);
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',),
xhr.setRequestHeader('bs-session-id',SessionId)

xhr.send(data);
}
function ListAllAccessGroups(uri)
{
  // WARNING: For GET requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener(`readystatechange`, function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});
SessionId=localStorage.getItem('bs-session-id');
xhr.open(`GET`, `${uri}/api/access_groups`);
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',),
xhr.setRequestHeader('bs-session-id',SessionId)
xhr.send();
}

function updateAnAccessGroup()
{
  var data = "{\r\n  \"AccessGroup\": {\r\n    \"name\": \"Meeting Room Name\",\r\n    \"description\": \"MR Description\",\r\n    \"access_levels\": [{\"id\":1}],\r\n    \"user_groups\": [{ \"id\":1}],\r\n    \"users\": [{\"user_id\":17},{\"user_id\":9932},{\"user_id\":2}],\r\n    \"delete_users\": [{\"user_id\":0}]\r\n  }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = true;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("PUT", "https://127.0.0.1/api/access_groups/1");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',),
xhr.setRequestHeader('bs-session-id',SessionId)

xhr.send(data);
}


function CreateNewUserGroupXHR(parent_id,depth,name,uri)
{
  // WARNING: For POST requests, body is set to null by browsers.
var data = `{\r\n    \`UserGroup\`: {\r\n        \`parent_id\`: {\r\n            \`id\`: ${parent_id}\r\n        },\r\n     
  \`depth\`: ${depth},\r\n        \`name\`: \`${name}\`\r\n    }\r\n}`;

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener(`readystatechange`, function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});


SessionId=localStorage.getItem('bs-session-id');
//alert(`Stored Session ID ${SessionId}`);
xhr.open(`POST`, `${uri}/api/user_groups`);
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId)


xhr.send(data);
}
