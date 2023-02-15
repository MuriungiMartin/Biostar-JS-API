page 50698 "Access Control Logs List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Access Control Card Logs";
    CardPageId = "Access Control Logs Card";

    layout
    {
        area(Content)
        {
            repeater(General)
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