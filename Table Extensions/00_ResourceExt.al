tableextension 123456700 CSD_ResourceExt extends Resource
{
    // CSD1.00 - 2018-05-07 - Michael Hartmann

    fields
    {
        // Add changes to table fields here

        modify("Profit %")
        {
               trigger OnAfterValidate();
               begin
                   rec.TestField("Unit Cost"); 
               end;
        }
        field(123456701;"CSD_Resource Type";Option)
        {
            OptionMembers = "Internal","External";
            OptionCaption = 'Internal,External';
        }
        field(123456702;"CSD_Maximum Participants";Integer)
        {
            Caption = 'Maximum Participants';
        }
        field(123456703;"CSD_Quantity Per Day";Decimal)
        {
            Caption = 'Quantity Per Day';
        }
    }
}