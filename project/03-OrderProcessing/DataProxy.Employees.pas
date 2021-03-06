unit DataProxy.Employees;

interface

uses
  Data.DB,
  Data.DataProxy,
  // FireDAC - TFDQuery ------------------------------
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.Stan.Param,
  FireDAC.Stan.Async;

(*
    Employees
    EMPLOYEEID: TIntegerField;
    LASTNAME: TWideStringField;
    FIRSTNAME: TWideStringField;
    TITLE: TWideStringField;
    TITLEOFCOURTESY: TWideStringField;
    BIRTHDATE: TDateField;
    HIREDATE: TDateField;
    ADDRESS: TWideStringField;
    CITY: TWideStringField;
    REGION: TWideStringField;
    POSTALCODE: TWideStringField;
    COUNTRY: TWideStringField;
    HOMEPHONE: TWideStringField;
    EXTENSION: TWideStringField;
    PHOTO: TBlobField;
    NOTES: TWideMemoField;
    REPORTSTO: TIntegerField;
    PHOTOPATH: TWideStringField;
*)

type
  TSomeProxy = class(TDatasetProxy)
  protected
    procedure ConnectFields; override;
  public
    procedure Open(OrderID: integer);
    procedure Close;
    // property DataSet: TDataSet read FDataSet;
  end;

implementation

uses
  System.SysUtils,
  Database.Connector;

const
  SQL_SELECT = x '';

procedure TSomeProxy.Close;
begin

end;

procedure TSomeProxy.ConnectFields;
begin
  x
end;

procedure TSomeProxy.Open(OrderID: integer);
var
  fdq: TFDQuery;
  cust: string;
  id: string;
begin
  if not Assigned(FDataSet) then
    raise Exception.Create('The DataSet is required');
  fdq := TFDQuery.Create(nil);
  fdq.SQL.Text := SQL_SELECT;
  fdq.Connection := GlobalConnector.GetMainConnection;
  FDataSet := fdq;
  FDataSet.Open;
  ConnectFields;
end;

end.
