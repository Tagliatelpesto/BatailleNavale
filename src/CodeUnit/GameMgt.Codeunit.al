codeunit 50103 "Game Mgt"
{    /// <summary>
     /// Initialize a Record of a BattleShip Game and set his No Serie, No.
     /// </summary>
     /// <param name="BattleShip Game Rec">The current Record of the BattleShip Game</param>
     /// <param name="BattleShip Game xRec">The previous Rec of the BattleShip Game</param>
     /// <returns>No Return</returns>
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

    /// <summary>
    /// Test if the Date is valid for a No Serie and No.
    /// </summary>
    /// <param name="No">The No. of the BattleShip Game</param>
    /// <param name="NoSeriesCode">The No. Series code of the BattleShip Game</param>
    /// <returns>No Return</returns>
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
    /// <summary>
    /// Test if the User is a New One or Not and Create him if he's a new one
    /// </summary>
    /// <returns>No Return</returns>
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

    /// <summary>
    /// If The User Id of the Player as changed, delete his grid and his placed boat
    /// </summary>
    /// <param name="GameNo.">The No. of the current BattleShip Game</param>
    /// <param name="Player">The Current Player</param>
    /// <param name="xPlayer">The previous Player </param>

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
