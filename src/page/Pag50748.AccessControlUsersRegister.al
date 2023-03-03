page 50748 "Access Control Users Register"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Ac Ctrl Users Rec";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
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
                field(Active; Rec.Active)
                {
                }
                field(period; Rec.period)
                {
                }
                field("Access Level"; Rec."Access Level")
                {
                }
                field("Access Group"; Rec."Access Group")
                {
                }
                field(Telephone; Rec.Telephone)
                {
                }
                field("Card Type"; Rec."Card Type")
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