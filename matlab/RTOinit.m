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
  description = zeros (256,1);%%存放狀態值
    Ans=1;
  pause(3);
  
  makemid ('rsscope')
  makemid ('rsscope', 'matlab_rsspecan_driver')
  instrhwinfo ('vxipnp', 'rsscope')
  makemid('rsscope', 'matlab_rsscope_driver');
  midedit('matlab_rsscope_driver.mdd')
  midedit
  makemid ('rsspecan', 'matlab_rsspecan_driver')