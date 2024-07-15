table 50103 "BattleShip Grid"
{
    Caption = 'BattleShip Grid';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "No. Game"; Code[20])
        {

        }
        field(2; "No. Player"; Text[50])
        {

        }
        field(3; Line; Integer)
        {

        }
        field(4; Column; Integer)
        {

        }
        field(5; "Boat Type"; Enum "Boat Type")
        {

        }
        field(6; "Boat Statut"; Enum "Boat Statut")
        {

        }
    }
    keys
    {
        key(Key1; "No. Game", "No. Player", Line, Column)
        {
            Clustered = true;
        }
    }
    procedure InsertBoat(NoGame_p: Code[20]; Player_p: Text[50]; Line_p: Integer; Column_p: Integer; BoatType_p: Enum "Boat Type"; BoatStatut_p: Enum "Boat Statut")
    var
        NewBoat: Record "BattleShip Grid";
    begin
        if not (NewBoat.Get(NoGame_p, Player_p, Line_p, Column_p)) then begin
            NewBoat.Init();
            NewBoat."Boat Type" := BoatType_p;
            NewBoat.Column := Column_p;
            NewBoat.Line := Line_p;
            NewBoat."No. Game" := NoGame_p;
            NewBoat."No. Player" := Player_p;
            NewBoat."Boat Statut" := BoatStatut_p;
            NewBoat.Insert();
        end
    end;

    procedure CreateGrid(OriginGame_p: Record "BattleShip Game")
    var
        k: Integer;
    begin
        if not Rec.IsTemporary() then
            Error('%1 must be temporary', Rec.TableCaption);
        Rec.Reset();
        Rec.DeleteAll();
        for k := 1 to 10 do begin
            Rec.Init();
            Rec.Line := k;
            Rec.Insert();
        end;
    end;
}
