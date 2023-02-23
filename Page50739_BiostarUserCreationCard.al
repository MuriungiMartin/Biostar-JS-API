page 50739 "Biostar User Creation"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Ac Ctrl Users Rec";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(ID; ID)
                {
                    ApplicationArea = All;

                }
                field(Name; Name)
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
        ACCUSER: Record "Ac Ctrl Users Rec";
}