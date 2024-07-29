codeunit 50103 "Game Mgt"
{
    procedure InitInsert(var "BattleShip Game Rec": Record "BattleShip Game"; var "BattleShip Game xRec": Record "BattleShip Game")
    var
        BattleShipSetUp: Record "BattleShip Setup";
        NoSeries: Codeunit "No. Series";
    begin
        //Set Automaticaly The Number of the Game and the Date
        "BattleShip Game Rec"."Posting Date" := WORKDATE();
        if "BattleShip Game Rec"."No." = '' then begin
            BattleShipSetUp.Get();
            BattleShipSetUp.TestField("No. Series");
            "BattleShip Game Rec"."No. Series" := BattleShipSetUp."No. Series";
            if NoSeries.AreRelated("BattleShip Game Rec"."No. Series", "BattleShip Game xRec"."No. Series") then
                "BattleShip Game Rec"."No. Series" := "BattleShip Game xRec"."No. Series";
            "BattleShip Game Rec"."No." := NoSeries.GetNextNo("BattleShip Game Rec"."No. Series", "BattleShip Game Rec"."Posting Date");
        end;
    end;


    procedure TestNoSeriesDate(No: Code[20]; NoSeriesCode: Code[20])
    var
        GlobalNoSeries: Record "No. Series";
    begin
        if (No <> '') and (NoSeriesCode <> '') then begin
            GlobalNoSeries.Get(NoSeriesCode);
            if GlobalNoSeries."Date Order" then
                Error('No valid Date');
        end;
    end;

    procedure IsNewUser()
    var
        PlayerTable: Record "BattleShip Player";
    begin
        if not PlayerTable.Get(UserId) then begin
            PlayerTable.Init();
            PlayerTable."User ID" := COPYSTR(Userid, 1, MAXSTRLEN(PlayerTable."User ID"));
            PlayerTable.Insert();
        end;
    end;

    procedure IsOtherPlayerBeenChoose("GameNo.": Code[20]; Player: Text[50]; xPlayer: Text[50])
    var
        GridRecord: Record "BattleShip Grid";
    begin
        GridRecord.Reset();
        if (Player <> xPlayer) then begin
            GridRecord.SetRange("No.Game", "GameNo.");
            GridRecord.SetRange("No.Player", xPlayer);
            GridRecord.DeleteAll();
        end;
    end;
}
