---------------------------------------------------
-- Trample
-- Bahamut delivers a three-hit attack that also stuns target.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/summon");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 5;
	local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
	local finalDamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_PIERCE,numhits);

	target:addStatusEffect(EFFECT_PARALYSIS, 22.5, 0, 90);
	target:delHP(finalDamage);
	target:updateEnmityFromDamage(pet,finalDamage);

	return finalDamage;
end