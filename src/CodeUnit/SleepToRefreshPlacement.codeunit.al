codeunit 50101 SleepToRefreshPlacement
{
    trigger OnRun()
    var
        RecordGame: Record "BattleShip Game";
        Result: Dictionary of [Text, Text];
        NoPartieText: Text[20];
        NoPartieCode: Code[20];
    begin
        //This CodeUnit Call the setbackgroundTask only if the Game Statut is on Placement
        //It check if the game statut change and pass to 'Game'
        Result := Page.GetBackgroundParameters();
        if not Evaluate(NoPartieText, result.Get('No.')) then
            Error('Could not parse parameter No Partie');

        NoPartieCode := CopyStr(NoPartieText, 1, MAXSTRLEN(NoPartieCode));
        while (RecordGame.Get(NoPartieCode)) and (RecordGame."Game Statut" = "Game Statut"::Placement) do
            Sleep(100);
        Page.SetBackgroundTaskResult(Result);
    end;
}
