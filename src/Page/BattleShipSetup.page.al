page 50103 "BattleShip Setup"
{
    ApplicationArea = All;
    Caption = 'BattleShip Setup';
    PageType = Card;
    SourceTable = "BattleShip Setup";
    UsageCategory = Administration;
    AdditionalSearchTerms = 'CCC';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.', Comment = '%';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
