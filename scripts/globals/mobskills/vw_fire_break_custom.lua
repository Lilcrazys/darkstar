---------------------------------------------
--  Fire Break
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/utils");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
	return 0;
end;

function onMobWeaponSkill(target, mob, skill)
	local dmgmod = 4;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_FIRE,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
    target:delMP(dmg);
	mob:addMP(dmg);

    target:delHP(dmg);
	return dmg;
end;
