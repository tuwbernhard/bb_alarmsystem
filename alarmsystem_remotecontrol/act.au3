;AutoIT 
;####################################################################################
; BB Fine Quality Software
; Project: BB Hightech Alarm System. Based on BB Soundlevel Detector
;
; Component: Activation
;
; Purpose of this Component: Activate Sensor
;
; Made with love by author: Bernhard Brenner <bernhard.brenner@tuwien.ac.at>
; Date: 2022-06-03
;####################################################################################


;BB Varname State Module 2022-06-27
;----------------------------------------------------------
;geht nix: global $sFilePath="state.ini"

func writeState ($varname, $value)
	$sFilePath="state.ini"
	IniWrite($sFilePath, "simple", $varname, $value)
endfunc

func readState ($varname)
	$sFilePath="state.ini"
	return IniRead($sFilePath,"simple", $varname, "null")
endfunc

func flushstate () 
	writeState(1)
	$called=false
endfunc
;----------------------------------------------------------


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


;soundLevelChange(100)
speak("Alarmanlage scharf")
;soundLevelChange(-20)
writeState("sharp", "true")

