object IWServerController: TIWServerController
  OldCreateOrder = False
  AppName = 'ResinDB'
  ComInitialization = ciMultiThreaded
  Compression.Enabled = False
  Compression.Level = 6
  Description = 'Ion exchange Kd database'
  DisplayName = 'IntraWeb Application'
  Port = 8084
  Version = '15.2.23'
  OnNewSession = IWServerControllerBaseNewSession
  OnGetMainForm = IWServerControllerBaseGetMainForm
  Height = 310
  Width = 342
end
