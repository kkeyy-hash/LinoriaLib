local MenuManager = {} do
    MenuManager.Library = nil
    
    function MenuManager:BuildMenuSection(tab, lib)
	if self.Library == nil then self.Library = lib end
	self.Library:OnUnload(function()
            self.Library.Unloaded = true
        end)

        local MenuGroup = tab:AddLeftGroupbox("Menu")
        MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { Default = "LeftAlt", NoUI = true, Text = "Menu keybind" })
        MenuGroup:AddButton("Unload", function() 
            self.Library:Unload() 
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
        self.Library.ToggleKeybind = Options.MenuKeybind
    end
end
return MenuManager
