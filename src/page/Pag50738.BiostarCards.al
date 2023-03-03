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
                field("Card Id"; Rec."Card Id")
                {
                    ApplicationArea = All;

                }
                field("Card Type"; Rec."Card Type")
                {

                }
                field("Card Type Name"; Rec."Card Type Name")
                {

                }
                field(Assigned; Rec.Assigned)
                {

                }
                field(BlackListed; Rec.BlackListed)
                {

                }
                field(Status; Rec.Status)
                {

                }
                field("User ID"; Rec."User ID")
                {

                }
                field("User Name"; Rec."User Name")
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
                    CurrPage.Biostar.createCard(Rec."Card Id", Rec."Card Type", ObjAccSetup.Url);
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