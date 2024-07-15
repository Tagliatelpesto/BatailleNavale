table 50100 "BattleShip Setup"
{
    Caption = 'BattleShip Setup';
    DataClassification = ToBeClassified;
    LookupPageId = "BattleShip Setup";
    DrillDownPageId = "BattleShip Setup";
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(2; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}
