
--local AdBar = import("..views.AdBar")
local BubbleButton = import("..views.BubbleButton")

local MenuScene = class("MenuScene", function()
    return display.newScene("MenuScene")
end)

function MenuScene:ctor()
    
    self.bg = display.newSprite("background.png", display.cx, display.cy)
    self:addChild(self.bg, -1)


    --self.adBar = AdBar.new()
    --self:addChild(self.adBar)

    -- create menu
    self.start_button = BubbleButton.new({
        image = "#start.png",
        x = display.width/2,
        y = display.height*5/6,
        sound = GAME_SFX.button,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        listener = function()
            app:enterPlayScene()
        end,
    })

    self.option_button = BubbleButton.new({
        image = "#option.png",
        x = display.width/2,
        y = display.height * 4 / 6,
        sound = GAME_SFX.button,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        listener = function()
            app:enterOptionScene()
        end,
    })

    self.scores_button = BubbleButton.new({
        image = "#scores.png",
        x = display.width/2,
        y = display.height * 3 / 6,
        sound = GAME_SFX.button,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        listener = function()
            app:enterScoresScene()
        end,
    })

    self.exit_button = BubbleButton.new({
        image = "#exit.png",
        x = display.width/2,
        y = display.height * 2 / 6,
        sound = GAME_SFX.button,
        prepare = function()
            self.menu:setEnabled(false)
            self.layer:setKeypadEnabled(false)
        end,
        listener = function()
            app:exit()
        end,
    })

    self.menu = ui.newMenu({self.start_button, self.option_button, self.scores_button, self.exit_button})
    self:addChild(self.menu)

    -- keypad layer, for android
    self.layer = display.newLayer()
    self.layer:addKeypadEventListener(function(event)
        if event == "back" then
            audio.playSound(GAME_SFX.button)
            app:exit()
        end
    end)
    self:addChild(self.layer)
end

function MenuScene:onEnter()
    -- avoid unmeant back
    self:performWithDelay(function()
        self.layer:setKeypadEnabled(true)
    end, 0.5)
end

return MenuScene
