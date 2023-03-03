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
localStorage.getItem('bs-session-id');
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
localStorage.getItem('bs-session-id');
xhr.open(`POST`, `${uri}/api/access_groups`);
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',),
xhr.setRequestHeader('bs-session-id',SessionId)

xhr.send(data);
}

function sendBackAccessGrouptoMSDBC(ID, Name, Description, Users, UserGroups, AccessLevels,FloorLevels)
{
//fnCreateBiostarAccessGroup
//ID: integer; Name: text[25]; Description: Text[40]; Users: TExt[250]; UserGroups: TExt[250]; AccessLevels: TExt[250]; FloorLevels: TExt[250]
var endpoint=`http://desktop-2j34hh3:7047/BC140/WS/KMPDC/Codeunit/CuBiostarAccessControl`;
  var soapRequest = `<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">` +
  `<Body>` +
  `<fnCreateBiostarAccessGroup xmlns="urn:microsoft-dynamics-schemas/codeunit/CuBiostarAccessControl">` +
  `<ID>${ID}</ID>` +
  `<Name>${Name}</Name>` +
  `<Description>${Description}</Description>` +
  `<Users>${Users}</Users>` +
  `<UserGroups>${UserGroups}</UserGroups>` +
  `<AccessLevels>${AccessLevels}</AccessLevels>` +
  `</fnCreateBiostarAccessGroup>` +
  `</Body>` +
  `</Envelope>`;

  // alert(' this is the soap request '+soapRequest);

  var xhr = new XMLHttpRequest();
  xhr.open(`POST`, endpoint, true);
  xhr.setRequestHeader(`Content-Type`, `text/xml; charset=utf-8`);
  xhr.setRequestHeader(`SOAPAction`, `fnCreateBiostarAccessGroup`);
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

xhr.onload = function()
{
  if (xhr.status==200) 
  {
    var Response=JSON.parse(this.responseText);
    var JsonArrayResponse=Response.AccessGroupCollection.rows;
      for (let i =0 ; i <JsonArrayResponse.length; i++){
        JsonResponse=JsonArrayResponse[i];
        let id = JsonArrayResponse[i].id;
        let name = JsonArrayResponse[i].name;
        let description = JsonArrayResponse[i].description;
        let users = JsonArrayResponse[i].user_count;
        if (JsonResponse.hasOwnProperty('user_groups'))
        {
          var  usergroupId=JsonArrayResponse[i].user_groups.id;

        }
        if (JsonResponse.hasOwnProperty('access_levels'))
        {
          var access_level=JsonArrayResponse[i].access_levels.id;

        }

        sendBackAccessGrouptoMSDBC(id, name, description, users, usergroupId, access_level)
      }




  }
}

xhr.send();
}

function updateAnAccessGroup(id,name,description,access_level)
{
  var data = "{\r\n  \"AccessGroup\": {\r\n    \"name\": \"Meeting Room Name\",\r\n    \"description\": \"MR Description\",\r\n    \"access_levels\": [{\"id\":1}],\r\n    \"user_groups\": [{ \"id\":1}],\r\n    \"users\": [{\"user_id\":17},{\"user_id\":9932},{\"user_id\":2}],\r\n    \"delete_users\": [{\"user_id\":0}]\r\n  }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("PUT", uri+"/api/access_groups/1");
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

function CreateNewBiostarUser(uri,userid,userip,user_group_id,start_datetime,expiry_datetime,disabled,name,email,department,title,photo,phone,permission,access_groups,login_id,password)
{
// WARNING: For POST requests, body is set to null by browsers.
var data = "{\r\n    \"User\": {\r\n        \"user_id\":"+userid+"\",\r\n        \"user_group_id\": {\r\n            \"id\": "+user_group_id+"\r\n        },\r\n        \"start_datetime\": "+start_datetime+",\r\n        \"expiry_datetime\": "+expiry_datetime+",\r\n        \"disabled\": "+disabled+",\r\n        \"name\": "+name+",\r\n        \"email\": "+email+",\r\n        \"department\": "+department+",\r\n        \"title\": "+title+",\r\n        \"photo\": "+photo+",\r\n        \"phone\": "+phone+",\r\n        \"permission\": {\r\n            \"id\": "+permission+"\r\n        },\r\n        \"access_groups\": {\r\n            \"id\": "+access_groups+"\r\n        },\r\n        \"login_id\": "+login_id+",\r\n        \"password\": "+password+",\r\n        \"user_ip\": "+userip+"\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

SessionId=localStorage.getItem('bs-session-id');
xhr.open("POST", uri+"/api/users");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.onload = function ()
{
  if (xhr.status==200)
  {

    alert("User Has Been Successfully Created");
  }
}

xhr.send(data);  
}

function listAllUsers(uri)
{
  // WARNING: For GET requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.onload = function()
{
  if (xhr.status==200)
  {
    var Response = JSON.parse(xhr.responseText);
    var JsonArrayResponse = Response.UserCollection.rows;
    for (let i = 0; i < JsonArrayResponse.length; i++){
      JsonResponse=JsonArrayResponse[i];
      let userid = JsonArrayResponse[i].user_id;
      let name = JsonArrayResponse[i].name;
      let login = JsonArrayResponse[i].login_id;
      let cardcount = JsonArrayResponse[i].card_count;
      let phone = JsonArrayResponse[i].idx_phone;
      let disabled = JsonArrayResponse[i].disabled;
      let expired = JsonArrayResponse[i].expired;
      let email=JsonArrayResponse[i].idx_email;
      if (JsonResponse.hasOwnProperty('permission'))
      {
        permissionid=JsonArrayResponse[i].permission.id;
        permissionName=JsonArrayResponse[i].permission.name;
        permissionDesc=JsonArrayResponse[i].permission.description;
      }
      if (JsonResponse.hasOwnProperty('department'))
      {
        var department=JsonArrayResponse[i].department;
      }
      if (JsonResponse.hasOwnProperty('user_title'))
      {
        var title=JsonArrayResponse[i].user_title;
      }
      SendBiostarUserBackToBCCentral(userid,name,1,disabled,email,department,title,phone,permissionid,1,login,'***','',123,expired,cardcount);
    }

  }
}

SessionId=localStorage.getItem("bs-session-id");
xhr.open("GET", uri+"/api/users?group_id=1&limit=0&offset=0&order_by=user_id:false&last_modified=0");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.send();
}

function SendBiostarUserBackToBCCentral(bUserId,userNAme,usergroupId,disabled,email,department,title,phone,permission,AccessGroup,loginId,password,userIp,pinNo,expired,cardcount,startdatetime,expirydatetime)
{
   var endpoint=`http://desktop-2j34hh3:7047/BC140/WS/KMPDC/Codeunit/CuBiostarAccessControl`;
  var soapRequest = `<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">` +
  `<Body>`+
  `<fnCreateBiostarUser xmlns="urn:microsoft-dynamics-schemas/codeunit/CuBiostarAccessControl">` +
  `<bUserId>${bUserId}</bUserId>` +
  `<userNAme> ${userNAme}</userNAme>` +
  `<usergroupId> ${usergroupId}</usergroupId>` +
  `<disabled> ${disabled}</disabled>` +
   `<email> ${email}</email>` +
  `<department> ${department}</department>` +
  `<title> ${title}</title>` +
  `<phone> ${phone}</phone>` +
  `<permission> ${permission}</permission>` +
  `<accessGroup> ${AccessGroup}</accessGroup>` +
  `<loginId> ${loginId}</loginId>` +
  `<password> ${password}</password>` +
  `<userIp> ${userIp}</userIp>` +
  `<pinNo> ${pinNo}</pinNo>` +
  `<expired> ${expired}</expired>` +
  `<cardcount> ${cardcount}</cardcount>` +
  `<startDateTime> ${startdatetime}</startDateTime>` +
  `<ExpiryDateTime> ${expirydatetime}</ExpiryDateTime>` +
  
`</fnCreateBiostarUser>` +
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

function UserCredentialCard(userid,cardId,uri)
{
  var data = "{\r\n    \"User\": {\r\n        \"cards\": [\r\n            {\r\n                \"id\": "+cardId+"\r\n            }\r\n        ]\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

localStorage.getItem("bs-session-id");
xhr.open("PUT", uri+"/api/users/"+userid);
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.onload = function(){
  if (xhr.status==200){
    console.log(userid+'  '+cardId)
SendAssignedCardBackToBcCentral(userid,cardId)
  }
  else
  {
    console.log("An Error Occured "+xhr.status)
  }
}

xhr.send(data);
}

function SendAssignedCardBackToBcCentral(userid,cardId)
{
/* `<Body>` +
  `<fnCreateBiostarUserGroup xmlns="urn:microsoft-dynamics-schemas/codeunit/CuBiostarAccessControl">` +
  `<id>${id}</id>` +
  `<name>${name}</name>` +
  `<parentId>${parentId}</parentId>` +
  `<depth>${depth}</depth>` +
  `</fnCreateBiostarUserGroup>` +
  `</Body>` +
  `</Envelope>`; */

  var endpoint=`http://desktop-2j34hh3:7047/BC140/WS/KMPDC/Codeunit/CuBiostarAccessControl`;
  var soapRequest = `<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">` +
  `<Body>` +
  `<fnAssignUserCard xmlns="urn:microsoft-dynamics-schemas/codeunit/CuBiostarAccessControl">` +
  `<BuserID>${userid}</BuserID>` +
  `<CardID> ${cardId}</CardID>` +
`</fnAssignUserCard>` +
`</Body>` +
`</Envelope>`;

  // alert(' this is the soap request '+soapRequest);

  var xhr = new XMLHttpRequest();
  xhr.open(`POST`, endpoint, true);
  xhr.setRequestHeader(`Content-Type`, `text/xml; charset=utf-8`);
  xhr.setRequestHeader(`SOAPAction`, `fnAssignUserCard`);
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

function CreateCard(cardId,cardtype,uri)
{
  // WARNING: For POST requests, body is set to null by browsers.
var data = "{\r\n    \"CardCollection\": {\r\n        \"rows\": [\r\n            {\r\n                \"card_id\": "+cardId+",\r\n                \"card_type\": {\r\n                    \"id\": "+cardtype+"\r\n                }\r\n            }\r\n        ]\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

SessionId=localStorage.getItem("bs-session-id")
xhr.open("POST", uri+"/api/cards");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.onload = function()
{
  if (xhr.status==200)
  {
    var response=JSON.parse(this.responseText);

    const responseArray = response.CardCollection.rows;

     const userid = response.CardCollection.rows.id;
     const cardid = response.CardCollection.rows.card_id;
    // const displaycardid = response.CardCollection.total.rows.display_card_id;
    const card_type =cardtype;// response.CardCollection.rows.card_type.id;
    const status=1;
console.log(response);
    sendBackCardToMsDBC(cardid,card_type,userid,status);

  }
  else {
    console.log("The following error occurred: "+xhr.status)
  }
}

xhr.send(data);
}

function sendBackCardToMsDBC(cardid,cardType,userid,status)
{
  
  var endpoint=`http://desktop-2j34hh3:7047/BC140/WS/KMPDC/Codeunit/CuBiostarAccessControl`;
  var soapRequest = `<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">` +
  `<Body>` +
  `<fnCreateBiostarCard xmlns="urn:microsoft-dynamics-schemas/codeunit/CuBiostarAccessControl">` +
  `<cardId>${cardid}</cardId>` +
  `<cardType>${cardType}</cardType>` +
  `<status>${status}</status>` +
  `<userid>${userid}</userid>`+
`</fnCreateBiostarCard>` +
`</Body>` +
`</Envelope>`;

  // alert(' this is the soap request '+soapRequest);

  var xhr = new XMLHttpRequest();
  xhr.open(`POST`, endpoint, true);
  xhr.setRequestHeader(`Content-Type`, `text/xml; charset=utf-8`);
  xhr.setRequestHeader(`SOAPAction`, `fnCreateBiostarCard`);
  xhr.setRequestHeader
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

function sendFetchedBackCardToMsDBC(cardid,cardType,status,userid,name,cardname,isassigned,blocked)
{
  var endpoint=`http://desktop-2j34hh3:7047/BC140/WS/KMPDC/Codeunit/CuBiostarAccessControl`;
  var soapRequest = `<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">` +
  `<Body>` +
  `<fnCreateBiostarCard xmlns="urn:microsoft-dynamics-schemas/codeunit/CuBiostarAccessControl">` +
  `<cardId>${cardid}</cardId>` +
  `<cardType>${cardType}</cardType>` +
  `<status>${status}</status>` +
  `<userid>${userid}</userid>`+
  `<name>${name}</name>`+
  `<cardname>${cardname}</cardname>`+
  `<isassigned>${isassigned}</isassigned>`+
  `<blocked>${blocked}</blocked>`+
`</fnCreateBiostarCard>` +
`</Body>` +
`</Envelope>`;

  // alert(' this is the soap request '+soapRequest);

  var xhr = new XMLHttpRequest();
  xhr.open(`POST`, endpoint, true);
  xhr.setRequestHeader(`Content-Type`, `text/xml; charset=utf-8`);
  xhr.setRequestHeader(`SOAPAction`, `fnCreateBiostarCard`);
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

function listAllCards(uri)
{
  // WARNING: For GET requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

SessionId= localStorage.getItem("bs-session-id");
xhr.open("GET", uri+"/api/cards?limit=500&offset=0");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.onload = function()
{
  if (xhr.readyState === 4 && xhr.status === 200)
  {
    var response = JSON.parse(this.responseText)

    var responseArray = response.CardCollection.rows;
var userid;
var name;
    console.log(responseArray);

    for (let i = 0; i < responseArray.length; i++) {
      let JsonResponse =(responseArray[i]);
      let card_id = JsonResponse.card_id;

      if (JsonResponse.hasOwnProperty('user_id'))
      {
        userid =responseArray[i].user_id.user_id;//JsonResponse.user_id.user_id;
        name = responseArray[i].user_id.name;       
      }
      else
      {
        userid =2;//JsonResponse.user_id.user_id;
        name = 'User';
      }
      let cardtype =responseArray[i].card_type.id;
      let cardname=responseArray[i].card_type.name;//= JsonResponse.card_type.id;
     let status =JsonResponse.status;
     let isassigned=JsonResponse.is_assigned;
     let blocked = JsonResponse.is_blocked;
      sendFetchedBackCardToMsDBC(card_id,cardtype,status,userid,name,cardname,isassigned,blocked);
    } 

  }
  else
  {
    console.log("An error occured "+xhr.status)
  }
}

xhr.send();
}

function listUnAssignedCards(uri,cardtype)
{
  // WARNING: For GET requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.onload = function()
{
  if (xhr.status==200)
  {

  }
  else
  {
    console.log("An Error Occured "+xhr.statusText);
  }
}

localStorage.getItem("bs-session-id");
xhr.open("GET", uri+"/api/cards/unassigned?card_type="+cardtype+"&limit&offset");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.send();
}

function listAssignedCards(uri,cardtype)
{
  // WARNING: For GET requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.onload = function()
{
  if (xhr.status==200)
  {

  }
  else
  {
   console.log("An error occurred "+xhr.statusText) 
  }
}

localStorage.getItem("bs-session-id");
xhr.open("GET", uri+"/api/cards/assigned?card_type="+cardtype+"&offset=0");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);
xhr.send();
}

function SendDoorBackToMsDBC(id,name,description,door_group_id,openTimeout,openDuration,openOnce,unconditionalLock,relayInputID,relayOutputIndex,exitInputId,exitInputIndex,exitINputType,sensorInputId,sensorInputIndex,sensorINputType,apbUseDoorSensor)
{

  var endpoint=`http://desktop-2j34hh3:7047/BC140/WS/KMPDC/Codeunit/CuBiostarAccessControl`;
  var soapRequest = `<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">` +
  `<Body>`+
  `<fnCreateBiostarDoor xmlns="urn:microsoft-dynamics-schemas/codeunit/CuBiostarAccessControl">`+
      `<id>${id}</id>`+
      `<name>${name}</name>`+
      `<description>${description}</description>`+
      `<doorGroup>${door_group_id}</doorGroup>`+
      `<openTimeout>${openTimeout}</openTimeout>`+
      `<openDuration>${openDuration}</openDuration>`+
      `<openOnce>${openOnce}</openOnce>`+
      `<unconditionalLock>${unconditionalLock}</unconditionalLock>`+
      `<relayInputID>${relayInputID}</relayInputID>`+
      `<relayOutputIndex>${relayOutputIndex}</relayOutputIndex>`+
      `<exitInputId>${exitInputId}</exitInputId>`+
      `<exitInputIndex>${exitInputIndex}</exitInputIndex>`+
      `<exitINputType>${exitINputType}</exitINputType>`+
      `<sensorInputId>${sensorInputId}</sensorInputId>`+
      `<sensorInputIndex>${sensorInputIndex}</sensorInputIndex>`+
      `<sensorINputType>${sensorINputType}</sensorINputType>`+
      `<apbUseDoorSensor>${apbUseDoorSensor}</apbUseDoorSensor>`+
  `</fnCreateBiostarDoor>`+
`</Body>`+
`</Envelope>`;


var xhr = new XMLHttpRequest();
xhr.open(`POST`, endpoint, true);
xhr.setRequestHeader(`Content-Type`, `text/xml; charset=utf-8`);
xhr.setRequestHeader(`SOAPAction`, `fnCreateBiostarCard`);
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

function listAllDoors(uri)
{
// WARNING: For GET requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.onload = function()
{
  if (xhr.status==200)
  {

  }
  else
  {
    console.log("An error occurred "+xhr.status);
  }
}

localStorage.getItem("bs-session-id");
xhr.open("GET", uri+"/api/doors?limit=0&order_by=id:true");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.send();
}

function createDoor(uri,name,description,door_group_id,open_duration,open_once,open_timeout,unconditional_lock,entry_device_id,outputDeviceID,entry_device_id,relay_index,ExitbuttoninputDeviceid,input_index,type,sensorinputDeviceId,apb_use_door_sensor)
{
  // WARNING: For POST requests, body is set to null by browsers.
var data = "{\r\n    \"Door\": {\r\n        \"name\": \+"+name+"\",\r\n        \"description\": \+"+"+"+description+"+"+"\",\r\n        \"door_group_id\": {\r\n            \"id\": "+door_group_id+"\r\n        },\r\n        \"open_timeout\": "+open_timeout+",\r\n        \"open_duration\": \"+"+open_duration+"+\",\r\n        \"open_once\": \"+"+open_once+"\",\r\n        \"unconditional_lock\": \"+"+unconditional_lock+"\",\r\n        \"entry_device_id\": {\r\n            \"id\": "+entry_device_id+"\r\n        },\r\n        \"relay_output_id\": {\r\n            \"device_id\": {\r\n                \"id\": "+outputDeviceID+"\r\n            },\r\n            \"relay_index\": "+relay_index+"\r\n        },\r\n        \"exit_button_input_id\": {\r\n            \"device_id\": {\r\n                \"id\": "+ExitbuttoninputDeviceid+"\r\n            },\r\n            \"input_index\": "+input_index+",\r\n            \"type\": \""+type+"\"\r\n        },\r\n        \"sensor_input_id\": {\r\n            \"device_id\": {\r\n                \"id\": "+sensorinputDeviceId+"\r\n            },\r\n            \"input_index\": "+input_index+",\r\n            \"type\": \""+type+"\",\r\n            \"apb_use_door_sensor\": \""+apb_use_door_sensor+"\"\r\n        }\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

localStorage.getItem("bs-session-id");
xhr.open("POST", uri+"/api/doors");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.send(data);
}

function listAllDevices(uri)
{
  // WARNING: For GET requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});


localStorage.getItem("bs-session-id");
xhr.open("GET", uri+"/api/devices");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.send();
}

function updateDevice()
{
  var data = "{\r\n    \"Device\": {\r\n        \"name\": \"FaceStation 2 542353521 (192.168.1.23)\",\r\n        \"device_group_id\": {\r\n            \"id\": 47,\r\n            \"name\": \"Suprema\"\r\n        },\r\n        \"lan\": {\r\n            \"connection_mode\": \"1\",\r\n            \"enable_dhcp\": \"false\",\r\n            \"use_dns\": \"false\",\r\n            \"ip\": \"192.168.1.23\",\r\n            \"device_port\": \"51211\",\r\n            \"gateway\": \"192.168.1.1\",\r\n            \"subnet_mask\": \"255.255.255.0\",\r\n            \"server_port\": \"51212\",\r\n            \"mtu_size\": \"1514\",\r\n            \"baseband\": \"0\",\r\n            \"server_ip\": \"192.168.1.5\"\r\n        },\r\n        \"usb\": {\r\n            \"enable_usb\": \"false\",\r\n            \"enable_usb_memory\": \"false\"\r\n        },\r\n        \"wlan\": {\r\n            \"enabled\": \"false\",\r\n            \"operation_mode\": \"0\",\r\n            \"auth_type\": \"0\",\r\n            \"encryption_type\": \"0\"\r\n        },        \r\n        \"rs485\": {\r\n            \"mode\": \"3\",\r\n            \"intelligentInfo\": {\r\n                \"supportIConfig\": \"false\",\r\n                \"useFailCode\": \"false\",\r\n                \"failCodeFormat\": \"1\",\r\n                \"failCode\": \"0000000000000000\",\r\n                \"osdpID\": \"0\",\r\n                \"cardFormat\": \"0\"\r\n            },\r\n            \"channels\": [\r\n                {\r\n                    \"index\": \"0\",\r\n                    \"mode\": \"1\",\r\n                    \"baudrate\": \"115200\"\r\n                }\r\n            ]\r\n        },        \r\n        \"authentication\": {\r\n            \"matching_timeout\": \"5\",\r\n            \"auth_timeout\": \"5\",\r\n            \"enable_private_auth\": \"true\",\r\n            \"enable_server_matching\": \"false\",\r\n            \"face_detection_level\": \"0\",\r\n            \"enable_full_access\": \"false\",\r\n            \"operation_modes\": [\r\n                {\r\n                    \"mode\": \"0\",\r\n                    \"schedule_id\": {\r\n                        \"id\": \"1\"\r\n                    }\r\n                },\r\n                {\r\n                    \"mode\": \"5\",\r\n                    \"schedule_id\": {\r\n                        \"id\": \"1\"\r\n                    }\r\n                },\r\n                {\r\n                    \"mode\": \"9\",\r\n                    \"schedule_id\": {\r\n                        \"id\": \"1\"\r\n                    }\r\n                }\r\n            ],\r\n            \"operators\": [],\r\n            \"enable_card_Id_from_keypad\": \"false\"\r\n        },\r\n        \"card\": {\r\n            \"use_csn\": \"true\",\r\n            \"use_mifare_felica\": \"true\",\r\n            \"use_em\": \"true\",\r\n            \"use_wiegand\": \"false\",\r\n            \"use_iclass\": \"false\",\r\n            \"use_HIDprox\": \"false\",\r\n            \"use_smart\": \"true\",\r\n            \"use_SEOS\": \"false\",\r\n            \"use_SR_SE\": \"false\",\r\n            \"use_desfire_ev1\": \"true\",\r\n            \"use_classic_plus\": \"true\",\r\n            \"use_mobile\": \"true\",\r\n            \"use_BLE\": \"false\",\r\n            \"use_NFC\": \"true\",\r\n            \"byte_order\": \"0\",\r\n            \"use_wiegand_format\": \"false\",\r\n            \"card_layout\": {\r\n                \"id\": \"2\"\r\n            }\r\n        },\r\n        \"display\": {\r\n            \"language\": \"1\",\r\n            \"background\": \"0\",\r\n            \"background_theme\": \"0\",\r\n            \"volume\": \"50\",\r\n            \"use_voice\": \"false\",\r\n            \"menu_timeout\": \"20\",\r\n            \"message_timeout\": \"2000\",\r\n            \"backlight_timeout\": \"20\",\r\n            \"display_datetime\": \"true\",\r\n            \"date_type\": \"0\",\r\n            \"time_format\": \"0\",\r\n            \"home_formation\": \"5\",\r\n            \"shortcut_home\": \"\",\r\n            \"device_private_message\": \"false\",\r\n            \"server_private_message\": \"false\",\r\n            \"use_screen_saver\": \"true\",\r\n            \"sounds\": []\r\n        },\r\n        \"system\": {\r\n            \"timezone\": 28800,\r\n            \"sync_time\": \"true\",\r\n            \"locked\": \"false\",\r\n            \"interphone_type\": 0,\r\n            \"camera_frequency\": \"60\",\r\n            \"use_alphanumeric\": \"false\",\r\n            \"enable_clear_on_tamper\": \"true\",\r\n            \"enable_data_encryption\": false,\r\n            \"use_card_operation\": \"true\"\r\n        },\r\n        \"wiegand\": {\r\n            \"wiegand_in_out\": \"0\",\r\n            \"out_pulse_width\": \"40\",\r\n            \"out_pulse_interval\": \"10000\",\r\n            \"enable_bypass_mode\": \"false\",\r\n            \"format_id\": {\r\n                \"id\": \"0\"\r\n            },\r\n            \"enable_fail_code\": \"false\",\r\n            \"fail_code\": \"0\",\r\n            \"wiegand_output_info\": \"1\",\r\n            \"wiegand_csn_id\": {\r\n                \"id\": \"-1\"\r\n            },\r\n            \"wiegand_cards\": [],\r\n            \"wiegand_inputs\": []\r\n        },\r\n        \"tna\": {\r\n            \"mode\": \"1\",\r\n            \"fixed_code\": 0,\r\n            \"required\": \"false\",\r\n            \"tna_keys\": [\r\n                {\r\n                    \"order\": 1,\r\n                    \"key\": 0,\r\n                    \"keyName\": \"Code 1\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 2,\r\n                    \"key\": 1,\r\n                    \"keyName\": \"Code 2\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 3,\r\n                    \"key\": 2,\r\n                    \"keyName\": \"Code 3\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 4,\r\n                    \"key\": 3,\r\n                    \"keyName\": \"Code 4\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 5,\r\n                    \"key\": 4,\r\n                    \"keyName\": \"Code 5\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 6,\r\n                    \"key\": 5,\r\n                    \"keyName\": \"Code 6\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 7,\r\n                    \"key\": 6,\r\n                    \"keyName\": \"Code 7\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 8,\r\n                    \"key\": 7,\r\n                    \"keyName\": \"Code 8\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 9,\r\n                    \"key\": 8,\r\n                    \"keyName\": \"Code 9\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 10,\r\n                    \"key\": 9,\r\n                    \"keyName\": \"Code 10\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 11,\r\n                    \"key\": 10,\r\n                    \"keyName\": \"Code 11\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 12,\r\n                    \"key\": 11,\r\n                    \"keyName\": \"Code 12\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 13,\r\n                    \"key\": 12,\r\n                    \"keyName\": \"Code 13\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 14,\r\n                    \"key\": 13,\r\n                    \"keyName\": \"Code 14\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 15,\r\n                    \"key\": 14,\r\n                    \"keyName\": \"Code 15\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                },\r\n                {\r\n                    \"order\": 16,\r\n                    \"key\": 15,\r\n                    \"keyName\": \"Code 16\",\r\n                    \"schedule_id\": {},\r\n                    \"label\": \"\"\r\n                }\r\n            ]\r\n        },\r\n        \"input\": {\r\n            \"input_port_num\": \"0\",\r\n            \"supervised_inputs\": \"\"\r\n        },\r\n        \"event_filter\": {\r\n            \"rows\": [],\r\n            \"total\": \"0\"\r\n        },\r\n        \"voip\": {\r\n            \"use\": \"false\",\r\n            \"server\": {\r\n                \"address\": \"\",\r\n                \"user_id\": \"\",\r\n                \"password\": \"\",\r\n                \"port\": \"\"\r\n            },\r\n            \"dtmf\": {\r\n                \"mode\": \"0\",\r\n                \"exit_button\": \"0\"\r\n            },\r\n            \"phonebook_list\": []\r\n        },\r\n        \"barcode\": {\r\n            \"use_barcode\": \"false\",\r\n            \"scan_timeout\": \"4\"\r\n        },\r\n        \"pktversion\": \"3\",\r\n        \"support_occupancy\": \"true\",\r\n        \"thermal_config\": {\r\n            \"enable_thermal_camera\": \"0\",\r\n            \"enable_centigrade\": \"1\",\r\n            \"temperature_threshold_low\": \"3200\",\r\n            \"temperature_threshold_high\": \"3800\",\r\n            \"enable_audit_temperature\": \"true\",\r\n            \"enable_temperature_reject_sound\": \"true\",\r\n            \"enable_overlap_thermal\": \"true\",\r\n            \"temperature_checkmode\": \"0\",\r\n            \"enable_mask\": \"0\",\r\n            \"mask_detection_level\": \"0\",\r\n            \"enable_dynamic_roi\": \"false\"\r\n        },\r\n        \"thermal_camera_config\": {\r\n            \"distance\": \"100\",\r\n            \"emissivity\": \"98\",\r\n            \"roi_x\": \"47\",\r\n            \"roi_y\": \"45\",\r\n            \"roi_width\": \"15\",\r\n            \"roi_height\": \"10\",\r\n            \"enable_body_compensation\": \"true\",\r\n            \"compensation_temperature\": \"0\"\r\n        },\r\n        \"trigger_actions\": \"\",\r\n        \"authmode\": {\r\n            \"id\": \"542353521\",\r\n            \"extAuthModeSupported\": \"false\",\r\n            \"cardAuthSupported\": \"true\",\r\n            \"cardAuthMask\": \"0\",\r\n            \"fingerprintAuthSupported\": \"true\",\r\n            \"fingerprintAuthMask\": \"0\",\r\n            \"faceAuthSupported\": \"false\",\r\n            \"faceAuthMask\": \"990979\",\r\n            \"idAuthSupported\": \"true\",\r\n            \"idAuthMask\": \"0\"\r\n        },\r\n        \"card_supported_from_device\": {\r\n            \"mask\": \"2147483957\",\r\n            \"em4100\": \"true\",\r\n            \"HIDProx\": \"false\",\r\n            \"mifare_felica\": \"true\",\r\n            \"iCLASS\": \"false\",\r\n            \"mifareClassic_Plus\": \"true\",\r\n            \"Desfire_ev1\": \"true\",\r\n            \"iCLASSSRSE\": \"false\",\r\n            \"iCLASSSEOS\": \"false\",\r\n            \"NFC\": \"true\",\r\n            \"BLE\": \"false\",\r\n            \"use_card_operation\": \"true\"\r\n        },\r\n        \"capability\": {\r\n            \"thermalAuthSupported\": \"1\",\r\n            \"maskAuthSupported\": \"0\",\r\n            \"intelligentPDSupported\": \"0\"\r\n        },\r\n        \"imageLogEventInfo\": {\r\n            \"imageLogEventItems\": []\r\n        },\r\n        \"use_image_log\": \"false\",\r\n        \"dst1\": \"0\",\r\n        \"dst2\": \"0\"\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("PUT", uri+"/api/devices/:id");

xhr.send(data);
}

function SyncDeviceData(uri,id)
{
  // WARNING: For POST requests, body is set to null by browsers.
var data = "{\r\n    \"DeviceCollection\": {\r\n        \"rows\": [\r\n            {\r\n                \"id\": "+id+"\"\r\n            }\r\n        ]\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.onload=function()
{
  if (xhr.status==200)
  {

  }
}

localStorage.getItem("bs-session-id")
xhr.open("POST", uri+"/api/devices/sync?clean=false");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.send(data);
}

function UnlockDevice(uri,deviceid)
{
  // WARNING: For POST requests, body is set to null by browsers.
var data = "{\r\n    \"DeviceCollection\": {\r\n        \"rows\": [\r\n            {\r\n                \"id\": "+deviceid+"\"\r\n            }\r\n        ]\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

localStorage.getItem("bs-session-id")
xhr.open("POST", uri+"/api/devices/unlock");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.send(data);
}

function manualLockDoor(uri,doorid)
{
  // WARNING: For POST requests, body is set to null by browsers.
var data = "{\r\n    \"DoorCollection\": {\r\n        \"rows\": [\r\n            {\r\n                \"id\": "+doorid+"\r\n            }\r\n        ]\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.onload = function()
{
  if (xhr.status==200)
  {

  }
  else
  {
    console.log("An error occured "+ xhr.statusText);
  }
}

localStorage.getItem("bs-session-id");
xhr.open("POST", uri+"/api/doors/lock");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.send(data);
}

function manualUnlockDoor(uri,doorid)
{
  // WARNING: For POST requests, body is set to null by browsers.
var data = "{\r\n    \"DoorCollection\": {\r\n        \"rows\": [\r\n            {\r\n                \"id\": "+doorid+"\r\n            }\r\n        ]\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.onload = function()
{
  if (xhr.status==200)
  {

  }
  {
    console.log("Ann Error occurred "+xhr.statusText);
  }
}

localStorage.getItem("bs-session-id");
xhr.open("POST", uri+"/api/doors/unlock");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.send(data);
}

function openDoor(uri,doorid)
{
  // WARNING: For POST requests, body is set to null by browsers.
var data = "{\r\n    \"DoorCollection\": {\r\n        \"rows\": [\r\n            {\r\n                \"id\": "+doorid+"\r\n            }\r\n        ]\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

localStorage.getItem("bs-session-id");
xhr.open("POST", uri+"/api/doors/open");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);
xhr.send(data);
}

function viewTotalUserOnDevice(uri,device_id)
{
  // WARNING: For GET requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.onload() = function()
{
  if (xhr.status==200){

  }
}

localStorage.getItem("bs-session-id")
xhr.open("GET", uri+"/api/devices/"+device_id+"/users?limit=2&page=1");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);
xhr.send();
}

function viewUserDetails(uri,userid)
{
  // WARNING: For GET requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.onload = function()
{
 if (xhr.status==200)
 {

 }
 else (console.log("AN error occured "+xhr.statusText)); 
}

localStorage.getItem("bs-session-id")
xhr.open("GET", uri+"/api/users/"+userid);
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);
xhr.send();
}

function listIdleUsers(uri)
{
// WARNING: For POST requests, body is set to null by browsers.
var data = "{\r\n    \"Query\": {\r\n        \"offset\": 0,\r\n        \"limit\": 0,\r\n        \"conditions\": [\r\n            {\r\n                \"column\": \"user_group_id.id\",\r\n                \"operator\": 2,\r\n                \"values\": [\r\n                    2\r\n                ]\r\n            }\r\n        ],\r\n        \"orders\": [\r\n            {\r\n                \"column\": \"user_id\",\r\n                \"descending\": false\r\n            }\r\n        ]\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

localStorage.getItem("bs-session-id")
xhr.open("POST", uri+"/api/users/absence?search_month=1");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);
xhr.send(data);
}

/**
 * name	String	Y	Name of the schedule
description	String	N	Description of the schedule
day_index	Number	Y	Day of the Week(0-sun, 1-mon, 2-tue, 3-wed, 4-thu, 5-fri, 6-sat)
time_segments:start_time	Number	Y	Start time of the day (in minutes)
time_segments:end_time	Number	Y	End time of the day (in minutes)
holiday_group_id:id	Number	N	ID of the holiday group
days_of_iteration	Number	N	Repeat schedule every n days
start_date	Date	N	Enable schedule from specified date
use_daily_iteration	Boolean	Y	Specify schedule weekly or daily. False for weekly
 */

function createBiostarWeeklySchedule(uri,name,description,timesegStartTime,timesegendtime,holiday_group_id,days_of_iteration,start_date,use_daily_iteration)
{
  // WARNING: For POST requests, body is set to null by browsers.
var data = "{\r\n    \"Schedule\": {\r\n        \"name\": \""+name+"\",\r\n        \"description\": \""+description+"\",\r\n        \"daily_schedules\": [\r\n            {\r\n                \"day_index\": day_index,\r\n                \"time_segments\": []\r\n            },\r\n            {\r\n                \"day_index\": day_index,\r\n                \"time_segments\": [\r\n                    {\r\n                        \"start_time\": timesegStartTime,\r\n                        \"end_time\": timesegendtime\r\n                    },\r\n                    {\r\n                        \"start_time\": timesegStartTime,\r\n                        \"end_time\": timesegendtime\r\n                    }\r\n                ]\r\n            },\r\n            {\r\n                \"day_index\": 2,\r\n                \"time_segments\": []\r\n            },\r\n            {\r\n                \"day_index\": 3,\r\n                \"time_segments\": [\r\n                    {\r\n                        \"start_time\": 0,\r\n                        \"end_time\": 1440\r\n                    }\r\n                ]\r\n            },\r\n            {\r\n                \"day_index\": 4,\r\n                \"time_segments\": []\r\n            },\r\n            {\r\n                \"day_index\": 5,\r\n                \"time_segments\": []\r\n            },\r\n            {\r\n                \"day_index\": 6,\r\n                \"time_segments\": [\r\n                    {\r\n                        \"start_time\": 900,\r\n                        \"end_time\": 960\r\n                    },\r\n                    {\r\n                        \"start_time\": 540,\r\n                        \"end_time\": 600\r\n                    },\r\n                    {\r\n                        \"start_time\": 360,\r\n                        \"end_time\": 420\r\n                    },\r\n                    {\r\n                        \"start_time\": 720,\r\n                        \"end_time\": 780\r\n                    },\r\n                    {\r\n                        \"start_time\": 1080,\r\n                        \"end_time\": 1140\r\n                    }\r\n                ]\r\n            }\r\n        ],\r\n        \"holiday_schedules\": [\r\n            {\r\n                \"holiday_group_id\": {\r\n                    \"id\": \"1\"\r\n                },\r\n                \"time_segments\": [\r\n                    {\r\n                        \"start_time\": 780,\r\n                        \"end_time\": 840\r\n                    }\r\n                ]\r\n            }\r\n        ],\r\n        \"days_of_iteration\": 7,\r\n        \"start_date\": \""+start_date+"\",\r\n        \"use_daily_iteration\": false\r\n    }\r\n}";

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.open("POST", "https://127.0.0.1/api/schedules");

xhr.send(data);
}

function ViewBiostarSchedules(uri)
{
// WARNING: For GET requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.onload = function()
{
  if (xhr.status==200)
  {
    InsertBiostarSchedulesToBCentral();
  }
  else {
    console.log("An error occured "+xhr.statusText);
  }
}

SessionId=localStorage.getItem("bs-session-id");
xhr.open("GET", uri+"/api/schedules?limit&offset");
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);

xhr.send();
}

function viewScheduleDetails(uri,id)
{
  // WARNING: For GET requests, body is set to null by browsers.

var xhr = new XMLHttpRequest();
xhr.withCredentials = false;

xhr.addEventListener("readystatechange", function() {
  if(this.readyState === 4) {
    console.log(this.responseText);
  }
});

xhr.onload = function()
{
  if (xhr.status==200)
  {
    InsertScheduleDetailsToBc();
  }
  else {
    console.log("An error occured "+xhr.statusText);
  }
}

SessionId=localStorage.getItem("bs-session-id");
xhr.open("GET", uri+"/api/schedules/"+id);
xhr.setRequestHeader('content-type','application/json');
xhr.setRequestHeader('Access-Control-Allow-Origin','*',);
xhr.setRequestHeader('bs-session-id',SessionId);
xhr.send();
}

function InsertBiostarSchedulesToBCentral()
{

}
function InsertScheduleDetailsToBc()
{

}