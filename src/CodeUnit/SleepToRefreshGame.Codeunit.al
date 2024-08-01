codeunit 50100 SleepToRefreshGame
{
    trigger OnRun()
    var
        RecordGame: Record "BattleShip Game";
        Result: Dictionary of [Text, Text];
        NoPartieText: Text[20];
        NoPartieCode: Code[20];
        CurrPlayerTurn: Text[50];
    begin
        //This CodeUnit Call the setbackgroundTask only if the Player turn of BattleShipGame Has changed !
        //It check if the player turn changed every 100ms

        if not Evaluate(NoPartieText, Page.GetBackgroundParameters().Get('No.')) then
            Error('Could not parse parameter No Partie');
        if not Evaluate(CurrPlayerTurn, Page.GetBackgroundParameters().Get('CurrPlayerTurn')) then
            Error('Could not parse parameter Current Player Turn');

        NoPartieCode := CopyStr(NoPartieText, 1, MAXSTRLEN(NoPartieCode));
        while RecordGame.Get(NoPartieCode) and (RecordGame."Player Turn" = CurrPlayerTurn) and (RecordGame."Game Statut" = "Game Statut"::Game) do
            Sleep(100);
        Page.SetBackgroundTaskResult(Result);
    end;
}
