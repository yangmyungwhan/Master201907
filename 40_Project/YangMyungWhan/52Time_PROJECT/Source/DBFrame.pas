unit DBFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DataAccessModule, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmDb = class(TForm)
    DBGrid3: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDb: TfrmDb;

implementation

{$R *.dfm}

end.
