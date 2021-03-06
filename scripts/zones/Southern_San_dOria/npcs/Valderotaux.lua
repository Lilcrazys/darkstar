-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Valderotaux
--  General Info NPC
-- !pos 97 0.1 113 230
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script

    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)
    local lakesideMin = player:getQuestStatus(JEUNO,LAKESIDE_MINUET);
    local lakeProg = player:getVar("Lakeside_Minuet_Progress");
    if (lakeProg == 1) then
        player:startEvent(888); -- Dance for the drunks!
        player:setVar("Lakeside_Minuet_Progress",2);
    elseif (lakeProg >= 2) then
        player:startEvent(889); -- Immediate regret of failure!
    else
        player:startEvent(58);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
