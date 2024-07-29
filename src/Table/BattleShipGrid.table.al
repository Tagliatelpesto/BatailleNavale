table 50103 "BattleShip Grid"
{
    Caption = 'BattleShip Grid';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "No.Game"; Code[20])
        {
            Caption = 'No. Game';
        }
        field(2; "No.Player"; Text[50])
        {
            Caption = 'No. Player';
        }
        field(3; Line; Integer)
        {
            Caption = 'Line';
        }
        field(4; Column; Integer)
        {
            Caption = 'Column';
        }
        field(5; BoatType; Enum "Boat Type")
        {
            Caption = 'Boat Type';
        }
        field(6; BoatStatut; Enum "Boat Statut")
        {
            Caption = 'Boat Statut';
        }
    }
    keys
    {
        key(Key1; "No.Game", "No.Player", Line, Column)
        {
            Clustered = true;
        }
    }
}
