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
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {

                }
                field(Email; Rec.Email)
                {

                }
                field(Department; Rec.Department)
                {

                }
                field(Title; Rec.Title)
                {

                }
                field("Card ID"; Rec."Card ID")
                {

                }
                field("Card Type"; Rec."Card Type")
                {

                }
                field("Login id"; Rec."Login id")
                {

                }
                field("card count"; Rec."card count")
                {

                }
                field(expired; Rec.expired)
                {

                }
                field(Disabled; Rec.Disabled)
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
