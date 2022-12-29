;AutoIT 
;####################################################################################
; BB Fine Quality Software
; Project: BB Hightech Alarm System. Based on BB Soundlevel Detector
;
; Component: Sensitivity
;
; Purpose of this Component: Set Sensor Sensitivity
;
; Made with love by author: Bernhard Brenner <bernhard.brenner@tuwien.ac.at>
; Date: 2022-06-03
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
;----------------------------------------------------------
writeState("sensitivity", $CmdLine[1])
