-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    startGov(GOV_EVENT_OUTER_HORUTOTO_RUINS,player);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    updateGov(player,csid,option,663,664,665,666,667,668,669,670,0,0);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    finishGov(player,csid,option,663,664,665,666,667,668,669,670,0,0,GOV_MSG_OUTER_HORUTOTO_RUINS);
end;
