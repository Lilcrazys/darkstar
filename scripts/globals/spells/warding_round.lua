-----------------------------------------
-- Spell: Warding Round
-- Increases Curse Resistance to
-- Party Members within target AoE
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    if (caster:isPC()) then
        caster:PrintToPlayer("Spell non working, staff is aware.");
    end
    return 1;
end;

function onSpellCast(caster,target,spell)
    -- Needs rewritten
    --[[
    local duration = 120;
    local power = 20;
    duration = duration + (duration * (caster:getMod(MOD_SONG_DURATION)/100));
    duration = duration + (duration * ((caster:getMod(MOD_ALL_SONGS) * 10)/100));

    power = power + (caster:getMod(MOD_ALL_SONGS) * 4);

    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
    target:delStatusEffect(EFFECT_ROUND);
    target:addStatusEffect(EFFECT_ROUND,power,0,duration);
    spell:setMsg(230);
    return EFFECT_ROUND;
    ]]
    return 0;
end;
