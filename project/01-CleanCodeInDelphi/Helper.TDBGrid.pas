unit Helper.TDBGrid;

interface

uses
  System.Classes,
  Vcl.DBGrids,
  System.SysUtils;

type
  TDBGridHelper = class helper for TDBGrid
    // TODO 1: Przedyskutowa� u�ycie
    procedure ForEachColumn (ProcedureToRun : TProc<TColumn>);
    // TODO 1: Doda� AutoResizeAllColumnsWidth
  end;

implementation

procedure TDBGridHelper.ForEachColumn (ProcedureToRun : TProc<TColumn>);
var
  Item: TCollectionItem;
  Column: TColumn;
begin
  for Item in Columns do
  begin
    Column := Item as TColumn;
    if Assigned(ProcedureToRun) then
      ProcedureToRun(Column);
  end;
end;

end.
