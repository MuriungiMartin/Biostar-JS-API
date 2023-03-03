page 50902 "Access Control Setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Access Control Setup";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;

                }
                field(Url; Rec.Url)
                {

                }
                field("login id"; Rec."login id")
                {
                    ApplicationArea = All;
                }
                field(Password; Rec.Password)
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
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}