if(b==0)
    a=1;
 invoke (errorObj, 'reset')%%�٭�
  pause(3);
  invoke (channelObj, 'ConfigureChannel', (2), (1), 0.5, 0.0,2);
  invoke (channelObj, 'ConfigureChannel', (3), (1), 0.5, 0.0,(2));
  pause(3);
 invoke(groupObj, 'autoset');%%�ϥ�AUTOSET
  pause(3);
 invoke(rateObj, 'configuretimebase',10E-6,3,false);%%���\�]�w TIME SCALE,�ɶ�%,�O�_�b�@�Ӯɶ��g����Ĳ�oTRIGGER
   pause(3);
 invoke(triggerObj, 'configuretriggerchannellevel',(1), (2), 2.6E+0);%%�]�mtrggerĲ�o�q�� ���� �P�@�Ӥ����D?���Ҷ�
   pause(3);
 invoke (numberObj, 'ConfigureNumberOfAverages', 2);%%�]�wTRIGGER����X��
   pause(3);
 invoke (dataObj, 'ConfigureWaveformExportMultichannel', (1));%%��� �h�q�D
   pause(3);
 invoke (dataObj, 'WaveformExportInterleavedXY', (1));%%��\XY�b
   pause(3);
 invoke ( historyObj, 'ConfigureHistoryState', (1), 1, (1));%%�ϥΩ�]�w���v�\��O�_���}
   pause(3);
 invoke (historyObj, 'ConfigureHistoryStartStop', (2),3, -1, 0);%%�]�w���v��������ĴX��
   pause(3);
 invoke (file2Obj, 'WaveformExportFile',"\\CE216-CYChang\measuringData\1.csv");%%�]�w��CSV�������D
   pause(3);
 invoke (dataObj, 'ConfigureWaveformExportScopeDataLogging', (1));%%�ϥ� DATALOGGING �\��(1)��ܧ�����v�����h����� �� ��@�@���S�w���
   pause(3);
 invoke (historyObj, 'HistoryPlaybackControl', (1), 1);%%start export
   pause(3);
 while(Ans~=0)
 Ans=invoke (error2Obj, 'GetError', 256, 'HistoryPlaybackControl');
 pause(5);
  end
if(Ans==0)
    a=0;
    b=1;
  Ans=1;
  pause(90);
end
end