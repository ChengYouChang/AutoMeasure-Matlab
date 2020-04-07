clear all;
deviceObj = icdevice('matlab_rsscope_driver.mdd','TCPIP0::140.134.30.165::inst0::INSTR');
pause(5);
 connect(deviceObj);
 pause(3);
 groupObj = get(deviceObj, 'Configuration');%%�]�� autoset �b "Configuration" �Ҷ��~���\��
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
  %�������u �ʧ�
  disp('Oscilloscope init finish!');
  
  
  %�q��
  for i = 1:100
      filename = "\\CE216-CYChang\measuringData\"+i+".csv";
      invoke(groupObj, 'autoset');%%�ϥ�AUTOSET
      pause(5);
      disp('start saving file!');
      invoke (file2Obj, 'WaveformExportFile',filename);%%�]�w��CSV������
      disp('saving file finish!');
      pause(65);
  end
 %�q��40~50 10
%�������u��

disconnect(deviceObj);