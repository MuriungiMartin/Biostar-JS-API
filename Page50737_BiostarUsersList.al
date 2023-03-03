page 50737 "Biostar Users"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Ac Ctrl Users Rec";

    layout
    {
        area(Content)
        {
            usercontrol(Biostar; AccessControlAddin)
            {

            }
            repeater(GroupName)
            {
                field(ID; ID)
                {
                    ApplicationArea = All;

                }
                field(Name; Name)
                {

                }
                field(Email; Email)
                {

                }
                field(Department; Department)
                {

                }
                field(Title; Title)
                {

                }
                field("Card ID"; "Card ID")
                {

                }
                field("Card Type"; "Card Type")
                {

                }
                field("Login id"; "Login id")
                {

                }
                field("card count"; "card count")
                {

                }
                field(expired; expired)
                {

                }
                field(Disabled; Disabled)
                {

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
                    // CurrPage.Biostar.loginMain(ObjAccSetup."login id", ObjAccSetup.Password, ObjAccSetup.Url);
                end;
            }
            action("Create User")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Create;
                trigger OnAction();
                begin
                    ObjAccSetup.Get();
                    //   CurrPage.Biostar.CreateNewBiostarUser("Card Id", "Card Type", ObjAccSetup.Url);
                end;
            }
            action("Fetch Users")
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
