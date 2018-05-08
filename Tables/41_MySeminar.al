table 123456741 "My Seminars"
{
    DataClassification = ToBeClassified;
    Caption='My Seminars';
    fields
    {
        field(10;"User Id";Code[50])
        {
            Caption = 'User Id';
            TableRelation=User;
            DataClassification = ToBeClassified;
        }
        field(20;"Seminar No.";Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation=Seminar;
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK;"User Id","Seminar No.")
        {
            Clustered = true;
        }
    }
}