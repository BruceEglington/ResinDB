object IWServerController: TIWServerController
  AppName = 'ResinDB'
  ComInitialization = ciMultiThreaded
  Description = 'Resin Database'
  DisplayName = 'ResinDB'
  Port = 8084
  SSLOptions.SSLVersion = SSLv3
  URLBase = '/resin/'
  Version = '16.1.8'
  ExceptionLogger.ReportInfos = [riAppInfo, riExceptionInfo, riIWAppInfo, riStackTrace]
  ExceptionLogger.Enabled = True
  HttpKeepAlive = True
  SessionOptions.SessionTimeout = 30
  OnNewSession = IWServerControllerBaseNewSession
  OnGetMainForm = IWServerControllerBaseGetMainForm
  Height = 319
  Width = 458
end
