page 123456701 "Seminar Card"
{
    PageType = Card;
    SourceTable = Seminar;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                trigger OnAssistEdit();
                begin
                    if AssistEdit then
                        CurrPage.Update;
                end;
                }
                field("Search Name";"Search Name")
                {

                }
                field("Seminar Duration";"Seminar Duration")
                {

                }
                field("Minimum Participants";"Minimum Participants")
                {

                }
                field("Maximum Participants";"Maximum Participants")
                {

                }
                field(Blocked;Blocked)
                {

                }
                field("Last Date Modified";"Last Date Modified")
                {

                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';

                field("Gen. Prod. Posting Group";"Gen. Prod. Posting Group")
                {

                }
                field("VAT Prod. Posting Group";"VAT Prod. Posting Group")
                {

                }
                field("Seminar Price";"Seminar Price")
                {

                }
            }
        }
        area(FactBoxes)
        {
            systempart("Links";Links)
            {
            }
            systempart("Notes";Notes)
            {
            }
        }
    }    

    actions
    {
        area(Navigation)
        {
            group("&Seminar")
            {
                Caption = '&Seminar';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    RunObject=page "Seminar Comment Sheet";
                    RunPageLink = "Table Name"=const(Seminar),"No."=field("No.");
                    Image = Comment;
                }
                action("Ledger Entries")
                {
                    Caption = 'Ledger Entries';
                    RunObject=page "Seminar Ledger Entries";
                    RunPageLink="Seminar No."=field("No.");
                    Promoted=true;
                    PromotedCategory=Process;
                    ShortcutKey="Ctrl+F7";
                    Image=WarrantyLedger;
                }
                action("&Registrations")
                {
                    Caption = '&Registrations';
                    RunObject=page "Seminar Registration List";
                    RunPageLink="Seminar No."=field("No.");
                    Image=Timesheet;
                    Promoted=true;
                    PromotedCategory=Process;
                }
            }

        }
        area(Processing)
        {
            action("Seminar Registration")
            {
            RunObject= page "Seminar Registration";
            RunPageLink="Seminar No."=field("No.");
            RunPageMode=Create;
            Image=NewTimesheet;
            }
        }
    }
}
