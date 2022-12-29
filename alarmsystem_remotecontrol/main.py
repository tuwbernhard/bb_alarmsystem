#usr/bin/env python3
#####################################################################################
# BB Patent Software
#
# Component: BB Telegram based remote control
#
# Purpose of this Component: Remote Control for Alarm System
#
# Author: Bernhard Brenner <bernhard@derbrenner.com>
# Date: 2022-06-27
#####################################################################################
import time
import datetime

from telethon import TelegramClient
import os
import logging


client = TelegramClient("YOURTOKENID",
"YOURCHANNELID","YOURACCESSTOKEN")

#Config
#-------------------------------------------------------------
FILE="lastmessage.txt"
DELAY=3
COOLDOWN=5
listOfSupportedCommands=["act", "deact", "sens", "delay", "temp", "del", "see", "reboot", "beep", "loud", "photoc", "optsens"]
logLevel=logging.INFO
logFile = 'BB_ALARMSYSTEM_LOG.log'
#-------------------------------------------------------------

def setupLogger ():
    log = logging.getLogger('BB Alarmsystem')
    log.setLevel(logLevel)

    # Add both Handlers
    log = logging.getLogger()
    log.setLevel(logLevel)

    log_formatter = logging.Formatter('%(asctime)s %(levelname)s: %(message)s',
                                      datefmt='%d/%m/%Y %H:%M:%S')

    # Setup File handler
    file_handler = logging.FileHandler(logFile)
    file_handler.setFormatter(log_formatter)
    file_handler.setLevel(logLevel)
    log.addHandler(file_handler) #write into files
    return log

async def getAllDialogs():
    # Now you can use all client methods listed below, like for example...
    dialogs=await client.get_dialogs()
    for dialog in dialogs:
        print(dialog.id, dialog)

async def main ():
    link=""
    while True:
        for message in (await receiveFromTelegram()):
            link=message.message.split("\n")[0]
            try:
                fh = open(FILE, "r")  # lesen
                linkOld=fh.read()
                fh.close()
            except:
                linkOld=""
        if not(link==linkOld and linkOld!=""):
            fh = open(FILE, "w")  # immer überschreiben
            fh.write(link)
            fh.close()
            
            #action
            #-------------------------------------------------------------
            action(link)
            #-------------------------------------------------------------
            
            
            time.sleep(COOLDOWN)
        time.sleep(DELAY)

def logMe (logmsg):
    log.info(str(logmsg))
    print(str(logmsg))


def action (command):
    if(" " in command):
        runcomd=command.split(" ")[0]
    else:
        runcomd=command
    if (runcomd in listOfSupportedCommands):
        if(command in ["act", "deact", "del", "see", "reboot", "beep"]):
            os.system(str(command)+".exe")
            logMe(timestamp() + " - executed command: " + str(command))

        else:
            if("optsens" in command):
               try:
                   param=int(command.split(" ")[1])
                   runcomd=command.split(" ")[0]
                   if(param>1000):
                       param=1000
                   if(param<0):
                       param=0
                   os.system(runcomd+".exe" +" " + str(param))
                   logMe(timestamp() + " - executed command: " + str(runcomd +" " + str(param)))
               except:
                   logMe(timestamp() + " - got erroneous command: " + str(command))
               return
               
            if("sens" in command):
                try:
                    param=int(command.split(" ")[1])
                    runcomd=command.split(" ")[0]
                    if(param>100):
                        param=100
                    if(param<0):
                        param=0
                    os.system(runcomd+".exe" +" " + str(param))
                    logMe(timestamp() + " - executed command: " + str(runcomd +" " + str(param)))
                except:
                    logMe(timestamp() + " - got erroneous command: " + str(command))
                return
                
            if("photoc" in command):
                try:
                    param=int(command.split(" ")[1])
                    runcomd=command.split(" ")[0]
                    if(param>600):
                        param=600
                    if(param<0):
                        param=0
                    os.system(runcomd+".exe" +" " + str(param))
                    logMe(timestamp() + " - executed command: " + str(runcomd +" " + str(param)))
                except:
                    logMe(timestamp() + " - got erroneous command: " + str(command))
                return
                
            if("loud" in command):
                try:
                    param=int(command.split(" ")[1])
                    runcomd=command.split(" ")[0]
                    if(param>100):
                        param=100
                    if(param<-100):
                        param=-100
                    os.system(runcomd+".exe" +" " + str(param))
                    logMe(timestamp() + " - executed command: " + str(runcomd +" " + str(param)))
                except:
                    logMe(timestamp() + " - got erroneous command: " + str(command))
                return
                
            if("delay" or "temp" in command):
                try:
                    runcomd=str(command.split(" ")[0]) 
                    param=int(command.split(" ")[1])
                    logMe(timestamp() + " - executing command: " + str(command))
                    os.system(runcomd+".exe"+" " + str(param))
                    logMe(timestamp() + " - executed command: " + str(command))
                except:
                    logMe(timestamp() + " - got erroneous command: " + str(command))
                return

def timestamp (): 
   return "{:%Y-%m-%d %H:%M:%S}".format(datetime.datetime.now())

async def sendToTelegram (text):
    await client.send_message(777000,text)

async def receiveFromTelegram ():
    return await client.get_messages(777000)

async def receiveFromFEPartAlert ():
    return await client.get_messages(-1001218633492)
    
#startup
log=setupLogger()

with client:
    client.loop.run_until_complete(main())
    
    
    