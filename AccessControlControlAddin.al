controladdin AccessControlAddin
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
    procedure TestTheTestAPI(Url: Text[250]; NASApiKey: text[250]);
    procedure Login(UserId: Text[150]; Password: Text[150]; url: Text[150]);
    procedure Logout();
    procedure CreateUSer();
    Procedure ListUnassignedCards(Url: Text[250]);
    procedure login2();
    procedure CreateNewUserGroup(ApiKey: text[150]);
    procedure loginAxios();
    procedure loginXHR();
    procedure CreateNewUserGroupXHR();

}