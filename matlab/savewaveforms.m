if(b==0)
    a=1;
 invoke (errorObj, 'reset')%%還原
  pause(3);
  invoke (channelObj, 'ConfigureChannel', (2), (1), 0.5, 0.0,2);
  invoke (channelObj, 'ConfigureChannel', (3), (1), 0.5, 0.0,(2));
  pause(3);
 invoke(groupObj, 'autoset');%%使用AUTOSET
  pause(3);
 invoke(rateObj, 'configuretimebase',10E-6,3,false);%%成功設定 TIME SCALE,時間%,是否在一個時間週期內觸發TRIGGER
   pause(3);
 invoke(triggerObj, 'configuretriggerchannellevel',(1), (2), 2.6E+0);%%設置trgger觸發電壓 平到 與一個不知道?的模塊
   pause(3);
 invoke (numberObj, 'ConfigureNumberOfAverages', 2);%%設定TRIGGER抓取幾筆
   pause(3);
 invoke (dataObj, 'ConfigureWaveformExportMultichannel', (1));%%選取 多通道
   pause(3);
 invoke (dataObj, 'WaveformExportInterleavedXY', (1));%%選許XY軸
   pause(3);
 invoke ( historyObj, 'ConfigureHistoryState', (1), 1, (1));%%使用於設定歷史功能是否打開
   pause(3);
 invoke (historyObj, 'ConfigureHistoryStartStop', (2),3, -1, 0);%%設定歷史紀錄抓取第幾筆
   pause(3);
 invoke (file2Obj, 'WaveformExportFile',"\\CE216-CYChang\measuringData\1.csv");%%設定為CSV但有問題
   pause(3);
 invoke (dataObj, 'ConfigureWaveformExportScopeDataLogging', (1));%%使用 DATALOGGING 功能(1)表示抓取歷史紀錄多筆資料 或 單一一筆特定資料
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