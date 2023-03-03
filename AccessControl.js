var SessionId;
var Username;
var Password;

Username='navadmin';
Password='N@v@dm1n@2022!'


function loginMain(loginid,password,uri)
{
  // WARNING: For POST requests, body is set to null by browsers. \"name\": "+finalName+"\r\n
  var finalloginid='"'+loginid+'"';
  var finalpassword='"'+password+'"';
  var data = "{\r\n    \"User\": {\r\n        \"login_id\": "+finalloginid+",\r\n        \"password\": "+finalpassword+"\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("POST", uri+"/api/login");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*')
xhr.send(data);
xhr.onreadystatechange = () => {
  if (xhr.readyState === xhr.HEADERS_RECEIVED) {
    SessionId = xhr.getResponseHeader(`bs-session-id`)
  }
}
// alert('sess '+ SessionId);
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

function updateAnAccessGroup(id,name,description,access_level)
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

  var finalName='"'+name+'"';
  var data = "{\r\n    \"UserGroup\": {\r\n        \"parent_id\": {\r\n            \"id\": "+parent_id+"\r\n        },\r\n        \"depth\":"+depth+",\r\n        \"name\": "+finalName+"\r\n    }\r\n}";


var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

// alert(data);

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});



SessionId=localStorage.getItem('bs-session-id');
// alert(`Stored Session ID ${SessionId}`);
xhr.open("POST", uri+"/api/user_groups");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId)

//xhr.timeout=60000;
// alert('res 1 '+xhr.response);
xhr.onload = function(){
  if (xhr.status==200){
    // alert('Giving output');
    var response = JSON.parse(this.responseText);
   alert(response);
   const id = response.UserGroup.id;
   const name = response.UserGroup.name;
    SendUserGroupBackToBCCentral(id,name,parent_id,depth);
  }
  else 
  {
    console.log('an error ocurred '+xhr.status);
  }
}



xhr.send(data);


}

function SendUserGroupBackToBCCentral(id,name,parentId,depth)
{
  var endpoint=`http://desktop-2j34hh3:7047/BC140/WS/KMPDC/Codeunit/CuBiostarAccessControl`;
  var soapRequest = `<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">` +
  `<Body>` +
  `<fnCreateBiostarUserGroup xmlns="urn:microsoft-dynamics-schemas/codeunit/CuBiostarAccessControl">` +
  `<id>${id}</id>` +
  `<name>${name}</name>` +
  `<parentId>${parentId}</parentId>` +
  `<depth>${depth}</depth>` +
  `</fnCreateBiostarUserGroup>` +
  `</Body>` +
  `</Envelope>`;

  // alert(' this is the soap request '+soapRequest);

  var xhr = new XMLHttpRequest();
  xhr.open(`POST`, endpoint, true);
  xhr.setRequestHeader(`Content-Type`, `text/xml; charset=utf-8`);
  xhr.setRequestHeader(`SOAPAction`, `fnCreateBiostarUserGroup`);
  var auth = 'Basic ' + btoa(Username + ':' + Password);
xhr.setRequestHeader('Authorization', auth);
  
  // define a callback function to handle the response
  xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
          // handle the SOAP response here
          console.log(xhr.responseText);
      }
  };
  
  // send the SOAP request
  xhr.send(soapRequest);

}

//Access Level-Post
function CreateNewAccessLevel(parent_id,depth,name,uri)
{

  var finalName='"'+name+'"';
  var data = "{\r\n    \"UserGroup\": {\r\n        \"parent_id\": {\r\n            \"id\": "+parent_id+"\r\n        },\r\n        \"depth\":"+depth+",\r\n        \"name\": "+finalName+"\r\n    }\r\n}";


var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

// alert(data);

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});



SessionId=localStorage.getItem('bs-session-id');
// alert(`Stored Session ID ${SessionId}`);
xhr.open("POST", uri+"/api/user_groups");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId)

//xhr.timeout=60000;
// alert('res 1 '+xhr.response);
xhr.onload = function(){
  if (xhr.status==200){
    // alert('Giving output');
    var response = JSON.parse(this.responseText);
   alert(response);
   const id = response.UserGroup.id;
   const name = response.UserGroup.name;
    SendUserGroupBackToBCCentral(id,name,parent_id,depth);
  }
  else 
  {
    console.log('an error ocurred '+xhr.status);
  }
}



xhr.send(data);


}
//Access Level-Get
function PostAccessLevelBC(id,name,parentId,depth)
{
  var endpoint=`http://desktop-2j34hh3:7047/BC140/WS/KMPDC/Codeunit/CuBiostarAccessControl`;
  var soapRequest = `<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">` +
  `<Body>` +
  `<fnCreateBiostarUserGroup xmlns="urn:microsoft-dynamics-schemas/codeunit/CuBiostarAccessControl">` +
  `<id>${id}</id>` +
  `<name>${name}</name>` +
  `<parentId>${parentId}</parentId>` +
  `<depth>${depth}</depth>` +
  `</fnCreateBiostarUserGroup>` +
  `</Body>` +
  `</Envelope>`;

  // alert(' this is the soap request '+soapRequest);

  var xhr = new XMLHttpRequest();
  xhr.open(`POST`, endpoint, true);
  xhr.setRequestHeader(`Content-Type`, `text/xml; charset=utf-8`);
  xhr.setRequestHeader(`SOAPAction`, `fnCreateBiostarUserGroup`);
  var auth = 'Basic ' + btoa(Username + ':' + Password);
xhr.setRequestHeader('Authorization', auth);
  
  // define a callback function to handle the response
  xhr.onreadystatechange = function() {
      if (xhr.readyState == 4 && xhr.status == 200) {
          // handle the SOAP response here
          console.log(xhr.responseText);
      }
  };
  
  // send the SOAP request
  xhr.send(soapRequest);

}