--THIS PROGRAM LISTENS FOR BROADCASTS
local component = require("component")
local term = require("term")
local event = require("event")
local modem = component.modem
print("Enter the port number to listen: ")
s = io.read()
modem.open(s)

while true do
  local _,_,remoteNetwork,_,_,input = event.pull("modem_message")
  print("Command received: " .. input)
  
  if input == "server.status" then
    modem.send(remoteNetwork, 111, "Online")
  else
    modem.send(remoteNetwork, 111, " ")
  end
end
 
