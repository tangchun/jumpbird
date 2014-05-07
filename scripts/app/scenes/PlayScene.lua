

local PlayScene = class("PlayScene", function()
    return display.newScene("PlayScene")
end)

local currentCloudTag = 0

function PlayScene:initClouds()
    currentCloudTag = GAME_TAG.kCloudsStartTag
    while (currentCloudTag < GAME_TAG.kCloudsStartTag + GAME_CONST.kNumClouds) do
        self:initCloud()
        currentCloudTag = currentCloudTag + 1
    end
    
    self:resetClouds();
end

function PlayScene:initCloud()
    local name = nil;
    local case = math.random(3)
    local name = string.format("#cloud%d.png", case)
    local cloud = display.newSprite(name);

    self:addChild(cloud, GAME_LAYER.BACK_LAYER_3, currentCloudTag);
    --cloud:setOpacity(128);
end

function PlayScene:resetClouds()
    currentCloudTag = GAME_TAG.kCloudsStartTag;
    
    while (currentCloudTag < GAME_TAG.kCloudsStartTag + GAME_CONST.kNumClouds) do
        self:resetCloud()

        local cloud = self:getChildByTag(currentCloudTag)
        local x, y = cloud:getPosition()
        y = y - 480.0;
        cloud:setPosition(x, y)

        currentCloudTag = currentCloudTag + 1
    end
end


function PlayScene:resetCloud() 
    local cloud = self:getChildByTag(currentCloudTag);
    
    local distance = math.random(20) + 5; 
    
    local scale = 5.0 / distance;
    cloud:setScaleX(scale);
    cloud:setScaleY(scale);
    cloud:setOpacity(256*scale);
    
    if (math.random(2) == 1) then
        cloud:setScaleX(-cloud:getScaleX()); 
    end

    local size = cloud:getContentSize();
    local scaled_width = size.width * scale;
    local x = math.random(320 + scaled_width) - scaled_width/2;
    local y = math.random(480 - scaled_width) + scaled_width/2 + 480;
    
    cloud:setPosition(x, y);
end

function PlayScene:step(dt)
    local t = GAME_TAG.kCloudsStartTag

    while (t < GAME_TAG.kCloudsStartTag + GAME_CONST.kNumClouds) do
        local cloud = self:getChildByTag(t)
        local x, y = cloud:getPosition()
        local size = cloud:getContentSize()
        x = x + 4 * cloud:getScaleX()
        
        if (x > 320 + size.width/2) then
            x = -size.width/2
        end
       
        cloud:setPosition(x,y)
        t = t + 1
    end
end

function PlayScene:ctor(levelIndex)
    local bg = display.newSprite("background.png", display.cx, display.cy)
    self:addChild(bg, GAME_LAYER.BACK_LAYER_1)

    --cloud
    self:initClouds()

    self:schedule(function(dt) self:step(dt) end, FRAME_TIME);


--[[
    local title = display.newSprite("#Title.png", display.left + 150, display.top - 50)
    title:setScale(0.5)
    self:addChild(title)

    local adBar = AdBar.new()
    self:addChild(adBar)

    local label = ui.newBMFontLabel({
        text  = string.format("Level: %s", tostring(levelIndex)),
        font  = "UIFont.fnt",
        x     = display.left + 10,
        y     = display.bottom + 120,
        align = ui.TEXT_ALIGN_LEFT,
    })
    self:addChild(label)

    self.board = Board.new(Levels.get(levelIndex))
    self.board:addEventListener("LEVEL_COMPLETED", handler(self, self.onLevelCompleted))
    self:addChild(self.board)

    -- create menu
    local backButton = ui.newImageMenuItem({
        image = "#BackButton.png",
        imageSelected = "#BackButtonSelected.png",
        x = display.right - 100,
        y = display.bottom + 120,
        sound = GAME_SFX.backButton,
        listener = function()
            app:enterChooseLevelScene()
        end,
    })

    local menu = ui.newMenu({backButton})
    self:addChild(menu)
]]
end

function PlayScene:onLevelCompleted()
--[[
    audio.playEffect(GAME_SFX.levelCompleted)

    local dialog = display.newSprite("#LevelCompletedDialogBg.png")
    dialog:setPosition(display.cx, display.top + dialog:getContentSize().height / 2 + 40)
    self:addChild(dialog)

    transition.moveTo(dialog, {time = 0.7, y = display.top - dialog:getContentSize().height / 2 - 40, easing = "BOUNCEOUT"})
]]

end

function PlayScene:onEnter()
end

return PlayScene
