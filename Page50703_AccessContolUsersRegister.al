page 50703 "Access Control Users Register"
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
                field(Active; Active)
                {
                }
                field(period; period)
                {
                }
                field("Access Level"; "Access Level")
                {
                }
                field("Access Group"; "Access Group")
                {
                }
                field(Telephone; Telephone)
                {
                }
                field("Card Type"; "Card Type")
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