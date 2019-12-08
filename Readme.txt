*******Тест интернета*********
Данный скрипт проверяет наличие интернета 
и имеет возможность переподключать интернет на микротике 
после предлагает перезапуск служб которые работают через интернет.
такие как syncard.exe, Farcards.exe, MIDSERV.exe, wincas
Подключение происходит через ssh




*******Установка*********
1.Скачать putyy.exe и поместить в папку с скриптом
2.Скопировать каталог на диск С:\
3.Добавить в автозагрузку test_inet.vbs
4.Сделать импорт router.local.reg
5. Для настройки Mikrotik консоли набрать  
	/ip dns static add name=router.local address=192.168.1.1 --- адрес роутера
	/ip service set ssh address=192.168.1.10 --- адрес компьютера
6. Для настройки скрипта нужно сделать
	а) Отредактировать test_inet.vbs 
		изменить пароль доступа к SSH в строчке         WshShell.Run """putty.exe""-load router.local -pw admin",0
		изменить время запуска скрипта  в строчке       WScript.Sleep(1000 * 60 * 2) 1000мс * 60сек * 2мин --- время  2 минуты
		изменить какие службы перезапускаются в строчке	WshShell.Run "taskkill /f /im syncard.exe",0
								WshShell.Run "taskkill /f /im Farcards.exe",0
								WshShell.Run "taskkill /f /im MIDSERV.exe",0
								WshShell.Run "taskkill /f /im DOSCASH.EXE",0
								WshShell.Run """C:\RK7\sync115\syncard.exe""/desktop",1
								WshShell.Run """C:\Farcards\Farcards.exe""/desktop",1
								WshShell.Run """C:\RK7\RKEEPER\Rk7MidServer\MIDSERV.exe""/desktop",1
								WshShell.Run """C:\RK7\RKEEPER\Rk7Cash\wincash - Ярлык""",1

	б) Изменить в router.edit.reg IP-адресс Mikrotik "HostName"="router.local"
	   Имя пользователя в Mikrotik                   "UserName"="admin"
           Запуск комманды при разрыве соеденения        "RemoteCommand"="/system routerboard usb power-reset duration=10"


Для своей текущей задачи я использую строку команд /system routerboard usb power-reset duration=10
Можно использовать свой скрипт /system script run "Имя_нужного_скрипта" в Mikrotik
