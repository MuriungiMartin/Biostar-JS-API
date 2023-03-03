page 50701 "Doors List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Door Register";

    layout
    {
        area(Content)
        {
            usercontrol(Biostar; AccessControlAddin)
            {

            }
            repeater(General)
            {
                field("Door No."; "Door No.")
                {
                    ApplicationArea = All;

                }
                field("Designated Employee No."; Rec."Designated Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Floor No."; Rec."Floor No.")
                {
                    ApplicationArea = All;
                }


            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Login To Biostar")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = SignUp;
                trigger OnAction();
                begin
                    ObjAccSetup.Get();
                    CurrPage.Biostar.loginMain(ObjAccSetup."login id", ObjAccSetup.Password, ObjAccSetup.Url);
                end;
            }
        
            action("Fetch Doors")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Card;
                trigger OnAction();
                begin
                    ObjAccSetup.Get();
                    CurrPage.Biostar.listAllUsers(ObjAccSetup.Url);
                end;
            }
        }
    }
    var
        ObjAccSetup: Record "Access Control Setup";
}