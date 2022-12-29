
;AutoIT 
;####################################################################################
; BB Fine Quality Software
; Project: BB Alarm System
;
; Component: Minimizer
;
; Purpose of this Component: Einfach alle Fensterchen minimieren. Das ist deswegen eine Herausforderung, weil du sicherstellen musst dass grade kein GUI-Programm läuft.
;
; Made with love by author: Bernhard Brenner <bernhard.brenner@tuwien.ac.at>
; Date: 2022-11-26
;####################################################################################


;Includes
#include <Array.au3>
#include <String.au3>
#include <../../lib/standardmailer_v1.au3>
;#include <../../lib/mutex.au3>
#include <../../lib/taz_v4_lib.au3>

;Stempel
Hotkeyset("{F2}", "beenden")

Func beenden ()
;das erste ist die frequenz das zweite ist das delay
	Beep(800, 200)
	Beep(200, 400)
	
	mutexOff("m")
	
	Exit
EndFunc


;Variablen


;Inits


;CONFIG
;-------------------------------------------------------------
global $sFilePath="./file/nullstate.ini"
global $waiter=12000
;-------------------------------------------------------------

oneProcess()

;Business Value here
;--------------------------------------------------------------------------------------------------------------------------
func main ()
	sleep(20000)
	Send("{LWINDOWN}d{LWINUP}")
endfunc
;--------------------------------------------------------------------------------------------------------------------------


func oneProcess()
	while (checkMutex("t") or checkMutex("m"))
		sleep(20)
	wend
	mutexOn("m")
	
	main()
	
	sleep(5000)
	
	mutexOff("m")
endfunc



func tabTo($url)
	Send("{CTRLDOWN}t{CTRLUP}")
	sleep(16000)
	Send($url)
	sleep(5000)
	Send("{ENTER}")
endfunc





func loginOetl () 
	Send("{CTRLDOWN}0{CTRLUP}")
	sleep(2000)
	MouseClick("left",737,456,1)
	sleep(2000)
	Send("{CTRLDOWN}a{CTRLUP}{BACKSPACE}oetlmin")
	sleep(2000)
	MouseClick("left",1208,497,1)
	sleep(2000)
	MouseClick("left",696,562,1)
	sleep(2000)
	Send("sjd2hba012kdm4u")
	sleep(2000)
	send("{ENTER}")
endfunc






;deInit


;Funktionen



func nachrichtenManager($url) 
	tabTo($url)

	
	$anzNeuerNachrichten=countMessages($cont)
	
	if(risen($anzNeuerNachrichten)) then
		mail()
	endif
	
endfunc

func closeTabs ()
	send("{CTRLDOWN}w{CTRLUP}")
	sleep(400)
	send("{CTRLDOWN}w{CTRLUP}")
	sleep(400)
	send("{CTRLDOWN}w{CTRLUP}")
endfunc

func mail()
	sendmail("marion.weiser@gmx.net", "Neue Anmeldungen für ÖTL Mitgliedschaft", "Hallo Marion, es gibt neue Nachrichten in der ÖTL Website Inbox. Es könnte sein, dass sich jemand für eine neue Mitgliedschaft angemeldet hat. Bitte gehe auf:http://www.oetl.at/wp-admin/admin.php?page=flamingo_inbound")
	sleep(20000)
	sendmail("renate.pessenlehner@gmx.at", "Neue Anmeldungen für ÖTL Mitgliedschaft", "Hallo Renate, es gibt neue Nachrichten in der ÖTL Website Inbox. Es könnte sein, dass sich jemand für eine neue Mitgliedschaft angemeldet hat. Bitte gehe auf:http://www.oetl.at/wp-admin/admin.php?page=flamingo_inbound")
	sleep(20000)
	sendmail("upo8@derbrenner.at", "Sent mail to M and R", "sbs job accomplished")
	sleep(20000)
endfunc



func getSubString($source, $openTag, $closeTag)

	$arr=_StringBetween($source, $openTag, $closeTag)
	if(ubound($arr)=0) then
		return "empty"
	else
		return $arr[0]
	endif
endfunc



func explorerTo($path) 
	Send("{LWINDOWN}e{LWINUP}")
	sleep($waiter*2)
	Send("{CTRLDOWN}l{CTRLUP}" & $path & "{ENTER}")
	sleep($waiter)
	Send("{LWINDOWN}{UP}{LWINUP}")
	sleep($waiter)
	MouseClick("left",958,18,1)
	sleep($waiter)
endfunc



func runterScrollenDefiniert($anz)
	for $i=1 to $anz step 1
		MouseClick("left",1915-5,1191-5,1,0)
		sleep(250)
	next
endfunc

func closetab ()
		Send("{CTRLDOWN}w{CTRLUP}")
endfunc

;-------------------------------------------------------------
;risen-module

;ein persistenter Schleppzeiger
func risen($val)
	$state=number(readState())
	
	if($val>$state) then	
		writeState($val)
		return True
	endif
	return false
endfunc



;make your job
;this is the MAIN function

func writeState ($state)
	IniWrite($sFilePath, "General", "state", $state)
endfunc

func writeStateAdv ($context, $state)
	IniWrite($sFilePath, $context, "state", $state)
endfunc

func readState ()
	return IniRead($sFilePath, "General", "state", "0")
endfunc

func readStateAdv ($context)
	return IniRead($sFilePath, $context, "state", "null")
endfunc





