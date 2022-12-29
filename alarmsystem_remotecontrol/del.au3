;AutoIT 
;####################################################################################
; BB Fine Quality Software
; Project: BB Hightech Alarm System. Based on BB Soundlevel Detector
;
; Component: Delayed start
;
; Purpose of this Component: Activate Sensor after defined delay
;
; Made with love by author: Bernhard Brenner <bernhard.brenner@tuwien.ac.at>
; Date: 2022-11-17
;####################################################################################

#include <File.au3>
#include <Array.au3>
#include <Constants.au3>
#include <GDIPlus.au3>


;BB Varname State Module 2022-06-27
;----------------------------------------------------------
global $sFilePath="state.ini"
global $camshtDir="C:\Users\bjoern\Desktop\gen2\file\gdrive_sync\bb_alarmsystem_livecam\"
global $localcamshtDir="C:\Users\bjoern\Desktop\gen2\file\localrotationalimagestorage/" 

func writeState ($varname, $value)
	IniWrite($sFilePath, "simple", $varname, $value)
endfunc

func readState ($varname)
	return IniRead($sFilePath,"simple", $varname, "null")
endfunc

func flushstate () 
	writeState(1)
	$called=false
endfunc


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
	Next

endfunc
;------------------------------------------------------------


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


func deleteCamShotsLocal () 
	local $bilder=_FileListToArray($camshtDir, "*.png", 1)
		for $i=1 to ubound($bilder)-1 step 1
			filedelete($camshtDir&"\"&$bilder[$i])
		next
endfunc

func deleteCamShotsUpld () 
	local $bilder=_FileListToArray($localcamshtDir, "*.png", 1)
		for $i=1 to ubound($bilder)-1 step 1
			filedelete($localcamshtDir&"\"&$bilder[$i])
		next
endfunc

;----------------------------------------------------------
smartSlp(1)
deleteCamShotsLocal()
deleteCamShotsUpld()
speak("Lösch-Befehl ausgeführt!")