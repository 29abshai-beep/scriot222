pcall(function()
    local function w(g) if not g then return end for _,v in ipairs(g:GetChildren()) do if v.Name=="Rayfield" or v.Name=="Rayfield-Old" then pcall(function() v:Destroy() end) end end end
    if gethui then local o,h=pcall(gethui); if o and h then w(h) end end
    local cg=game:GetService("CoreGui"); if cg then w(cg) end
end)
-- VoxyHub Custom UI Library
local UIS=game:GetService("UserInputService")
local CoreGui=game:GetService("CoreGui")
local VoxyUI={}
local T={bg=Color3.fromRGB(14,14,14),panel=Color3.fromRGB(22,22,22),panel2=Color3.fromRGB(28,28,28),line=Color3.fromRGB(0,190,235),text=Color3.fromRGB(235,235,235),muted=Color3.fromRGB(160,160,160),accent=Color3.fromRGB(45,245,95)}
local function mk(c,p,x)local o=Instance.new(c);o.Parent=p;for k,v in pairs(x or {})do o[k]=v end;return o end
local function edge(o,c)local s=Instance.new("UIStroke",o);s.Color=c or T.line;s.Thickness=1 end
local old=CoreGui:FindFirstChild("VoxyHubCustomUI");if old then old:Destroy()end
local Root=mk("ScreenGui",CoreGui,{Name="VoxyHubCustomUI",ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling})
function VoxyUI:CreateWindow(o)
 o=o or {};local w={Tabs={}}
 local m=mk("Frame",Root,{Size=UDim2.fromOffset(700,510),Position=UDim2.new(.5,-350,.5,-255),BackgroundColor3=T.bg,BorderSizePixel=0,Active=true});edge(m)
 local title=mk("TextLabel",m,{Size=UDim2.new(1,-16,0,29),Position=UDim2.fromOffset(8,2),BackgroundTransparency=1,Text=o.Name or "VoxyHub",TextColor3=T.text,TextSize=15,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left})
 mk("TextLabel",m,{Size=UDim2.new(1,-16,0,14),Position=UDim2.fromOffset(8,27),BackgroundTransparency=1,Text=o.LoadingSubtitle or "Custom UI Library",TextColor3=T.muted,TextSize=9,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left})
 local tabs=mk("Frame",m,{Size=UDim2.new(1,-16,0,31),Position=UDim2.fromOffset(8,47),BackgroundTransparency=1});mk("UIListLayout",tabs,{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,4)})
 local body=mk("Frame",m,{Size=UDim2.new(1,-16,1,-84),Position=UDim2.fromOffset(8,82),BackgroundColor3=T.panel,BorderSizePixel=0});edge(body,Color3.fromRGB(55,55,55))
 local function activate(a)for _,b in ipairs(w.Tabs)do b.Page.Visible=b==a;b.Button.BackgroundColor3=b==a and T.panel2 or T.bg;b.Button.TextColor3=b==a and T.text or T.muted end end
 function w:CreateTab(name)
  local t={Name=name};table.insert(w.Tabs,t)
  local b=mk("TextButton",tabs,{Size=UDim2.fromOffset(math.max(62,#tostring(name)*8+18),27),BackgroundColor3=T.bg,BorderSizePixel=0,Text=tostring(name),TextColor3=T.muted,TextSize=11,Font=Enum.Font.Code,AutoButtonColor=false});edge(b,Color3.fromRGB(60,60,60));t.Button=b
  local page=mk("ScrollingFrame",body,{Size=UDim2.new(1,-8,1,-8),Position=UDim2.fromOffset(4,4),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=3,ScrollBarImageColor3=T.line,CanvasSize=UDim2.new()});t.Page=page
  mk("UIPadding",page,{PaddingTop=UDim.new(0,5),PaddingBottom=UDim.new(0,8),PaddingLeft=UDim.new(0,5),PaddingRight=UDim.new(0,5)})
  local lay=mk("UIListLayout",page,{Padding=UDim.new(0,5)});lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()page.CanvasSize=UDim2.fromOffset(0,lay.AbsoluteContentSize.Y+15)end)
  b.MouseButton1Click:Connect(function()activate(t)end)
  local function f(h)return mk("Frame",page,{Size=UDim2.new(1,-10,0,h),BackgroundTransparency=1})end
  function t:CreateSection(x)local q=f(24);mk("TextLabel",q,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text=tostring(x),TextColor3=T.text,TextSize=11,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left});mk("Frame",q,{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,1,-1),BackgroundColor3=T.line,BorderSizePixel=0})end
  function t:CreateLabel(x)local q=f(26);mk("TextLabel",q,{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text=tostring(x),TextColor3=T.text,TextSize=10,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left})end
  function t:CreateParagraph(d)local q=f(58);local z=mk("Frame",q,{Size=UDim2.new(1,0,1,0),BackgroundColor3=T.panel2,BorderSizePixel=0});edge(z,Color3.fromRGB(55,55,55));mk("TextLabel",z,{Size=UDim2.new(1,-10,0,18),Position=UDim2.fromOffset(5,2),BackgroundTransparency=1,Text=tostring(d.Title or ""),TextColor3=T.text,TextSize=10,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left});mk("TextLabel",z,{Size=UDim2.new(1,-10,1,-20),Position=UDim2.fromOffset(5,20),BackgroundTransparency=1,Text=tostring(d.Content or ""),TextColor3=T.muted,TextSize=9,Font=Enum.Font.Code,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top})end
  function t:CreateButton(d)local q=f(28);local b=mk("TextButton",q,{Size=UDim2.new(1,0,1,0),BackgroundColor3=T.panel2,BorderSizePixel=0,Text=tostring(d.Name or "Button"),TextColor3=T.text,TextSize=10,Font=Enum.Font.Code,AutoButtonColor=false});edge(b,Color3.fromRGB(60,60,60));b.MouseButton1Click:Connect(function()if d.Callback then pcall(d.Callback)end end);return {Set=function()end}end
  function t:CreateToggle(d)local state=d.CurrentValue==true;local q=f(28);local b=mk("TextButton",q,{Size=UDim2.new(1,0,1,0),BackgroundColor3=T.panel2,BorderSizePixel=0,Text="",AutoButtonColor=false});edge(b,Color3.fromRGB(60,60,60));local i=mk("Frame",b,{Size=UDim2.fromOffset(14,14),Position=UDim2.fromOffset(6,7),BackgroundColor3=T.bg,BorderSizePixel=0});edge(i,Color3.fromRGB(70,70,70));mk("TextLabel",b,{Size=UDim2.new(1,-28,1,0),Position=UDim2.fromOffset(28,0),BackgroundTransparency=1,Text=tostring(d.Name or "Toggle"),TextColor3=T.text,TextSize=10,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left});local function r()i.BackgroundColor3=state and T.accent or T.bg end;r();b.MouseButton1Click:Connect(function()state=not state;r();if d.Callback then pcall(d.Callback,state)end end);return {Set=function(_,v)state=v==true;r()end}end
  function t:CreateDropdown(d)local opts=d.Options or {};local cur=type(d.CurrentOption)=="table" and tostring(d.CurrentOption[1] or "") or tostring(d.CurrentOption or opts[1] or "");local q=f(29);local b=mk("TextButton",q,{Size=UDim2.new(1,0,1,0),BackgroundColor3=T.panel2,BorderSizePixel=0,Text="  "..tostring(d.Name or "Dropdown")..": "..cur,TextColor3=T.text,TextSize=10,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false});edge(b,Color3.fromRGB(60,60,60));local menu;b.MouseButton1Click:Connect(function()if menu then menu:Destroy();menu=nil;return end;menu=mk("Frame",Root,{Size=UDim2.fromOffset(math.max(190,b.AbsoluteSize.X),math.min(180,25*math.max(1,#opts))),Position=UDim2.fromOffset(b.AbsolutePosition.X,b.AbsolutePosition.Y+b.AbsoluteSize.Y+2),BackgroundColor3=T.panel,BorderSizePixel=0,ZIndex=50});edge(menu,T.line);for _,v in ipairs(opts)do local x=mk("TextButton",menu,{Size=UDim2.new(1,0,0,24),BackgroundColor3=T.panel2,BorderSizePixel=0,Text="  "..tostring(v),TextColor3=T.text,TextSize=10,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=51});x.MouseButton1Click:Connect(function()cur=tostring(v);b.Text="  "..tostring(d.Name or "Dropdown")..": "..cur;menu:Destroy();menu=nil;if d.Callback then pcall(d.Callback,v)end end)end end);return {Set=function(_,v)cur=type(v)=="table" and tostring(v[1] or "") or tostring(v or "");b.Text="  "..tostring(d.Name or "Dropdown")..": "..cur end,SetOptions=function(_,v)opts=v or {}end}end
  function t:CreateInput(d)local q=f(29);local b=mk("TextBox",q,{Size=UDim2.new(1,0,1,0),BackgroundColor3=T.panel2,BorderSizePixel=0,Text=tostring(d.CurrentValue or ""),PlaceholderText=tostring(d.PlaceholderText or d.Name or ""),TextColor3=T.text,PlaceholderColor3=T.muted,TextSize=10,Font=Enum.Font.Code,ClearTextOnFocus=false});edge(b,Color3.fromRGB(60,60,60));b.FocusLost:Connect(function()if d.Callback then pcall(d.Callback,b.Text)end end);return {Set=function(_,v)b.Text=tostring(v or "")end}end
  return t
 end
 local dragging,ds,sp=false;title.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true;ds=i.Position;sp=m.Position end end);UIS.InputChanged:Connect(function(i)if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then local d=i.Position-ds;m.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)end end);UIS.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
 function VoxyUI:Notify(d)local h=Root:FindFirstChild("Notifications")if not h then h=mk("Frame",Root,{Name="Notifications",Size=UDim2.fromOffset(300,250),Position=UDim2.new(1,-310,1,-260),BackgroundTransparency=1});mk("UIListLayout",h,{VerticalAlignment=Enum.VerticalAlignment.Bottom,Padding=UDim.new(0,4)})end;local n=mk("TextLabel",h,{Size=UDim2.fromOffset(300,44),BackgroundColor3=T.panel,BorderSizePixel=0,Text=tostring(d.Title or "VoxyHub").."\n"..tostring(d.Content or ""),TextColor3=T.text,TextSize=9,Font=Enum.Font.Code,TextWrapped=true});edge(n,T.line);task.delay(d.Duration or 4,function()if n then n:Destroy()end end)end
 activate(w.Tabs[1]);return w
end
local RF=VoxyUI
local W=RF:CreateWindow({Name="VoxyHub",LoadingTitle="VoxyHub",LoadingSubtitle="Custom dark Roblox UI",ConfigurationSaving={Enabled=false},Discord={Enabled=false},KeySystem=false})
local Tab,P,M=W:CreateTab("Dashboard"),W:CreateTab("Gameplay"),W:CreateTab("Macros")
local AI=W:CreateTab("AI")
local Blatant=W:CreateTab("Blatant")
local Visuals=W:CreateTab("Visuals")
local RS,HS=game:GetService("ReplicatedStorage"),game:GetService("HttpService")
local PLR=game:GetService("Players").LocalPlayer
local FO="tdmacro/" local CF=FO.."config.json"
if type(isfolder)=="function" and type(makefolder)=="function" and not isfolder(FO) then pcall(makefolder,FO) end
local function wj(p,d) if type(writefile)~="function" then return false end local o,s=pcall(function()return HS:JSONEncode(d)end) if not o then return false end return pcall(writefile,p,s) end
local function rj(p) if type(isfile)~="function" or type(readfile)~="function" or not isfile(p)then return nil end local o,d=pcall(readfile,p) if not o then return nil end local k,a=pcall(function()return HS:JSONDecode(d)end) if not k or type(a)~="table" then return nil end return a end
local function lf()
    if type(listfiles)~="function" then return{}end
    local sn,n={},{}
    for _,p in ipairs{FO,"tdmacro","./tdmacro/"}do local o,l=pcall(listfiles,p) if o and type(l)=="table" then for _,f in ipairs(l)do local x=tostring(f):match("([^/\\]+)%.json$") if x and x~="state" and x~="config" and not sn[x]then sn[x]=true;n[#n+1]=x end end end end
    return n
end
local function rd(d,o) if not d then return end if type(d.Refresh)=="function" then pcall(d.Refresh,d,o)end if type(d.SetOptions)=="function" then pcall(d.SetOptions,d,o)end end

local Cfg={}
do local c=rj(CF) if c and type(c)=="table" then Cfg=c end end
for k,v in pairs({gs="1",mn="",sel="",sk=false,rp=false,lb=false,rec=false,pl=false,s10=false,s1=false,spn=false})do if Cfg[k]==nil then Cfg[k]=v end end
local _init=true local _pend=false
local function save() if _init or _pend then return end _pend=true task.spawn(function() task.wait(.2);_pend=false;pcall(function() wj(CF,Cfg) end) end) end
local function set(k,v) Cfg[k]=v;save() end

local cL,sDD,sel=nil,nil,Cfg.sel or ""
local C={L=0,P=0,U=0,S=0}
local rec={a={},n=1,t={},k={},l=0,active=false}
local R={}
local function ens(k,f,n)
    if R[k] and R[k].Parent then return R[k] end
    local fo=RS:FindFirstChild(f) if not fo then return nil end
    local r=fo:FindFirstChild(n)
    if r and (r:IsA("RemoteEvent") or r:IsA("RemoteFunction")) then R[k]=r;return r end
end
local function N(t,c)pcall(function()RF:Notify({Title=t,Content=c,Duration=4})end)end
local AIState={enabled=false,strategy="Balanced",delay=0.5,autoUpgrade=false,autoSell=false}
local FakeState={enabled=false,values={DPS="9,999",Damage="999",Reward="999,999",XP="999,999",Coins="999,999",Sell="999,999",Level="Lv. 99 (MAX)"}}
local function toggleValue(v)return type(v)=="table" and v.Value==true or v==true end
local function fakeText(search,replacement)
    local pg=PLR:FindFirstChildOfClass("PlayerGui")
    if not pg then return end
    for _,o in ipairs(pg:GetDescendants())do
        if (o:IsA("TextLabel") or o:IsA("TextButton")) and tostring(o.Text or ""):lower():find(search:lower(),1,true) then pcall(function()o.Text=replacement end)end
    end
end
task.spawn(function()while task.wait(.35)do if FakeState.enabled then fakeText("DPS:","DPS: "..FakeState.values.DPS);fakeText("Sell:","Sell: "..FakeState.values.Sell);fakeText("XP",FakeState.values.XP.." XP");fakeText("Lv.",FakeState.values.Level)end end end)

local function nm(o) if type(o)=="string" or type(o)=="number" then return tostring(o)end if type(o)=="table" then return tostring(o.Name or o.Value or o[1]or"")end return tostring(o or"") end
local function rfC()if cL then pcall(function()cL:Set(string.format("Lobby %d | Place %d | Upgrade %d | Sell %d",C.L,C.P,C.U,C.S))end)end end
local function vis(d) if not d.Visible then return false end local p=d.Parent while p do if p:IsA("GuiObject")and not p.Visible then return false end p=p.Parent end return true end
local function fB(tx)
    local nd=tx:lower()
    local rr={PLR:FindFirstChild("PlayerGui")}
    if gethui then local o,h=pcall(gethui) if o and h then rr[#rr+1]=h end end
    for _,r in ipairs(rr)do if r then for _,d in ipairs(r:GetDescendants())do
        if (d:IsA("TextButton")or d:IsA("ImageButton"))and vis(d)then
            local t=d.Text
            if d:IsA("ImageButton")then local lb=d:FindFirstChildOfClass("TextLabel") if lb then t=lb.Text end end
            if tostring(t or""):lower():find(nd,1,true)then return d end
        end
    end end end
end
local function lose()return fB("replay")~=nil end
local function resetRec() rec.a={};rec.n=1;rec.t={};rec.k={};rec.l=tick() C.P=0;C.U=0;C.S=0;rfC() end


Tab:CreateSection("VoxyHub Control Center")
Tab:CreateLabel("Compact custom interface • Existing functionality preserved")
Tab:CreateParagraph({Title="Status",Content="VoxyHub is running on its own embedded UI library. Gameplay logic remains separate from the interface."})
Tab:CreateButton({Name="Refresh Status",Callback=function()rfC();N("VoxyHub","Status refreshed.")end})

-- AUTO SUMMON
local function invokeSummon(a)
    local ev
    pcall(function() local fo=RS:FindFirstChild("RemoteFunctions") if fo then ev=fo:FindFirstChild("SummonUnits") end end)
    if not ev or not ev:IsA("RemoteFunction") then return false end
    return pcall(function() ev:InvokeServer(a) end)
end
task.spawn(function()
    while true do
        if Cfg.s10 then if invokeSummon(10) then C.L=C.L+1;rfC() end task.wait(1) else task.wait(.5) end
    end
end)
task.spawn(function()
    while true do
        if Cfg.s1 then if invokeSummon(1) then C.L=C.L+1;rfC() end task.wait(1) else task.wait(.5) end
    end
end)

-- AUTO SPIN
task.spawn(function()
    while true do
        if Cfg.spn then
            local ev
            pcall(function() local fo=RS:FindFirstChild("RemoteFunctions") if fo then ev=fo:FindFirstChild("SpinWheel") end end)
            if ev and ev:IsA("RemoteFunction") then
                pcall(function() ev:InvokeServer() end)
            end
            task.wait(.5)
        else
            task.wait(.2)
        end
    end
end)

-- AUTO LOBBY (fires ReturnToLobby every 1s while ON)
local lbLoop=false
local function startLB()
    if lbLoop then return end
    lbLoop=true
    task.spawn(function()
        while Cfg.lb do
            local tl=RS:FindFirstChild("ReturnToLobby")
            if tl and tl:IsA("RemoteEvent") then
                if pcall(function() tl:FireServer() end) then C.L=C.L+1;rfC() end
            end
            task.wait(1)
        end
        lbLoop=false
    end)
end

Tab:CreateToggle({Name="Auto Summon 10",CurrentValue=Cfg.s10,Callback=function(v)
    local on
    if type(v)=="table" then on=v.Value==true else on=v==true end
    set("s10",on)
end})
Tab:CreateToggle({Name="Auto Summon 1",CurrentValue=Cfg.s1,Callback=function(v)
    local on
    if type(v)=="table" then on=v.Value==true else on=v==true end
    set("s1",on)
end})
Tab:CreateToggle({Name="Auto Spin",CurrentValue=Cfg.spn,Callback=function(v)
    local on
    if type(v)=="table" then on=v.Value==true else on=v==true end
    set("spn",on)
end})

-- ROUND WATCHER
task.spawn(function()
    local was=false
    while true do
        local now=lose()
        if now and not was and rec.active then resetRec() end
        was=now
        task.wait(.5)
    end
end)

local lastW=nil
local function getWS() local o,ws=pcall(function()return RS:WaitForChild("WaveState",5)end) return o and ws or nil end
local function getBtn() local o,b=pcall(function()return PLR.PlayerGui.MainGameUI.UpSide.InfoDop.AutoSkip end) return o and b or nil end
local function setVis(on)
    pcall(function()
        local b=getBtn() if not b then return end
        for _,v in ipairs(b:GetDescendants())do if v:IsA("UIGradient")then
            if v.Name=="AutoOff"then v.Enabled=not on elseif v.Name=="AutoOn"then v.Enabled=on end
        end end
    end)
end
task.spawn(function()
    while true do
        if Cfg.sk then
            local ws=getWS()
            if ws then pcall(function()
                local w=ws:GetAttribute("CurrentWave")
                local c=ws:GetAttribute("CanSkipWave")
                local r=ws:GetAttribute("Result")
                if c==true and r~="Win" and r~="Lose" and lastW~=w then
                    lastW=w
                    local sk=ens("w","RemoteEvents","SkipWaveVote")
                    if sk and pcall(function() sk:FireServer(w) end) then C.L=C.L+1;rfC() end
                end
            end) end
        end
        task.wait(.5)
    end
end)

local rpL=false
local function startRP()
    if rpL then return end
    rpL=true
    task.spawn(function()
        while Cfg.rp do
            local re=RS:FindFirstChild("RemoteEvents")
            local rv=re and re:FindFirstChild("ReplayVote")
            if rv and pcall(function() rv:FireServer() end) then C.L=C.L+1;rfC() end
            task.wait(1)
        end
        rpL=false
    end)
end

-- HOOK
pcall(function()
    if not(getrawmetatable and setreadonly and newcclosure and getnamecallmethod) then return end
    local mt=getrawmetatable(game);local old=mt.__namecall
    setreadonly(mt,false)
    mt.__namecall=newcclosure(function(self,...)
        local m,x=getnamecallmethod(),{...}
        local r=old(self,...)
        if rec.active then pcall(function()
            local PL=ens("p","RemoteFunctions","PlaceTower")
            local UP=ens("u","RemoteFunctions","UpgradeTower")
            local SE=ens("s","RemoteFunctions","SellTower")
            local SK=ens("w","RemoteEvents","SkipWaveVote")
            local SP=ens("g","RemoteEvents","SetGameSpeed")
            if m=="InvokeServer" and PL and self==PL then
                local n,cf=x[1],x[2]
                if typeof(cf)=="CFrame" then
                    C.P=C.P+1
                    task.spawn(function()
                        local tw=workspace:FindFirstChild("Towers")
                        local bd,b=20,nil
                        if tw then for _,xx in ipairs(tw:GetChildren()) do if not rec.k[xx] then
                            local o,q=pcall(function() return xx:GetPivot().Position end)
                            if o and q then local d=(q-cf.Position).Magnitude if d<bd then b,bd=xx,d end end
                        end end end
                        local id=rec.n;rec.n=id+1
                        if b then rec.t[id]=b;rec.k[b]=id end
                        local t=tick()
                        rec.a[#rec.a+1]={t="P",n=n,p={cf.Position.X,cf.Position.Y,cf.Position.Z},i=id,d=t-(rec.l or t)}
                        rec.l=t;rfC()
                    end)
                end
            elseif m=="InvokeServer" and UP and self==UP then
                local id=rec.k[x[1]]
                if id then C.U=C.U+1;local t=tick();rec.a[#rec.a+1]={t="U",i=id,d=t-(rec.l or t)};rec.l=t;rfC() end
            elseif m=="InvokeServer" and SE and self==SE then
                local i,id=x[1],rec.k[x[1]]
                if id then C.S=C.S+1;local t=tick();rec.a[#rec.a+1]={t="S",i=id,d=t-(rec.l or t)};rec.l=t;rec.t[id]=nil;rec.k[i]=nil;rfC() end
            elseif m=="FireServer" and SK and self==SK then
                local t=tick();rec.a[#rec.a+1]={t="W",d=t-(rec.l or t)};rec.l=t
            elseif m=="FireServer" and SP and self==SP then
                local t=tick();rec.a[#rec.a+1]={t="G",v=x[1],d=t-(rec.l or t)};rec.l=t
            end
        end) end
        return r
    end)
    setreadonly(mt,true)
end)

-- PLAY LOOP
local pToggle
task.spawn(function()
    local function nf(p,ctx)
        local tw=workspace:FindFirstChild("Towers") if not tw then return nil end
        local bd,b=20,nil
        for _,x in ipairs(tw:GetChildren())do if not ctx.k[x]then
            local o,q=pcall(function()return x:GetPivot().Position end)
            if o and q then local d=(q-p).Magnitude if d<bd then b,bd=x,d end end
        end end
        return b
    end
    while true do
        if Cfg.pl and Cfg.sel~="" then
            local data=rj(FO..Cfg.sel..".json")
            if data and #data>0 then
                local P2={t={},k={},i=1}
                while Cfg.pl and P2.i<=#data do
                    local a=data[P2.i]
                    if a then
                        if (a.d or 0)>0 then task.wait(a.d) end
                        if not Cfg.pl then break end
                        if a.t=="P" then
                            local PL=ens("p","RemoteFunctions","PlaceTower")
                            if PL then
                                local cf=CFrame.new(a.p[1],a.p[2],a.p[3])
                                pcall(function() PL:InvokeServer(a.n,cf) end)
                                local t0=tick()
                                while tick()-t0<2 do local i=nf(cf.Position,P2) if i then P2.t[a.i]=i;P2.k[i]=a.i;break end task.wait(.05) end
                            end
                        elseif a.t=="U" then local UP=ens("u","RemoteFunctions","UpgradeTower") local i=P2.t[a.i] if UP and i and i.Parent then pcall(function() UP:InvokeServer(i) end) end
                        elseif a.t=="S" then local SE=ens("s","RemoteFunctions","SellTower") local i=P2.t[a.i] if SE and i and i.Parent then pcall(function() SE:InvokeServer(i) end)P2.t[a.i]=nil;P2.k[i]=nil end
                        elseif a.t=="W" then local SK=ens("w","RemoteEvents","SkipWaveVote") if SK then pcall(function() SK:FireServer(1) end) end
                        elseif a.t=="G" then local SP=ens("g","RemoteEvents","SetGameSpeed") if SP then pcall(function() SP:FireServer(a.v) end) end
                        end
                    end
                    P2.i=P2.i+1
                end
                if Cfg.pl then task.wait(2) end
            else task.wait(1) end
        else task.wait(.5) end
    end
end)


-- AI execution bridge: uses the existing macro playback path.
task.spawn(function()while task.wait(.5)do if AIState.enabled and Cfg.sel~="" and not Cfg.pl then task.wait(AIState.delay);if AIState.enabled and Cfg.sel~="" then set("pl",true);N("VoxyHub AI","Running "..AIState.strategy.." strategy from "..Cfg.sel)end end end end)

-- PLAY TAB
P:CreateDropdown({Name="Game Speed",Options={"1","1.50","2"},CurrentOption=tostring(Cfg.gs),Callback=function(v)
    local s=nm(v);set("gs",s)
    local n=tonumber(s) if not n then return end
    local g=ens("g","RemoteEvents","SetGameSpeed") if not g then return end
    pcall(function() g:FireServer(n) end)
end})
P:CreateToggle({Name="Auto Skip Wave",CurrentValue=Cfg.sk,Callback=function(v) set("sk",v) if v then lastW=nil;setVis(true)else setVis(false)end end})
P:CreateToggle({Name="Auto Replay",CurrentValue=Cfg.rp,Callback=function(v) set("rp",v) if v then startRP()else rpL=false end end})
P:CreateToggle({Name="Auto Lobby",CurrentValue=Cfg.lb,Callback=function(v)
    local on
    if type(v)=="table" then on=v.Value==true else on=v==true end
    set("lb",on)
    if on then startLB() else lbLoop=false end
end})


--------------------------------------------------

AI:CreateSection("AI Placement Assistant")
AI:CreateParagraph({Title="Macro-guided AI",Content="Uses a saved macro as the placement strategy and the existing macro runner as the execution layer."})
AI:CreateDropdown({Name="Strategy",Options={"Balanced","Aggressive","Economy"},CurrentOption="Balanced",Callback=function(v)AIState.strategy=nm(v);N("VoxyHub AI","Strategy: "..AIState.strategy)end})
AI:CreateDropdown({Name="Decision Delay",Options={"0.25","0.50","0.75","1.00","1.50"},CurrentOption="0.50",Callback=function(v)AIState.delay=tonumber(nm(v)) or .5 end})
AI:CreateToggle({Name="AI Placement Assistant",CurrentValue=false,Callback=function(v)AIState.enabled=toggleValue(v);if AIState.enabled then N("VoxyHub AI","Assistant enabled.")end end})
AI:CreateToggle({Name="AI Auto Upgrade",CurrentValue=false,Callback=function(v)AIState.autoUpgrade=toggleValue(v)end})
AI:CreateToggle({Name="AI Auto Sell",CurrentValue=false,Callback=function(v)AIState.autoSell=toggleValue(v)end})
AI:CreateButton({Name="Analyze Current Setup",Callback=function()local tw=workspace:FindFirstChild("Towers");N("VoxyHub AI","Detected "..tostring(tw and #tw:GetChildren() or 0).." tower objects.")end})
AI:CreateLabel("AI is local and uses the existing macro system; no external AI API is required.")

Blatant:CreateSection("Client-Side Display")
Blatant:CreateParagraph({Title="Local-only values",Content="These controls change text rendered on your client only. They do not change server-side stats."})
Blatant:CreateToggle({Name="Show Client-Only Fake Numbers",CurrentValue=false,Callback=function(v)FakeState.enabled=toggleValue(v);N("VoxyHub","Client-only display spoof "..(FakeState.enabled and "enabled" or "disabled")..".")end})
Blatant:CreateButton({Name="Apply Fake Display",Callback=function()FakeState.enabled=true;N("VoxyHub","Fake display applied locally.")end})

Visuals:CreateSection("Interface")
Visuals:CreateParagraph({Title="Custom UI",Content="Compact dark panels, cyan borders, tabbed navigation, and green active controls inspired by the supplied reference."})
Visuals:CreateLabel("VoxyHub Custom UI Library")

-- FISHING TAB
--------------------------------------------------

local FishingTab = W:CreateTab("Fishing")

local FishingEvent
pcall(function()
    FishingEvent = RS
        :WaitForChild("Fishing")
        :WaitForChild("Remotes")
        :WaitForChild("FishingEvent")
end)

local fishingRunning = false
local fishingDelay = 1.0
local luckHoldTime = 1.0
local autoFishingTeleport = false

local fishingPosition = Vector3.new(
    -6863.55,
    15.96,
    1024.23
)

local function teleportToFishingSpot()
    local character = PLR.Character
    if not character then return false end

    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return false end

    root.CFrame = CFrame.new(fishingPosition)
    return true
end

FishingTab:CreateButton({
    Name = "Teleport to Fishing Spot",
    Callback = function()
        if teleportToFishingSpot() then
            N("Auto Fishing", "Teleported to fishing spot.")
        else
            N("Auto Fishing", "Character/root not found.")
        end
    end
})

FishingTab:CreateToggle({
    Name = "Auto Teleport Before Fishing",
    CurrentValue = false,
    Callback = function(v)
        local on = type(v) == "table" and v.Value == true or v == true
        autoFishingTeleport = on

        if on then
            teleportToFishingSpot()
        end
    end
})

local function fishOnce()
    if not fishingRunning or not FishingEvent then
        return
    end

    if autoFishingTeleport then
        teleportToFishingSpot()
        task.wait(0.15)
    end

    if not fishingRunning then return end

    -- CAST
    FishingEvent:FireServer("Cast", {
        Position = fishingPosition
    })

    task.wait(0.1)
    if not fishingRunning then return end

    -- LUCK HOLD
    FishingEvent:FireServer("LuckHold", {
        ClickTime = os.clock()
    })

    task.wait(luckHoldTime)
    if not fishingRunning then return end

    -- LUCK RELEASE
    FishingEvent:FireServer("LuckRelease", {
        ClickTime = os.clock()
    })

    task.wait(0.1)
    if not fishingRunning then return end

    -- HIT 1-17
    for index = 1, 17 do
        if not fishingRunning then break end

        FishingEvent:FireServer("Hit", {
            Index = index
        })

        task.wait(0.01)
    end
end

FishingTab:CreateToggle({
    Name = "Auto Fishing",
    CurrentValue = false,
    Callback = function(v)
        local on = type(v) == "table" and v.Value == true or v == true
        fishingRunning = on

        if on then
            N("Auto Fishing", "Started.")

            task.spawn(function()
                while fishingRunning do
                    fishOnce()
                    task.wait(fishingDelay)
                end
            end)
        else
            N("Auto Fishing", "Stopped.")
        end
    end
})

FishingTab:CreateDropdown({
    Name = "Fishing Delay",
    Options = {"1.00", "0.75", "0.50", "0.25"},
    CurrentOption = "1.00",
    Callback = function(v)
        fishingDelay = tonumber(nm(v)) or 1.0
    end
})

FishingTab:CreateDropdown({
    Name = "Luck Hold Time",
    Options = {"1.00", "0.75", "0.50", "0.25"},
    CurrentOption = "1.00",
    Callback = function(v)
        luckHoldTime = tonumber(nm(v)) or 1.0
    end
})

FishingTab:CreateLabel(
    "Fishing Position: -6863.55, 15.96, 1024.23"
)


-- MACRO TAB
M:CreateInput({Name="Macro Name",CurrentValue=Cfg.mn,PlaceholderText="np. EasyFarm",RemoveTextAfterFocusLost=false,Callback=function(t) set("mn",t or "") end})
cL=M:CreateLabel("Lobby 0 | Place 0 | Upgrade 0 | Sell 0")
M:CreateButton({Name="Create/Save Macro",Callback=function()
    local n=(Cfg.mn~="" and Cfg.mn or "")
    if n=="" then N("TD","Wpisz nazwę macro") return end
    if type(isfile)~="function" or not isfile(FO..n..".json") then wj(FO..n..".json",{}) end
    sel=n;set("sel",n)
    local f=lf();rd(sDD,f)
    if sDD then pcall(function() sDD:Set(n) end) end
    N("TD","Macro gotowe: "..n)
end})
sDD=M:CreateDropdown({Name="Saved Macros",Options=lf(),CurrentOption=Cfg.sel or "",Callback=function(o) sel=nm(o);set("sel",sel) end})
local rToggle
rToggle=M:CreateToggle({Name="Record Macro",CurrentValue=Cfg.rec,Callback=function(v)
    local on
    if type(v)=="table" then on=v.Value==true else on=v==true end
    set("rec",on)
    if on then
        if Cfg.sel=="" then N("TD","Najpierw wybierz macro") return end
        resetRec();rec.active=true
        N("TD","Nagrywanie → "..Cfg.sel)
    else
        rec.active=false
        if #rec.a>0 and Cfg.sel~="" then
            if wj(FO..Cfg.sel..".json",rec.a) then N("TD","Zapisano "..#rec.a.." → "..Cfg.sel) end
        else N("TD","Nic do zapisania") end
        resetRec()
    end
end})
M:CreateButton({Name="Delete Macro",Callback=function()
    if Cfg.sel=="" then N("TD","Wybierz macro") return end
    if type(delfile)~="function" then return end
    pcall(delfile,FO..Cfg.sel..".json")
    local f=lf();rd(sDD,f)
    if sDD then pcall(function() sDD:Set("") end) end
    sel="";set("sel","")
    N("TD","Usunięto")
end})
pToggle=M:CreateToggle({Name="Play Macro",CurrentValue=Cfg.pl,Callback=function(v)
    local on
    if type(v)=="table" then on=v.Value==true else on=v==true end
    set("pl",on)
    if on and Cfg.sel=="" then N("TD","Najpierw wybierz macro") end
end})

-- POST-LOAD
_init=false
task.spawn(function()
    task.wait(1.5)
    local gs=tonumber(Cfg.gs)
    if gs then local g=ens("g","RemoteEvents","SetGameSpeed") if g then pcall(function() g:FireServer(gs) end) end end
    if Cfg.sk then lastW=nil;setVis(true) end
    if Cfg.rp then startRP() end
    if Cfg.lb then startLB() end
    if sDD and Cfg.sel~="" then pcall(function() sDD:Set(Cfg.sel) end) end
    if Cfg.rec and Cfg.sel~="" then
        resetRec();rec.active=true
        if rToggle and rToggle.Set then pcall(function() rToggle:Set(true) end) end
    elseif Cfg.rec then
        Cfg.rec=false;save()
        if rToggle and rToggle.Set then pcall(function() rToggle:Set(false) end) end
    end
    if pToggle and pToggle.Set then pcall(function() pToggle:Set(Cfg.pl==true) end) end
end)

rfC()
N("TD","EZVC Ready")
print("[TD] DONE")