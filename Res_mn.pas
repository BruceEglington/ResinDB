unit Res_mn;

interface

uses
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ComApp;

{$R *.DFM}

const
  CLASS_ComWebApp: TGUID = '{E0BF6FB4-7AEF-4086-99E2-96939F6E627E}';

initialization
  TWebAppAutoObjectFactory.Create(Class_ComWebApp,
    'ResinWeb', 'ResinWeb Object');

end.
