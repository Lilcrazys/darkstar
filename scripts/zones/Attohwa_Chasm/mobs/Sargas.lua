-----------------------------------
-- Area: Attohwa Chasm
--  NM:  Sargas
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
    mob:setMobMod(MOBMOD_AUTO_SPIKES,mob:getShortID());
    mob:addStatusEffect(EFFECT_SHOCK_SPIKES,50,0,0);
    mob:getStatusEffect(EFFECT_SHOCK_SPIKES):setFlag(32);
    mob:setMobMod(MOBMOD_MAIN_2HOUR, 1);
end;

function onMobSpawn(mob)
    -- setMod
    mob:setMod(MOD_REGEN, 40);
    mob:setMod(MOD_REGAIN, 20);

    -- addMod
    mob:addMod(MOD_DOUBLE_ATTACK, 30)

end;

function onAdditionalEffect(mob,target,damage)
    -- Guestimating 2 in 3 chance to stun on melee.
    if ((math.random(1,100) >= 66) or (target:hasStatusEffect(EFFECT_STUN) == true)) then
        return 0,0,0;
    else
        local duration = math.random(5,15);
        target:addStatusEffect(EFFECT_STUN,5,0,duration);
        return SUBEFFECT_STUN,0,EFFECT_STUN;
    end
end;

function onSpikesDamage(mob,target,damage)
    local INT_diff = mob:getStat(MOD_INT) - target:getStat(MOD_INT);

    if (INT_diff > 20) then
        INT_diff = 20 + ((INT_diff - 20)*0.5); -- INT above 20 is half as effective.
    end

    local dmg = ((damage+INT_diff)*0.5); -- INT adjustment and base damage averaged together.
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    dmg = addBonusesAbility(mob, ELE_THUNDER, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob,target,ELE_THUNDER,0);
    dmg = adjustForTarget(target,dmg,ELE_THUNDER);
    dmg = finalMagicNonSpellAdjustments(mob,target,ELE_THUNDER,dmg);

    if (dmg < 0) then
        dmg = 0;
    end

    return SUBEFFECT_SHOCK_SPIKES,44,dmg;
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- UpdateNMSpawnPoint(mob:getID());
    --[[
    mob:setRespawnTime(math.random((7200),(10800))); -- 2 to 3 hrs
    ]]
end;