﻿Do While test1 = test2
'WScript.Sleep(1000 * 60 * 2)
set WshShell = CreateObject("WScript.Shell")
'Запускаем ping и ожидаем завершения его работы
Return = WshShell.Run("ping 8.8.8.8 ", 0, true)
If Return=0 then

Else result = MsgBox ("Нет связи с интернетом!" & Chr(10) & "Повторить подключения к интернету?", vbYesNo + vbSystemModal + vbExclamation, "Связь с сервером")
Select Case result
 Case vbYes 
WshShell.Run """putty.exe""-load router.local -pw admin",0
WScript.Sleep 5000
WshShell.Run "taskkill /f /IM putty.exe", 0
'Время установленно на 2 минуты (100 * 60 * 2)
'WScript.Sleep(1000 * 60 * 2) 
'Запускаем ping и ожидаем завершения его работы
Return = WshShell.Run("ping 8.8.8.8 ", 0, true)
If Return=0 then
MsgBox "Есть подключения интернета!!!!!", vbSystemModal + vbInformation, "Связь установленна!!"
task = MsgBox ("Перезапустить службы?", vbYesNo + vbSystemModal + vbExclamation, "Перезапуск служб")
Select Case task
Case vbYes
WshShell.Run "taskkill /f /im syncard.exe",0
WshShell.Run "taskkill /f /im Farcards.exe",0
WshShell.Run "taskkill /f /im MIDSERV.exe",0
WshShell.Run "taskkill /f /im DOSCASH.EXE",0
WScript.Sleep 5000
WshShell.Run """C:\RK7\sync115\syncard.exe""/desktop",1
WshShell.Run """C:\Farcards\Farcards.exe""/desktop",1
WshShell.Run """C:\RK7\RKEEPER\Rk7MidServer\MIDSERV.exe""/desktop",1
WshShell.Run """C:\RK7\RKEEPER\Rk7Cash\wincash - Ярлык""",1
Case vbNo
End Select
Else  
MsgBox "Нет подключения интернета!!!!!" & Chr(10) & " 1. Проверьте подключен USB модем к маршрутизатору?" & Chr(10) & " 2. Проверьте горят ли индикаторы на маршрутезаторе?" & Chr(10) & " 3. Свяжитесь с системным администратором если данная проблемма не решилась.", vbSystemModal + vbCritical, "Ошибка связи!!"
End If
 Case vbNo 
  MsgBox "Свяжитесь с системным АДМИНИСТРАТОРОМ!!!!!", vbSystemModal + vbInformation, "Ошибка связи!!"
End Select
End If
Loop
