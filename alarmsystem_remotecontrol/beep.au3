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
; Date: 2022-11-26
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

func copynewestCamShotToUploadFolder() 
	$newestPicture=findLatestFileInFolder($localcamshtDir,"*.png")
	FileCopy($newestPicture,$camshtDir,9)
endfunc

; Func: findLatestFileInFolder
; Searches the latest file in specified directory with specified mask
; Example of usage: FindLatestLog (@UserProfileDir & "\AppData\Roaming\Application", "*Waiter*.log")
Func findLatestFileInFolder ($dir, $mask)
   Local $latestTime = 0, $currentTime = 0
   Local $files = _FileListToArray($dir, $mask, 1)
   If @error = 1 Then
      ConsoleWrite('Func: FindLog, Error: Path was invalid.' & @CRLF)
      Return False
   EndIf
   If @error = 4 Then
      ConsoleWrite('Func: FindLog, Error: Log file was not found.' & @CRLF)
      Return False
   EndIf

   For $i = 1 To UBound($files) - 1
      $currentFile = $dir & "\" & $files[$i]
      $currentTime = FileGetTime($currentFile, $FT_MODIFIED, 1)
      If $currentTime > $latestTime Or $i = 1 Then
         $latestTime = $currentTime
         $latestFile = $currentFile
      EndIf
   Next

   ConsoleWrite( "Latest log file: " & $latestFile & ", time modified: " & $latestTime & @CRLF)
   Return $latestFile

EndFunc  

;----------------------------------------------------------
speak("beep")
