local MenuManager = {} do
	function MenuManager:BuildMenuSection(tab)
	    local MenuGroup = Script.Tabs["Settings"]:AddLeftGroupbox("Menu")
  	    MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "LeftAlt", NoUI = true, Text = "Menu keybind" })
       	MenuGroup:AddButton("Unload", function() 
  	        Library:Unload() 
  	    end)
      	MenuGroup:AddButton("Copy Discord", function()
      	    setclipboard("https://discord.gg/8dxUzPna86")
      	end)
      	MenuGroup:AddButton("Join Discord", function()
       	    syn.request({
       	        Url = "http://127.0.0.1:6463/rpc?v=1",
  	             Method = "POST",
  	             Headers = {
  	                 ["Content-Type"] = "application/json",
  	                 ["origin"] = "https://discord.com",
  	             },
   	            Body = game:GetService("HttpService"):JSONEncode({
   	                ["args"] = {
   	                    ["code"] = "8dxUzPna86",
   	                },
   	                ["cmd"] = "INVITE_BROWSER",
   	                ["nonce"] = "."
        	    })
   	        })
       	end)
   	    Library.ToggleKeybind = Options.MenuKeybind
	end
end
return MenuManager
