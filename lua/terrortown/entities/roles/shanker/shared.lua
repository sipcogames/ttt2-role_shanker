if SERVER then
  AddCSLuaFile()
  resource.AddFile("materials/vgui/ttt/dynamic/roles/icon_shank.vmt")
end

function ROLE:PreInitialize()
  self.color = Color(209, 98, 90, 255)

  self.abbr = "shank" -- abbreviation
  self.surviveBonus = 0 -- bonus multiplier for every survive while another player was killed
  self.scoreKillsMultiplier = 5 -- multiplier for kill of player of another team
  self.scoreTeamKillsMultiplier = -5 -- multiplier for teamkill
  --self.preventFindCredits         = true
  --self.preventKillCredits         = true
  --self.preventTraitorAloneCredits = true
  self.preventWin                 = false
  self.unknownTeam                = false
  self.isOmniscientRole           = true

  self.defaultTeam = TEAM_TRAITOR

  self.conVarData = {
    pct = 0.15, -- necessary: percentage of getting this role selected (per player)
    maximum = 1, -- maximum amount of roles in a round
    minPlayers = 5, -- minimum amount of players until this role is able to get selected
    credits = 0, -- the starting credits of a specific role
    shopFallback = SHOP_DISABLED,
    togglable = true, -- option to toggle a role for a client if possible (F1 menu)
    random = 33,
    traitorButton = 1 -- can use traitor buttons
  }
end

function ROLE:Initialize()
  roles.SetBaseRole(self, ROLE_TRAITOR)
end

if SERVER then
  
  function ROLE:GiveRoleLoadout(ply, isRoleChange)
    ply:GiveEquipmentWeapon("weapon_ttt_shankknife")
  end

  function ROLE:RemoveRoleLoadout(ply, isRoleChange)
    ply:StripWeapon("weapon_ttt_shankknife")
  end

end