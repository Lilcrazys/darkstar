---------------------------------------------
--  Stormwind
--
--  Description: Creates a whirlwind that deals Wind damage to targets in an area of effect.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown radial
--  Notes:
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------
-- onMobSkillCheck
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

---------------------------------------------
-- onMobWeaponSkill
---------------------------------------------

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = 2.5;

	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_WIND,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WIND,MOBPARAM_WIPE_SHADOWS);

	target:delHP(dmg);
	return dmg;
end;
