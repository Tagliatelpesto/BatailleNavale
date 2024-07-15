// codeunit 50102 CreateGrid
// {
//     TableNo = "BattleShip Grid";

//     trigger OnRun()
//     begin

//     end;

//     procedure InsertBoat(NoGame_p: Code[20]; Player_p: Text[50]; Line_p: Integer; Column_p: Integer; BoatType_p: Enum "Boat Type"; BoatStatut_p: Enum "Boat Statut")
//     var
//         NewBoat: Record "BattleShip Grid";
//     begin
//         if not (NewBoat.Get(NoGame_p, Player_p, Line_p, Column_p)) then begin
//             NewBoat.Init();
//             NewBoat."Boat Type" := BoatType_p;
//             NewBoat.Column := Column_p;
//             NewBoat.Line := Line_p;
//             NewBoat."No. Game" := NoGame_p;
//             NewBoat."No. Player" := Player_p;
//             NewBoat."Boat Statut" := BoatStatut_p;
//             NewBoat.Insert();
//         end
//     end;

//     procedure CreateGrid()
//     var
//         k: Integer;
//     begin
//         if not OriginGrid_p.IsTemporary() then
//             Error('%1 must be temporary', OriginGrid_p.TableCaption);
//         OriginGrid_p.Reset();
//         OriginGrid_p.DeleteAll();
//         for k := 1 to 10 do begin
//             OriginGrid_p.Init();
//             OriginGrid_p.Line := k;
//             OriginGrid_p.Insert();
//         end;
//     end;


//     procedure SetGridGame(BattleGame_p: Record "BattleShip Game"; Opponent_p: Text[50]; BattleGrid_p: Record "BattleShip Grid";)
//     var
//         BattleGrid_l: Record "BattleShip Grid";
//         Column_p: Integer;
//         BoatStatut_l: Code[1];
//         BoatColor_l: Text[15];
//     begin
//         a := '';
//         b := '';
//         c := '';
//         d := '';
//         e := '';
//         f := '';
//         g := '';
//         h := '';
//         i := '';
//         j := '';

//         for Column_p := 1 to 10 do
//             if (BattleGrid_l.Get(BattleGame_p."No.", Opponent_p, BattleGrid_p.Line, Column_p)) then begin
//                 if (BattleGrid_l."Boat Statut" = "Boat Statut"::" ") then begin
//                     BoatStatut_l := '';
//                     BoatColor_l := '';
//                 end;
//                 if (BattleGrid_l."Boat Statut" = "Boat Statut"::Miss) then begin
//                     BoatStatut_l := 'O';
//                     BoatColor_l := 'Subordinate';
//                 end;
//                 if (BattleGrid_l."Boat Statut" = "Boat Statut"::Hit) then begin
//                     BoatStatut_l := 'X';
//                     BoatColor_l := 'Attention';
//                 end;
//                 if (BattleGrid_l."Boat Statut" = "Boat Statut"::Sinking) then begin
//                     BoatStatut_l := 'X';
//                     BoatColor_l := 'Strong';
//                 end;
//                 SelectColor(BoatColor_l);
//                 SetStatutAndColorOfBoat(Column_p, BoatStatut_l, BoatColor_l);
//             end;
//     end;

//     procedure SetGridPlacement()
//     var
//         BoatColor_l: Text[15];
//     begin
//         a := "Boat Type"::" ";
//         b := "Boat Type"::" ";
//         c := "Boat Type"::" ";
//         d := "Boat Type"::" ";
//         e := "Boat Type"::" ";
//         f := "Boat Type"::" ";
//         g := "Boat Type"::" ";
//         h := "Boat Type"::" ";
//         i := "Boat Type"::" ";
//         j := "Boat Type"::" ";

//         SelectColor(BoatColor_l);
//         SetStatutAndColorOfBoat(Column_p, BoatStatut_l, BoatColor_l);
//     end;
//     //Set the Statut and the Colors of the Boat 
//     local procedure SetStatutAndColorOfBoat(Column_p: Integer; CodeHitOrMiss_l: Code[1]; BoatColor_l: Text[15])
//     begin
//         case Column_p of
//             1:
//                 begin
//                     a := CodeHitOrMiss_l;
//                     BoatColorA := BoatColor_l;
//                 end;
//             2:
//                 begin
//                     b := CodeHitOrMiss_l;
//                     BoatColorB := BoatColor_l;
//                 end;
//             3:
//                 begin
//                     c := CodeHitOrMiss_l;
//                     BoatColorC := BoatColor_l;
//                 end;
//             4:
//                 begin
//                     d := CodeHitOrMiss_l;
//                     BoatColorD := BoatColor_l;
//                 end;
//             5:
//                 begin
//                     e := CodeHitOrMiss_l;
//                     BoatColorE := BoatColor_l;
//                 end;
//             6:
//                 begin
//                     f := CodeHitOrMiss_l;
//                     BoatColorF := BoatColor_l;
//                 end;
//             7:
//                 begin
//                     g := CodeHitOrMiss_l;
//                     BoatColorG := BoatColor_l;
//                 end;
//             8:
//                 begin
//                     h := CodeHitOrMiss_l;
//                     BoatColorH := BoatColor_l;
//                 end;
//             9:
//                 begin
//                     i := CodeHitOrMiss_l;
//                     BoatColorI := BoatColor_l;
//                 end;
//             10:
//                 begin
//                     j := CodeHitOrMiss_l;
//                     BoatColorJ := BoatColor_l;
//                 end;
//         end;
//     end;

//     local procedure SelectColor(var BoatColor_l: Text[15])
//     var
//         BattleGrid_l: Record "BattleShip Grid";
//         k: Integer;
//     begin
//         for k := 1 to 10 do
//             if BattleGrid_l.Get(RecGame_g."No.", Player_g, Rec.Line, k) then begin
//                 if (BattleGrid_l."Boat Statut" = "Boat Statut"::" ") then
//                     BoatColor_l := '';

//                 if (BattleGrid_l."Boat Statut" = "Boat Statut"::Miss) then
//                     BoatColor_l := 'Subordinate';

//                 if (BattleGrid_l."Boat Statut" = "Boat Statut"::Hit) then
//                     BoatColor_l := 'Attention';

//                 if (BattleGrid_l."Boat Statut" = "Boat Statut"::Sinking) then
//                     BoatColor_l := 'Strong';
//             end;
//     end;
// }
