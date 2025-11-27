unit Unit3;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes;

type
  TIWForm_mn = class(TIWAppForm)
  public
  end;

implementation

{$R *.dfm}


initialization
  TIWForm_mn.SetAsMainForm;

end.
