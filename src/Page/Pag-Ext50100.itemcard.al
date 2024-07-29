pageextension 50100 "item card" extends "Item Card"
{
    trigger OnModifyRecord(): Boolean
    begin
        Message('ok');
    end;
}
