;AutoIT 
;####################################################################################
; BB Fine Quality Software
; Project: Alarm machine
;
; Component: Main components
;
; Purpose of this Component: This is a lot machine that plays an alarm. It cannot be stopped and it plays it 50 times and speaks if desired.
;
; Made with love by author: Bernhard Brenner <bernhard.brenner@tuwien.ac.at>
; Date: 2022-06-03
;####################################################################################

;Config
; $speakPhase1="Attention please. Police call in 5 seconds. Turn off using PIN if this is a false alarm."
; $speakPhase2="Attention please. Automated Police call in progress."
; $speakPhase3="Attention please. Police call conducted. Police arrives until." & getCurTimeMinutesFuture(3)
$speakPhase1="Polizeiruf in 15 Sekunden. Schalten Sie mit der PIN aus."
$speakPhase2="Automatischer Polizeiruf in Bearbeitung."
$speakPhase3="Polizeiruf wird abgesetzt."
$anzAlurms=30

func alarm ()
	soundLevelZero()
	soundLevelChange(100)

	speak($speakPhase1)
	smartSlp(15)
	speak($speakPhase2)
	smartSlp(12)
	speak($speakPhase2)
	smartSlp(10)
	speak($speakPhase2)
	smartSlp(10)
	speak($speakPhase2)
	smartSlp(10)
	speak($speakPhase3)
	smartSlp(10)
	speak($speakPhase3)

	
	setOffCall()
	
	soundLevelChange(-35)
endfunc


;Maccina
alarm ()



;##################################################################################################################
;MODULES 
;##################################################################################################################

;Include this line if you need much
;-------------------------------------------------------------
;#include <modules.au3>

;-------------------------------------------------------------

;Set off call to police/friend/neighbor, using wav file with all necessary information, such as address, etc.
;Uses patented BB call module.
func setOffCall() 
	
	runwait("./prop/callmodule.exe")

endfunc

;BB time module
;2022-06-03
;-------------------------------------------------------------
#include <Date.au3>
#include <MsgBoxConstants.au3>

func getCurTimeSeconds () 
	return _NowTime(3)
endfunc

func getCurTimeMinutes () 
	return _NowTime(4)
endfunc

;Returns a time that lies $adv minutes in advance
func getCurTimeMinutesFuture ($adv) 
	$hr=@HOUR
	$min=@MIN
	
	$min=$min+$adv
	if($min>59)Then	
		$min=$min-60
		$hr=$hr+1
	endif
	
	;print($hr&":"&$min)
	return $hr&":"&$min
endfunc
;-------------------------------------------------------------



;Set System Soundlevel
;BB Patent 2022-06-03
;-------------------------------------------------------------
;Val can be positive or negative
func soundLevelChange($val)
	$cmd="{VOLUME_UP}"

	if($val<0) Then
		$val=abs($val)
		$cmd="{VOLUME_DOWN}"
	EndIf
	
	For $i=1 To $val/2 Step +1
		Send($cmd)
		sleep(10)
	Next

endfunc

;use with caution!
func soundLevelFull()
	For $i=1 To 150 Step +1
	Send("{VOLUME_UP}")
	sleep(10)
	Next
endfunc

func soundLevelZero()
	For $i=1 To 150 Step +1
	Send("{VOLUME_DOWN}")
	sleep(10)
	Next
endfunc
;---------------------------------------------------



;BB Sleeper module
;-------------------------------------------------------------
func smartSlp ($fkt=1) 
	$slf=1
	$sleeper=1000
	sleep($slf*$sleeper*$fkt)
endfunc
;-------------------------------------------------------------
;BB TTS Module
;-------------------------------------------------------------
func speak ($text)
	$oSp = ObjCreate("SAPI.SpVoice")
	$oSp.Speak($Text)
endfunc

Func speakGoogle($input)
    $temp = StringReplace($input, " ", "+")
    InetGet("http://translate.google.com/translate_tts?q=" & $temp, @TempDir & "\test.mp3")
    SoundPlay(@TempDir & "\test.mp3", 1)
    FileDelete(@TempDir & "\test.mp3")
EndFunc
;-------------------------------------------------------------




