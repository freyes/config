local device = "wlan0"

wifiwidget = widget({type = "textbox", name = "wifiwidget", align = "right" })
txrxwidget = widget({type = "textbox", name = "txrxwidget", align = "right" })

function wifiInfo(adapter)
   spacer = " "
   local f = io.open("/sys/class/net/"..adapter.."/wireless/link")
   local wifiStrength = f:read()
   if wifiStrength == "0" then
      wifiStrength = "Network Down"
   else
      if tonumber(wifiStrength) < 50 then
         wifiStrength = "<span foreground=\"red\">"..wifiStrength.."</span>"
      end
      wifiStrength = "Wifi:"..spacer..wifiStrength.."%"
   end
   wifiwidget.text = spacer..wifiStrength..spacer
   f:close()
end

function txrxInfo(adapter)
   spacer = " / "
   local tx_f = io.open("/sys/class/net/"..adapter.."/statistics/tx_bytes")
   local rx_f = io.open("/sys/class/net/"..adapter.."/statistics/rx_bytes")
   local tx_mbytes = tostring(math.floor(tonumber(tx_f:read()) / 1024 / 1024))
   local rx_mbytes = tostring(math.floor(tonumber(rx_f:read()) / 1024 / 1024))

   txrxwidget.text = "TX:"..tx_mbytes.."mb"..spacer.."RX:"..rx_mbytes.."mb"
   tx_f:close()
   rx_f:close()
end

awful.hooks.timer.register(5, function()
                                 wifiInfo(device)
                              end)
awful.hooks.timer.register(5, function()
                                 txrxInfo(device)
                              end)
