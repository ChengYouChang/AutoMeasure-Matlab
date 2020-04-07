clear all;
deviceObj = icdevice('matlab_rsscope_driver.mdd','TCPIP0::140.134.30.165::inst0::INSTR');
pause(5);
 connect(deviceObj);
 pause(3);
 groupObj = get(deviceObj, 'Configuration');%%因為 autoset 在 "Configuration" 模塊才有功能
 numberObj = get(deviceObj, 'configurationacquisition');
 rateObj = get(deviceObj, 'Configurationacquisition');
 historyObj = get(deviceObj, 'configurationdisplayhistory');
 dataObj = get(deviceObj, 'utilitydatamanagementwaveformexport');
 triggerObj = get(deviceObj, 'Configurationtrigger');
 errorObj = get(deviceObj, 'Utility');
  sampleObj = get(deviceObj, 'configurationconfigurationinformation');
  fileObj = get(deviceObj, 'utilitydatamanagementlongtermandmeashistogramsexport');
  file2Obj = get(deviceObj, 'utilitydatamanagementwaveformexport');
  channelObj= get(deviceObj, 'configurationchannel');
  error2Obj= get(deviceObj, 'utilityerrorinfo');
  %機器手臂 動完
  disp('Oscilloscope init finish!');
  
  
  %量測
  for i = 1:100
      filename = "\\CE216-CYChang\measuringData\"+i+".csv";
      invoke(groupObj, 'autoset');%%使用AUTOSET
      pause(5);
      disp('start saving file!');
      invoke (file2Obj, 'WaveformExportFile',filename);%%設定為CSV但有問
      disp('saving file finish!');
      pause(65);
  end
 %量完40~50 10
%機器手臂動

disconnect(deviceObj);