table 52178054 "biostar User Group"
{
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1;id; Integer)
        {
            DataClassification = ToBeClassified;
            
        }
        field(2; "Parent Id"; integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "depth"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "name"; Text[48])
        {
            DataClassification = ToBeClassified;
        }
     
    }
    
    keys
    {
        key(Key1; id)
        {
            Clustered = true;
        }
    }
    
    var
        myInt: Integer;
    
    trigger OnInsert()
    begin
        
    end;
    
    trigger OnModify()
    begin
        
    end;
    
    trigger OnDelete()
    begin
        
    end;
    
    trigger OnRename()
    begin
        
    end;
    
}