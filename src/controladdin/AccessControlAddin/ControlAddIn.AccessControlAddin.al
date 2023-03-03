controladdin "AccessControlAddin"
{
    MaximumHeight = 1;
    MaximumWidth = 1;
    MinimumHeight = 1;
    MinimumWidth = 1;
    HorizontalShrink = true;
    VerticalShrink = true;
    RequestedHeight = 1;
    RequestedWidth = 1;
    Scripts = 'AccessControl.js';
    StartupScript = 'AccessControlStartupScript.js';




    Event ControlReady();
    procedure loginMain(loginId: text; password: Text; uri: text);
    procedure CreateNewUserGroupXHR(parent_id: Integer; depth: integer; name: text; uri: text);
    procedure listAllCards(uri: Text);
    //procedure createDoor(uri: Text;name:Text;description:text;door_group_id:integer;open_duration:Integer;open_once:Boolean;open_timeout:Integer; unconditional_lock: boolean;RelayOutput_device_id: Integer;outputDeviceID:Integer;entry_device_id:Integer;relay_index: Integer,ExitbuttoninputDeviceid,input_index,type,sensorinputDeviceId,apb_use_door_sensor);
    procedure viewAllDoors(uri: Text);
    procedure SyncDeviceData(uri: Text; id: Integer);

    procedure CreateCard(cardId: Integer; cardtype: Integer; uri: Text);

    procedure listAllUsers(uri: text);
    procedure CreateNewBiostarUser(uri: text; userid: Integer; userip: Text; "user_group_id": Integer; "start_datetime": DateTime; "expiry_datetime": datetime; disabled: boolean; name: Text; email: Text; department: Text; title: text; photo: BigText; phone: Text; permission: Integer; "access_groups": Integer; "login_id": Text; password: Text);
    Procedure listAllDoors(uri: text);


}