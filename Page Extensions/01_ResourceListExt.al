pageextension 123456701 ResourceListExt extends "Resource List"
{
    layout
    {
        // Add changes to page layout here
        
        modify(Type)
        {
            Visible = ShowType;
        }

        addafter(Type)
        {
            field("Resource Type";"CSD_Resource Type")
            {

            }

            field("Maximum Participants";"CSD_Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
    
    trigger OnOpenPage();
    begin
        FilterGroup(3);
        ShowType := (GetFilter(Type) = '');
        ShowMaxField := (GetFilter(Type) = format(type::Machine));
        FilterGroup(0);
    end;

    var
    [InDataSet]
    ShowMaxField  :Boolean;
    [InDataSet]
    ShowType : Boolean;

}