page 50696 "Access Control Logs Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Access Control Card Logs";

    layout
    {
        area(Content)
        {

            usercontrol(AcessControl; AccessControlAddin)
            {
                ApplicationArea = all;
                // trigger ControlReady()
                // var
                //     myInt: Integer;
                // begin

                // end;

            }


            group(General)
            {
                field("Entry No"; "Entry No")
                {
                    ApplicationArea = All;

                }
                field("Card No."; Rec."Card No.")
                {
                    ApplicationArea = All;
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = All;
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = All;
                }
                field("Visitor ID"; Rec."Visitor ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            // action(TestAPI)
            // {
            //     ApplicationArea = All;
            //     Image = TestFile;
            //     Promoted = true;
            //     Caption = 'Fetch UnAssigned Cards';
            //     trigger OnAction()
            //     var
            //         APIKey: Text;
            //         Url: text;
            //     begin
            //         Url := 'https://192.168.0.10:443';
            //         CurrPage.AcessControl.Login('admin', 'Kobby@123', Url);
            //     end;
            // }
            // action(Login)
            // {
            //     ApplicationArea = All;
            //     Image = TestFile;
            //     Promoted = true;
            //     Caption = 'Test Login Axios';
            //     trigger OnAction()
            //     var
            //         APIKey: Text;
            //         Url: text;
            //     begin
            //         ObjAccSetup.Get();

            //         Url := ObjAccSetup.Url;
            //         // CurrPage.AcessControl.Login('admin', 'Kobby357', Url);
            //         CurrPage.AcessControl.loginAxios();
            //     end;
            // }
            // action(LoginA)
            // {
            //     ApplicationArea = All;
            //     Image = TestFile;
            //     Promoted = true;
            //     Caption = 'Test Login Fetch';
            //     trigger OnAction()
            //     var
            //         APIKey: Text;
            //         Url: text;
            //     begin
            //         ObjAccSetup.Get();

            //         Url := ObjAccSetup.Url;
            //         CurrPage.AcessControl.Login('admin', 'Kobby357', Url);
            //         //CurrPage.AcessControl.loginAxios();
            //     end;
            // }
            action(Login1)
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Log;
                Caption = 'Login Main';
                trigger OnAction()
                begin
                    ObjAccSetup.Get();
                    CurrPage.AcessControl.loginMain(ObjAccSetup."login id", ObjAccSetup.Password, ObjAccSetup.Url);
                    CurrPage.AcessControl.loginMain(ObjAccSetup."login id", ObjAccSetup.Password, ObjAccSetup.Url);

                end;
            }
            action("Create User Group XHR")
            {
                ApplicationArea = All;
                Promoted = true;
                Image = Log;
                trigger OnAction()
                begin
                    ObjAccSetup.get;
                    CurrPage.AcessControl.CreateNewUserGroupXHR(1, 1, "Visitor ID", ObjAccSetup.Url);
                end;
            }


            // action(Login3)
            // {
            //     ApplicationArea = All;
            //     Image = TestFile;
            //     Promoted = true;
            //     Caption = 'Login Http 2';
            //     trigger OnAction()
            //     var
            //         httpClient: HttpClient;
            //         response: HttpResponseMessage;
            //         requestBody: Text;
            //         REturendValue: text;
            //     begin

            //         REturendValue := TestLoginTwo();
            //         Message('Request returned %1', REturendValue);

            //     end;
            // }
            // action("Test Login $")
            // {
            //     ApplicationArea = All;

            //     trigger OnAction()
            //     var

            //         CUBioStarDotnet: Codeunit "Biostar Dotnet Center";

            //     begin
            //         CUBioStarDotnet.biostarLogin();
            //     end;
            // }
            // action("Test Again")
            // {
            //     ApplicationArea = all;
            //     trigger onaction()
            //     begin
            //         BiostarFullDll.Program().LoginTask();
            //         Message('Leo ndo ile siku mehn');
            //     end;
            // }
            // action("Test Again & again")
            // {
            //     ApplicationArea = all;
            //     trigger onaction()
            //     begin
            //         DotNetBiostar.Auth().login();
            //         Message('Aki yaooooo Wueh');
            //     end;
            // }
            // action("Create User Group")
            // {
            //     ApplicationArea = all;
            //     trigger onaction()
            //     begin
            //         DotNetBiostar.Auth().CreateUG();
            //         Message('Aki yaooooo Wueh');
            //     end;
            // }
            // action("Create User Group22")
            // {
            //     ApplicationArea = All;
            //     Image = TestFile;
            //     Promoted = true;
            //     trigger OnAction()
            //     begin
            //         ObjAccSetup.Get();
            //         CurrPage.AcessControl.CreateNewUserGroup(ObjAccSetup.Url);

            //     end;
            // }


        }
    }

    var
        myInt: Integer;
        ObjAccSetup: Record "Access Control Setup";
        [RunOnClient]
        [WithEvents]
        DotNetBiostar: DotNet Biostar;
        [RunOnClient]
        [WithEvents]
        BiostarFullDll: DotNet BiostarIntegration;


    procedure LoginAccess() return_value: Text
    var
        body: Text[2000];
        client: HttpClient;
        request: HttpRequestMessage;
        response: HttpResponseMessage;
        contentHeaders: HttpHeaders;
        content: HttpContent;
    begin
        ObjAccSetup.Get();
        body := '{“User”: {“login_id”: “admin”, “password”: “Kobby357”}}';
        content.WriteFrom(body);
        content.GetHeaders(contentHeaders);
        contentHeaders.Clear();
        contentHeaders.Add('Content-Type', 'application/json');
        request.Content := content;
        request.SetRequestUri(ObjAccSetup.Url + '/api/login');
        request.Method := 'POST';
        client.Send(request, response);
        response.Content().ReadAs(return_value);
        exit(return_value);
    end;

    procedure TestLoginTwo() ReturnEdValue: Text
    var
        httpClient: HttpClient;
        httpRequest: HttpRequestMessage;
        response: HttpResponseMessage;
        requestBody: Text;
        Content: HttpContent;
        Headers: HttpHeaders;
        ObjAccessCtrlSetup: Record "Access Control Setup";
    begin
        requestBody := '{“User”: {“login_id”: “admin”, “password”: “Kobby357”}}';
        httpRequest.Method := 'POST';
        httpRequest.SetRequestUri := ('http://192.168.0.15:81/api/login');
        Content.WriteFrom(requestBody);
        // Content.GetHeaders(Headers);
        Headers.Add('Content-Type', 'application/json');
        httpRequest.Content := Content;
        httpClient.Send(httpRequest, response);
        // httpRequest.Content :=se(requestBody, 'application/json');
        response.Content().ReadAs(ReturnEdValue);

    end;


}