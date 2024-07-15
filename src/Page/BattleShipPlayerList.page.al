page 50101 "BattleShip Player List"
{
    ApplicationArea = All;
    Caption = 'BattleShip Player';
    PageType = List;
    SourceTable = "BattleShip Player";
    UsageCategory = Lists;
    AdditionalSearchTerms = 'BattleShip Player , Player';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User Id field.', Comment = '%';
                }
                field("Number of looses"; Rec."Number of looses")
                {
                    ToolTip = 'Specifies the value of the Number of looses field.', Comment = '%';
                }
                field("Number of victories"; Rec."Number of victories")
                {
                    ToolTip = 'Specifies the value of the Number of victories field.', Comment = '%';
                }
            }
        }
    }
}
