object IWServerController: TIWServerController
  AppName = 'ResinDB'
  ComInitialization = ciMultiThreaded
  Description = 'Ion exchange Kd database'
  DisplayName = 'ResinDB'
  Port = 8084
  Version = '15.6.1'
  HttpKeepAlive = True
  OnNewSession = IWServerControllerBaseNewSession
  OnGetMainForm = IWServerControllerBaseGetMainForm
  Height = 310
  Width = 342
end
