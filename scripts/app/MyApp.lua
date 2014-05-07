
require("config")
require("framework.init")
require("framework.shortcodes")
require("framework.cc.init")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
    self.objects_ = {}
end

function MyApp:run()
    CCFileUtils:sharedFileUtils():addSearchPath("res/")
    display.addSpriteFramesWithFile(GAME_TEXTURE_DATA_FILENAME, GAME_TEXTURE_IMAGE_FILENAME)

    -- preload all sounds
    for k, v in pairs(GAME_SFX) do
        audio.preloadSound(v)
    end

    self:enterMenuScene()
end

function MyApp:enterMenuScene()
    self:enterScene("MenuScene", nil, "fade", 1.6, display.COLOR_WHITE)
end

function MyApp:enterPlayScene()
    self:enterScene("PlayScene", nil, "fade", 1.6, display.COLOR_WHITE)
end

function MyApp:enterScoreScene()
    self:enterScene("ScoreScene", nil, "fade", 1.6, display.COLOR_WHITE)
end

function MyApp:enterOpionScene()
    self:enterScene("OptionScene", {levelIndex}, "ROTOZOOM", 1.6, display.COLOR_WHITE)
end

return MyApp
