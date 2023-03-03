page 50738 "Biostar Cards"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Biostar Cards";

    layout
    {
        area(Content)
        {

            usercontrol(Biostar; AccessControlAddin)
            {
                ApplicationArea = all;
            }
            repeater(Card)
            {
                field("Card Id"; "Card Id")
                {
                    ApplicationArea = All;

                }
                field("Card Type"; "Card Type")
                {

                }
                field("Card Type Name"; "Card Type Name")
                {

                }
                field(Assigned; Assigned)
                {

                }
                field(BlackListed; BlackListed)
                {

                }
                field(Status; Status)
                {

                }
                field("User ID"; "User ID")
                {

                }
                field("User Name"; "User Name")
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
                    CurrPage.Biostar.loginMain(ObjAccSetup."login id", ObjAccSetup.Password, ObjAccSetup.Url);
                end;
            }
            action("Create Card")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Create;
                trigger OnAction();
                begin
                    ObjAccSetup.Get();
                    CurrPage.Biostar.createCard("Card Id", "Card Type", ObjAccSetup.Url);
                end;
            }
            action("Fetch Cards")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Card;
                trigger OnAction();
                begin
                    ObjAccSetup.Get();
                    CurrPage.Biostar.listAllCards(ObjAccSetup.Url);
                end;
            }
        }
    }
    var
        ObjAccSetup: Record "Access Control Setup";
}