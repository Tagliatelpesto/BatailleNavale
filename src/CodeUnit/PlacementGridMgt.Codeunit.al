codeunit 50105 "Placement Grid Mgt"
{


    procedure OnValidateChoice(BattleShipGrid_l: Record "BattleShip Grid"; BattleShipGame_l: Record "BattleShip Game"; Player: Text[50];
    Line_p: Integer; Column_p: Integer; BoatType_p: Enum "Boat Type")
    begin
        if (BoatType_p <> "Boat Type"::" ") then begin
            VerifBoat(BattleShipGame_l, Player, BattleShipGrid_l.Line, Column_p, BoatType_p);
            CreateOrModifyBoat(BattleShipGame_l, Player, BattleShipGrid_l.Line, Column_p, BoatType_p, "Boat Statut"::" ")
        end
        else
            DeleteBoat(BattleShipGame_l, Player, BattleShipGrid_l.Line, Column_p, BoatType_p);
        BattleShipGame_l.CalcFields("Number Boat Placed");
        if (BattleShipGame_l."Number Boat Placed" >= 34) then begin
            BattleShipGame_l."Game Statut" := "Game Statut"::Game;
            BattleShipGame_l."Player Turn" := BattleShipGame_l."Player 1";
            BattleShipGame_l.Modify();
        end


    end;

    procedure CreateOrModifyBoat(BattleShipGame_l: Record "BattleShip Game"; Player: Text[50];
    Line_p: Integer; Column_p: Integer; BoatType_p: Enum "Boat Type"; BoatStatut_p: Enum "Boat Statut")
    var
        BoatToModify_l: Record "BattleShip Grid";
        CreationGridMgt: CodeUnit "Creation Grid Mgt";
    begin
        if (BoatToModify_l.Get(BattleShipGame_l."No.", Player, Line_p, Column_p)) then begin
            BoatToModify_l.BoatType := BoatType_p;
            BoatToModify_l.Modify();
        end
        else
            CreationGridMgt.InsertBoat(BattleShipGame_l."No.", Player, Line_p, Column_p, BoatType_p, BoatStatut_p);
    end;

    procedure DeleteBoat(BattleShipGame_l: Record "BattleShip Game"; Player: Text[50];
    Line_p: Integer; Column_p: Integer; BoatType_p: Enum "Boat Type")
    var
        BoatToDelete_l: Record "BattleShip Grid";
        AroundRecIsFree_l: Record "BattleShip Grid";
        NumberOfSameBoatAround_l: Integer;
        DeleteErr: Label 'You can''t delete the boat by the center';
    begin
        AroundRecIsFree_l.SetRange("No.Game", BattleShipGame_l."No.");
        AroundRecIsFree_l.SetRange("No.Player", Player);
        AroundRecIsFree_l.SetRange(Line, (Line_p - 1), (Line_p + 1));
        AroundRecIsFree_l.SetRange(Column, (Column_p - 1), (Column_p + 1));
        AroundRecIsFree_l.SetFilter(BoatType, '<>%1', "Boat Type"::" ");
        NumberOfSameBoatAround_l := AroundRecIsFree_l.Count;
        if (NumberOfSameBoatAround_l > 2) then
            Error(DeleteErr);

        if (BoatToDelete_l.Get(BattleShipGame_l."No.", Player, Line_p, Column_p)) then
            BoatToDelete_l.Delete();

    end;

    procedure VerifBoat(BattleShipGame_l: Record "BattleShip Game"; Player: Text[50];
    Line_p: Integer; Column_p: Integer; BoatType_p: Enum "Boat Type")
    var
        NewBoatToInsert: Record "BattleShip Grid";
        AroundRecIsFree_l: Record "BattleShip Grid";
        SameBoatPlacement_l: Record "BattleShip Grid";
        BoatSameLine_l: Boolean;
        BoatSameCol_l: Boolean;
        NumberOfSameBoat_l: Integer;
        SizeMaxOfBoatType_l: Integer;
        CaptionBoat_l: Text[50];
        NumberOfSameBoatAround_l: Integer;
        PlacementErr: Label 'This placement is Impossible';
        AllPlacedErr: Label 'This Boat is completely placed';
        DoubleAxesErr: Label 'Placement on 2 axes impossible';
        Placement2Err: Label 'Placement need to be around the other same Boat Type';
    begin
        if NewBoatToInsert.Get(BattleShipGame_l."No.", Player, Line_p, Column_p) then;

        AroundRecIsFree_l.SetRange("No.Game", BattleShipGame_l."No.");
        AroundRecIsFree_l.SetRange("No.Player", Player);
        AroundRecIsFree_l.SetRange(Line, (Line_p - 1), (Line_p + 1));
        AroundRecIsFree_l.SetRange(Column, (Column_p - 1), (Column_p + 1));
        AroundRecIsFree_l.SetFilter(BoatType, '<>%1&<>%2', "Boat Type"::" ", BoatType_p);

        // Test if there are no boats of a different type around the location
        if not (AroundRecIsFree_l.IsEmpty()) then
            if not ((NewBoatToInsert.Line = Line_p) and (NewBoatToInsert.Column = Column_p) and (NewBoatToInsert.BoatType <> BoatType_p)) then
                Error(PlacementErr);

        SameBoatPlacement_l.SetCurrentKey("No.Game", "No.Player", BoatType);
        SameBoatPlacement_l.SetRange("No.Game", BattleShipGame_l."No.");
        SameBoatPlacement_l.SetRange("No.Player", Player);
        SameBoatPlacement_l.SetRange(BoatType, BoatType_p);

        // Number of boats of the same type already placed
        NumberOfSameBoat_l := SameBoatPlacement_l.Count();

        // Get the maximum size of the boat record
        CaptionBoat_l := Format(BoatType_p, 0, '<Text>');
        SizeMaxOfBoatType_l := StrLen(CaptionBoat_l) - 7;
        CaptionBoat_l := CopyStr(CaptionBoat_l, SizeMaxOfBoatType_l, 1);
        Evaluate(SizeMaxOfBoatType_l, CaptionBoat_l);

        // If two same boats are around, then placement is on 2 axes, so error
        AroundRecIsFree_l.SetFilter(BoatType, '<>%1', "Boat Type"::" ");
        NumberOfSameBoatAround_l := AroundRecIsFree_l.Count;

        if (NumberOfSameBoat_l >= SizeMaxOfBoatType_l) then
            Error(AllPlacedErr);

        if (NumberOfSameBoatAround_l > 1) and (NewBoatToInsert.BoatType <> BoatType_p) then
            Error(DoubleAxesErr);

        // Test placement on the rows
        AroundRecIsFree_l.SetRange(Line, (Line_p - 1), (Line_p + 1));
        AroundRecIsFree_l.SetRange(Column, Column_p);
        NumberOfSameBoatAround_l := AroundRecIsFree_l.Count;
        if (NumberOfSameBoat_l > 0) and (NumberOfSameBoatAround_l < 1) then
            BoatSameLine_l := true;

        // Test placement on the columns
        AroundRecIsFree_l.SetRange(Line, Line_p);
        AroundRecIsFree_l.SetRange(Column, (Column_p - 1), (Column_p + 1));
        NumberOfSameBoatAround_l := AroundRecIsFree_l.Count;
        if (NumberOfSameBoat_l > 0) and (NumberOfSameBoatAround_l < 1) then
            BoatSameCol_l := true;

        if (BoatSameCol_l) and (BoatSameLine_l) then
            Error(Placement2Err);

    end;


}
