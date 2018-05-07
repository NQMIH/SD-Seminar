table 123456701 Seminar
{
    DataClassification = ToBeClassified;
    Caption = 'Seminar';

    fields
    {
        field(10;"No.";Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.GET;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(20;Name;Text[50])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                if ("Search Name"=UpperCase(xRec.Name)) or ("Search Name"='') then
                    "Search Name":=Name;
            end;
        }
        field(30;"Seminar Duration";Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0:1;
            DataClassification = ToBeClassified;
        }
        field(40;"Minimum Participants";Integer)
        {
            Caption = 'Minimum Participants';
            DataClassification = ToBeClassified;
        }
        field(50;"Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
            DataClassification = ToBeClassified;
        }
        field(60;"Search Name";Code[50])
        {
            Caption = 'Search Name';
            DataClassification = ToBeClassified;
        }
        field(70;Blocked;Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(80;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modifyied';
            DataClassification = ToBeClassified;
        }
        field(90;Comment;Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(100;"Seminar Price";Decimal)
        {
            Caption = 'Seminar Price';
            DataClassification = ToBeClassified;
        }

        field(110;"Gen. Prod. Posting Group";Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Business Posting Group";
            DataClassification = ToBeClassified;

            trigger OnValidate();
            begin
                if (xRec."Gen. Prod. Posting Group"<> "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup,"Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group", GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(120;"VAT Prod. Posting Group";Code[10])
        {
            Caption = 'VAT Product Posting group';
            TableRelation = "VAT Product Posting Group";
            DataClassification = ToBeClassified;
        }

        field(130;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            DataClassification = ToBeClassified;
        }
    }


    keys
    {
        key(PK;"No.")
        {
            Clustered = true;
        }
    }
    
    var
        SeminarSetup : Record "Seminar Setup";
        SeminarCommentLine : Record "seminar Comment Line";
        Seminar : Record Seminar;
        GenProdPostingGroup : Record "Gen. Product Posting Group";
        NoSeriesMgt : Codeunit NoSeriesManagement;


    trigger OnInsert();
    begin
        If "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.",xRec."No. Series",0D,"No.","No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last Date Modified":=Today;
    end;

    trigger OnDelete();
    begin
        SeminarCommentLine.Reset;
        SeminarCommentLine.SetRange("Table Name", SeminarCommentLine."Table Name"::Seminar);
        SeminarCommentLine.SetRange("No.","No.");
        SeminarCommentLine.DeleteAll;
    end;

    trigger OnRename();
    begin
        "Last Date Modified":=Today;
    end;

    procedure AssistEdit() : Boolean;
    begin
        with Seminar do begin
            Seminar:=Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.",xRec."No. Series","No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec:=Seminar;
                exit(true);
            end;
        end;
    end;
}