------------------------------------------------------------------------
--	PhanxChat                                                         --
--	Removes chat frame clutter and adds some functionality.           --
--	by Phanx < addons@phanx.net >                                     --
--	Copyright © 2006–2010 Phanx. See README for license terms.        --
--	http://www.wowinterface.com/downloads/info6323-PhanxChat.html     --
--	http://wow.curse.com/downloads/wow-addons/details/phanxchat.aspx  --
------------------------------------------------------------------------

local _, PhanxChat = ...

function PhanxChat:EnableArrows(frame)
	local editBox = _G[frame:GetName() .. "EditBox"]
	if editBox then
		editBox:SetAltArrowKeyMode(not self.db.EnableArrows)
	end
end

function PhanxChat:SetEnableArrows(v)
	if self.debug then print("PhanxChat: SetEnableArrows", v) end
	if type(v) == "boolean" then
		self.db.EnableArrows = v
	end

	for frame in pairs(self.frames) do
		self:EnableArrows(frame)
	end
end

table.insert(PhanxChat.RunOnLoad, PhanxChat.SetEnableArrows)
table.insert(PhanxChat.RunOnProcessFrame, PhanxChat.EnableArrows)

------------------------------------------------------------------------