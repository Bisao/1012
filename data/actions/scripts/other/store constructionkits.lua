function onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(Storage.Exaust.tempo) >= os.time() then
	player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You are exhausted.')
	return true
    end


  local kit = item.actionid
  print(item.actionid)
  if not kit then
    return false
  end

  if fromPosition.x == CONTAINER_POSITION then
    player:sendTextMessage(MESSAGE_STATUS_SMALL, "Put the construction kit on the floor first.")
  elseif not fromPosition:getTile():getHouse() then
    player:sendTextMessage(MESSAGE_STATUS_SMALL, "You may construct this only inside a house.")
  else
    item:transform(kit)
    fromPosition:sendMagicEffect(CONST_ME_POFF)
    player:addAchievementProgress('Interior Decorator', 1000)
  end
	player:setStorageValue(Storage.Exaust.tempo, os.time())
  return true
end