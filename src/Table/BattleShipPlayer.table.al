table 50102 "BattleShip Player"
{
    Caption = 'Battle Ship Player';
    DataClassification = ToBeClassified;
    LookupPageId = "BattleShip Player List";
    DrillDownPageId = "BattleShip Player List";
    fields
    {
        field(1; "User ID"; Text[50])
        {
            Caption = 'ID';
        }
        field(3; "Number of victories"; Integer)
        {
            Caption = 'Number of victories';
            FieldClass = FlowField;
            CalcFormula = count("BattleShip Game" where(Winner = field("User ID")));
        }
        field(4; "Number of loses"; Integer)
        {
            Caption = 'Number of loses';
            FieldClass = FlowField;
            CalcFormula = count("BattleShip Game" where(Loser = field("User ID")));
        }
    }
    keys
    {
        key(PK; "User ID")
        {
            Clustered = true;
        }
    }
}
