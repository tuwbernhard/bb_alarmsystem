;AutoIT 
;####################################################################################
; BB Fine Quality Software
; Project: BB Hightech Alarm System. Based on BB Soundlevel Detector
;
; Component: Main Component
;
; Purpose of this Component: Coordinates sound level sensitivity and ractions. Every reaction is a module.
;	Reacts upon defined sound level and triggers all available modules.
;
; Made with love by author: Bernhard Brenner <bernhard.brenner@tuwien.ac.at>
; Date: 2022-06-03
;####################################################################################

#include <GUIConstants.au3>
#include <File.au3>
#include <Array.au3>
#include "./Include/Utter.au3"

;Stempel
Hotkeyset("{F2}", "schliessen")

Func schliessen ()
	Beep(800, 200)
	Beep(200, 400)
	Exit
EndFunc


;Configuration
;-------------------------------------------------------------
$COOLDOWN_TIME=10*60

$sharp=True
$sensitivity=40 ;50 is like someone speaking in the microphone's room
;-------------------------------------------------------------

;-------------------------------------------------------------
;wird nur einmal, am anfang, ausgefuehrt
func startup()
	runAllAvailableModules("./startup/")
endfunc


func main()
	runAllAvailableModules("./modules/")
	smartslp(3)
endfunc
;-------------------------------------------------------------

func parameterMaintenance ()
	;speak("akt")
	if($sharp)then
		$sharpnessOld="true"
	Else
		$sharpnessOld="false"
	EndIf
	
	$sharpness=readState("sharp")
	if($sharpness="true") Then
		$sharp=true
	else
		$sharp=false
	EndIf
	
	;msgbox(0,"",$sharp)
	;msgbox(0,"",$sharpness)
	;msgbox(0,"",$sharpnessOld)
	if not($sharpnessOld = $sharpness) Then
		speak("jetzt")
	endif
	
	$sensitivity=number(readState("sensitivity"))
EndFunc


;Führt alle verfügbaren Module im Ordner aus.
func runAllAvailableModules ($modulepath)
	$dir=$modulepath
	Local $files = _FileListToArray($dir, "*.exe", 1)

	For $i = 1 To UBound($files) - 1
	  $currentFile = $dir & "\" & $files[$i]
	  ;msgbox(0,"",$currentFile)
	  runwait($currentFile)
	Next
endfunc

;Maschine
;--------------------------------------------------------------
startup()
$i=0
While (1)
	$soundLevel = _Utter_MIC_GetLevel()
	if($soundLevel>$sensitivity and $sharp)Then
		main()
		smartSlp($COOLDOWN_TIME)
	endif
	
	sleep(10)
	
	if(mod($i,30)=0) then	
		parameterMaintenance()
	endif
	
	if($i>300000000) Then
		$i=0
	endif
	
	$i=$i+1
WEnd

;-------------------------------------------------------------

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
	$oSp.Speak($text)
endfunc

Func speakGoogle($input)
    $temp = StringReplace($input, " ", "+")
    InetGet("http://translate.google.com/translate_tts?q=" & $temp, @TempDir & "\test.mp3")
    SoundPlay(@TempDir & "\test.mp3", 1)
    FileDelete(@TempDir & "\test.mp3")
EndFunc
;-------------------------------------------------------------


;BB Varname State Module 2022-06-27
;----------------------------------------------------------
;Muss im eigenen Ordner daneben liegen
global $sFilePath="../alarmsystem_remotecontrol/state.ini"

func writeState ($varname, $value)
	$sFilePath="../alarmsystem_remotecontrol/state.ini"
	IniWrite($sFilePath, "simple", $varname, $value)
endfunc

func readState ($varname)
	$sFilePath="../alarmsystem_remotecontrol/state.ini"
	return IniRead($sFilePath,"simple", $varname, "null")
endfunc

func flushstate () 
	writeState(1)
	$called=false
endfunc
;----------------------------------------------------------

