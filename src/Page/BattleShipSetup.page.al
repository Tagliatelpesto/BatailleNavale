page 50103 "BattleShip Setup"
{
    ApplicationArea = All;
    Caption = 'BattleShip Setup';
    PageType = Card;
    SourceTable = "BattleShip Setup";
    UsageCategory = Administration;
    AdditionalSearchTerms = 'Setup,BattleShip,Game';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the No. Series for the BattleShip Game', Comment = '%';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;
}
