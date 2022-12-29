;AutoIT 
;####################################################################################
; BB Fine Quality Software
; Project: BB Alarm System
;
; Component: Video Capture
;
; Purpose of this Component: Continuous Collection of Pictures. For Upload or further processing.
;
; Made with love by author: Bernhard Brenner <bernhard.brenner@tuwien.ac.at>
; Date: 2022-11-24
;####################################################################################



$WM_CAP_START = 0x400
$WM_CAP_UNICODE_START = $WM_CAP_START +100 
$WM_CAP_PAL_SAVEA = $WM_CAP_START + 81 
$WM_CAP_PAL_SAVEW = $WM_CAP_UNICODE_START + 81 
$WM_CAP_UNICODE_END = $WM_CAP_PAL_SAVEW 
$WM_CAP_ABORT = $WM_CAP_START + 69 
$WM_CAP_DLG_VIDEOCOMPRESSION = $WM_CAP_START + 46 
$WM_CAP_DLG_VIDEODISPLAY = $WM_CAP_START + 43 
$WM_CAP_DLG_VIDEOFORMAT = $WM_CAP_START + 41 
$WM_CAP_DLG_VIDEOSOURCE = $WM_CAP_START + 42 
$WM_CAP_DRIVER_CONNECT = $WM_CAP_START + 10 
$WM_CAP_DRIVER_DISCONNECT = $WM_CAP_START + 11 
$WM_CAP_DRIVER_GET_CAPS = $WM_CAP_START + 14 
$WM_CAP_DRIVER_GET_NAMEA = $WM_CAP_START + 12 
$WM_CAP_DRIVER_GET_NAMEW = $WM_CAP_UNICODE_START + 12 
$WM_CAP_DRIVER_GET_VERSIONA = $WM_CAP_START + 13 
$WM_CAP_DRIVER_GET_VERSIONW = $WM_CAP_UNICODE_START + 13 
$WM_CAP_EDIT_COPY = $WM_CAP_START + 30 
$WM_CAP_END = $WM_CAP_UNICODE_END 
$WM_CAP_FILE_ALLOCATE = $WM_CAP_START + 22 
$WM_CAP_FILE_GET_CAPTURE_FILEA = $WM_CAP_START + 21 
$WM_CAP_FILE_GET_CAPTURE_FILEW = $WM_CAP_UNICODE_START + 21 
$WM_CAP_FILE_SAVEASA = $WM_CAP_START + 23 
$WM_CAP_FILE_SAVEASW = $WM_CAP_UNICODE_START + 23 
$WM_CAP_FILE_SAVEDIBA = $WM_CAP_START + 25 
$WM_CAP_FILE_SAVEDIBW = $WM_CAP_UNICODE_START + 25 
$WM_CAP_FILE_SET_CAPTURE_FILEA = $WM_CAP_START + 20 
$WM_CAP_FILE_SET_CAPTURE_FILEW = $WM_CAP_UNICODE_START + 20 
$WM_CAP_FILE_SET_INFOCHUNK = $WM_CAP_START + 24 
$WM_CAP_GET_AUDIOFORMAT = $WM_CAP_START + 36 
$WM_CAP_GET_CAPSTREAMPTR = $WM_CAP_START + 1 
$WM_CAP_GET_MCI_DEVICEA = $WM_CAP_START + 67 
$WM_CAP_GET_MCI_DEVICEW = $WM_CAP_UNICODE_START + 67 
$WM_CAP_GET_SEQUENCE_SETUP = $WM_CAP_START + 65 
$WM_CAP_GET_STATUS = $WM_CAP_START + 54 
$WM_CAP_GET_USER_DATA = $WM_CAP_START + 8 
$WM_CAP_GET_VIDEOFORMAT = $WM_CAP_START + 44 
$WM_CAP_GRAB_FRAME = $WM_CAP_START + 60 
$WM_CAP_GRAB_FRAME_NOSTOP = $WM_CAP_START + 61 
$WM_CAP_PAL_AUTOCREATE = $WM_CAP_START + 83 
$WM_CAP_PAL_MANUALCREATE = $WM_CAP_START + 84 
$WM_CAP_PAL_OPENA = $WM_CAP_START + 80 
$WM_CAP_PAL_OPENW = $WM_CAP_UNICODE_START + 80 
$WM_CAP_PAL_PASTE = $WM_CAP_START + 82 
$WM_CAP_SEQUENCE = $WM_CAP_START + 62 
$WM_CAP_SEQUENCE_NOFILE = $WM_CAP_START + 63 
$WM_CAP_SET_AUDIOFORMAT = $WM_CAP_START + 35 
$WM_CAP_SET_CALLBACK_CAPCONTROL = $WM_CAP_START + 85 
$WM_CAP_SET_CALLBACK_ERRORA = $WM_CAP_START + 2 
$WM_CAP_SET_CALLBACK_ERRORW = $WM_CAP_UNICODE_START + 2 
$WM_CAP_SET_CALLBACK_FRAME = $WM_CAP_START + 5 
$WM_CAP_SET_CALLBACK_STATUSA = $WM_CAP_START + 3 
$WM_CAP_SET_CALLBACK_STATUSW = $WM_CAP_UNICODE_START + 3 
$WM_CAP_SET_CALLBACK_VIDEOSTREAM = $WM_CAP_START + 6 
$WM_CAP_SET_CALLBACK_WAVESTREAM = $WM_CAP_START + 7 
$WM_CAP_SET_CALLBACK_YIELD = $WM_CAP_START + 4 
$WM_CAP_SET_MCI_DEVICEA = $WM_CAP_START + 66 
$WM_CAP_SET_MCI_DEVICEW = $WM_CAP_UNICODE_START + 66 
$WM_CAP_SET_OVERLAY = $WM_CAP_START + 51 
$WM_CAP_SET_PREVIEW = $WM_CAP_START + 50 
$WM_CAP_SET_PREVIEWRATE = $WM_CAP_START + 52 
$WM_CAP_SET_SCALE = $WM_CAP_START + 53 
$WM_CAP_SET_SCROLL = $WM_CAP_START + 55 
$WM_CAP_SET_SEQUENCE_SETUP = $WM_CAP_START + 64 
$WM_CAP_SET_USER_DATA = $WM_CAP_START + 9 
$WM_CAP_SET_VIDEOFORMAT = $WM_CAP_START + 45 
$WM_CAP_SINGLE_FRAME = $WM_CAP_START + 72 
$WM_CAP_SINGLE_FRAME_CLOSE = $WM_CAP_START + 71 
$WM_CAP_SINGLE_FRAME_OPEN = $WM_CAP_START + 70 
$WM_CAP_STOP = $WM_CAP_START + 68

#include <GUIConstants.au3>
#include <File.au3>
#include <Array.au3>
#include <Constants.au3>
#include <GDIPlus.au3>
#include <ScreenCapture.au3>

$avi = DllOpen("avicap32.dll")
$user = DllOpen("user32.dll")

;CONFIG
;-------------------------------------------------------------
global $savepath = "YOURSAVEPATHHERE" 
global $localSavePath = "YOURSAVEPATHHERE" 
global $uploadpath="YOURSAVEPATHHERE"
$countmax=3600*24*2
$camslptime=1; zeit zwischen zwei shots in Sekunden
$camFastModeCountInitial=200; wenn jemand da ist, werden X bilder in high frequency geschossen
$recognitionSensitivity=20
;-------------------------------------------------------------

;AUTOVARS
;-------------------------------------------------------------
$camFastModeCount=$camFastModeCountInitial
$sharp="false"
$sharpness="false"
$sharpnessOld="false"
global $counter=1
;-------------------------------------------------------------

$Main = GUICreate("BB Alarm System Live-Video",660,500)
$cap = DllCall($avi, "int", "capCreateCaptureWindow", "str", "cap", "int", BitOR($WS_CHILD,$WS_VISIBLE), "int", 15, "int", 15, "int", 640, "int", 480, "hwnd", $Main, "int", 1)

DllCall($user, "int", "SendMessage", "hWnd", $cap[0], "int", $WM_CAP_DRIVER_CONNECT, "int", 0, "int", 0)
DllCall($user, "int", "SendMessage", "hWnd", $cap[0], "int", $WM_CAP_SET_SCALE, "int", 1, "int", 0)
DllCall($user, "int", "SendMessage", "hWnd", $cap[0], "int", $WM_CAP_SET_OVERLAY, "int", 1, "int", 0)
DllCall($user, "int", "SendMessage", "hWnd", $cap[0], "int", $WM_CAP_SET_PREVIEW, "int", 1, "int", 0)
DllCall($user, "int", "SendMessage", "hWnd", $cap[0], "int", $WM_CAP_SET_PREVIEWRATE, "int", 1, "int", 0)

GUISetState(@SW_SHOW)
$pic=""
$picOld=""

;Maschine
;-------------------------------------------------------------
While 1
	parameterMaintenance ()

	if($sharp="true") then
		$picOld=findLatestFileInFolder($savepath, "*.png"); kann ja auch ein getriggertes sein, n?
		$pic=$savepath&"_"&$counter&"_"&".png"
		
		SnapShot($pic)
		rotatePicture($pic)
		
		if not (compareSimilar($picOld,$pic,$recognitionSensitivity) or $picOld="" or $counter < 20) then
			speak("Person erkannt!")
			;soundLevelChange(5)
			FileCopy($pic, $uploadpath,9)
			
			fastMode($camFastModeCount)
		endif
		
		$counter=$counter+1
	endif

    $msg = GUIGetMsg()
    If $msg = $GUI_EVENT_CLOSE Then
        DllCall($user, "int", "SendMessage", "hWnd", $cap[0], "int", $WM_CAP_END, "int", 0, "int", 0)
        DllCall($user, "int", "SendMessage", "hWnd", $cap[0], "int", $WM_CAP_DRIVER_DISCONNECT, "int", 0, "int", 0)
        DllClose($user)
        Exit
    EndIf
	
	if($counter>=$countmax) Then
		$counter=0; rotierendes überschreiben der bilder
	endif

	
	smartSlp($camslptime)
Wend
;-------------------------------------------------------------

;das macht er erst nach einem trigger!
func fastMode ($anzFotos)
	
	$savepath=$uploadpath

	for $i=1 to $anzFotos step 1
		$fn=$savepath&"_"&$counter&"_"&".png"
		SnapShot($fn)
		rotatePicture($fn)
		FileCopy($fn, $localSavePath, 9); zusätzlich werden die bilder auch offline gespeichert.
		
		$sharpness=readState("sharp")
		if not ($sharpness="true") Then
			speak("Breche Überwachung ab")
			ExitLoop
		EndIf
		
		smartSlp(0.1); bisschen sleepen sollte man immer. sonst wirds schnell stressig.
		$counter=$counter+1
	Next
	
	$savepath=$localSavePath
endfunc

Func SnapShot($savepath)
    DllCall($user, "int", "SendMessage", "hWnd", $cap[0], "int", $WM_CAP_GRAB_FRAME_NOSTOP, "int", 0, "int", 0)
    DllCall($user, "int", "SendMessage", "hWnd", $cap[0], "int", $WM_CAP_FILE_SAVEDIBA, "int", 0, "str", $savepath)
EndFunc


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

func normstempelMitZeitFileName ()

	;opt("sendkeydelay", 50)
	local $monate[12]=["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	$curday=@MDAY
	$curmon=@MON
	$curyear=@YEAR
	$curHour=@HOUR
	$curMin=@MIN
	
	return (""&$curyear & "-" & $curmon & "-" & $curday & "_" & $curHour & "-" & $curMin)
endfunc

;kümmert sich ums up to date halten aller variablen parameter.
func parameterMaintenance ()

	$recognitionSensitivity=readState("opticalSensitivity")
	$camFastModeCount=readState("fastModePhotoCount")

	;speak("akt")
	if($sharp) then
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
		if($sharpness="true") Then
			;soundLevelChange(-100)
			;soundLevelChange(80)
			speak("Live Videoüberwachung aktiviert")
			;soundLevelChange(-100)
			;soundLevelChange(30)
		Else
			;soundLevelChange(-100)
			;soundLevelChange(80)
			speak("Live Videoüberwachung deaktiviert")
			;soundLevelChange(-100)
			;soundLevelChange(30)
		endif
	endif
	
	$sharpnessOld=$sharpness
EndFunc

;modules
;-----------------------------------------------------------------------------------------------------------


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

;BB Sleeper module
;-------------------------------------------------------------
func smartSlp ($fkt=1) 
	$slf=1
	$sleeper=1000
	sleep($slf*$sleeper*$fkt)
endfunc
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


;BB Optical Recognition Module
;unglaublich dass ich schon so weit bin
;Date 2022-11-24
;-------------------------------------------------------------
func compareSimilar ($file1,$file2, $sensitivity=1.41)
	$sensor=$sensitivity*$sensitivity
	$a=getMetricFromPicture($file1)
	$b=getMetricFromPicture($file2)
	if((($a-$b)*($a-$b))<=$sensor) then
		return true
	else
		return false
	endif
endfunc

;Basierend auf den erhaltenen Werten: Durchschnittshelligkeit und 
;Standardabweichung der Helligkeit wird eine Metrik für dieses Bild 
;berechnet, die einer Bandbreite von 1-1000 entspricht.
func getMetricFromPicture ($path)
	;pfad bei bedarf ändern halt.
	$data=getPictureData($path)

	if ubound($data)<=0 then
		return 0
	endif
	
	return getMetricFromData($data[0],$data[1])
endfunc

;Basierend auf den erhaltenen Werten: Durchschnittshelligkeit und 
;Standardabweichung der Helligkeit wird eine Metrik für dieses Bild 
;berechnet, die einer Granularität von 1-1000 entspricht.
func getMetricFromData ($mean, $stddev)
	$scaler=1000/(255+127.5)
	$val=($mean/2)+($stddev)
	$bbMetric=$val*$scaler
	return $bbMetric
endfunc


;Function borrowed from: ;https://www.autoitscript.com/forum/topic/201876-suggestions-on-how-to-measure-general-brightness-of-an-image/
;----------------------------------------------------------------------------
;Where the mean should be low for darker image and Standard Deviation 
;also low for darker. I'm applying it for each component RGB, because global 
;color doesn't say much.  Also going with a single (or a few) value, 
;you will loose the StdDev significance.
;I don't think anyone will argue that the lower is the mean 
;(closer to 0), it implies that the image is quite dark. 
;But even with a somewhat low mean, if you got a high StdDev, 
;it implies that there is high contrast.  I would assume there 
;is some brightness although part of the image is black.  
;So StdDev must be low as well.  Of course this is untested, 
;and you will have to adjust the threshold of those indicator to 
;fit your requirements.
;---------------------------------------------------------------------------- 
func getPictureData ($path)
local $res[3]

_GDIPlus_Startup ()
$hBitmap = _GDIPlus_BitmapCreateFromFile ($path)
$hBitMapResized = _GDIPlus_ImageResize ($hBitmap, 20, 20)
$tBitmapData = _GDIPlus_BitmapLockBits ($hBitMapResized, 0, 0, 20, 20, $GDIP_ILMREAD, $GDIP_PXF32ARGB)
$iScan0 = DllStructGetData($tBitmapData, "Scan0")
$tPixel = DllStructCreate("int[400];", $iScan0)
Local $iMean = 0, $iStdDev = 0, $r, $g, $b
For $i = 1 to 400
  Split (DllStructGetData ($tPixel, 1, $i), $r, $g, $b)
  $iMean += $r+$g+$b
Next
$iMean /= 1200
For $i = 1 to 400
  Split (DllStructGetData ($tPixel, 1, $i), $r, $g, $b)
  $iStdDev += ($r-$iMean)^2
  $iStdDev += ($g-$iMean)^2
  $iStdDev += ($b-$iMean)^2
Next
$iStdDev = Sqrt($iStdDev/1200)
;MsgBox ($MB_SYSTEMMODAL,"",$iMean & "/" & $iStdDev)
;MsgBox ($MB_SYSTEMMODAL,"",$path)

$res[1]=$iMean
$res[2]=$iStdDev

_GDIPlus_BitmapUnlockBits($hBitMapResized, $tBitmapData)
_GDIPlus_BitmapDispose($hBitmap)
_GDIPlus_BitmapDispose($hBitMapResized)
_GDIPlus_Shutdown ()

return $res

endfunc

Func Split ($c, ByRef $r, ByRef $g, ByRef $b)
  $r = bitshift(bitand ($c,0xff0000),16)
  $g = bitshift(bitand ($c,0xff00),8)
  $b = bitand ($c,0xff)
EndFunc
;-------------------------------------------------------------

;Kamera ist derzeit auf Seitenwand aufgeklebt. Bild muss daher um 90 Grad gedreht werden.
func rotatePicture ($path)
	;Opt("MustDeclareVars", 1)

	Global $hBitmap, $hImage, $hImage_new, $sCLSID, $tData, $tParams

	_GDIPlus_StartUp()

	$hImage_new = _GDIPlus_ImageLoadFromFile($path)
	;$hImage_new = _GDIPlus_ImageResize($hImage, 100, 80) ;resize image
	_GDIPlus_ImageRotateFlip($hImage_new, 1)
	_GDIPlus_ImageSaveToFile($hImage_new, $path)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_ImageDispose($hImage_new)
	_GDIPlus_ShutDown()
endfunc
