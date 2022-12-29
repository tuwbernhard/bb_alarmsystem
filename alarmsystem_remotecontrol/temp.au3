;AutoIT 
;####################################################################################
; BB Fine Quality Software
; Project: BB Hightech Alarm System. Based on BB Soundlevel Detector
;
; Component: Temporary activity
;
; Purpose of this Component: Activate Sensor only for specificied timeframe
;
; Made with love by author: Bernhard Brenner <bernhard.brenner@tuwien.ac.at>
; Date: 2022-11-17
;####################################################################################

;BB Varname State Module 2022-06-27
;----------------------------------------------------------
global $sFilePath="state.ini"

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

;BB Sleeper module
;-------------------------------------------------------------
func smartSlp ($fkt=1) 
	$slf=1
	$sleeper=1000
	sleep($slf*$sleeper*$fkt)
endfunc
;-------------------------------------------------------------

;----------------------------------------------------------
run("act.exe")
smartSlp(Number($CmdLine[1]))
run("deact.exe")