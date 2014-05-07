
-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 1
DEBUG_FPS = true

-- design resolution
CONFIG_SCREEN_WIDTH  = 320	
CONFIG_SCREEN_HEIGHT = 480

-- auto scale mode
CONFIG_SCREEN_AUTOSCALE = "FIXED_WIDTH"

-- sounds
GAME_SFX = {
    back_music      = "sfx/back_music.mp3",
    button          = "sfx/button.mp3",
    jump       = "sfx/jump.mp3",
    dead = "sfx/dead.mp3",
    bouns = "sfx/bouns.mp3"
}


GAME_TEXTURE_DATA_FILENAME  = "all_sprites.plist"
GAME_TEXTURE_IMAGE_FILENAME = "all_sprites.png"


FRAME_RATE = 30
FRAME_TIME = (1.0/30)

--Game const
GAME_CONST = {
 	kNumClouds	=		8,
    kMinPlatformStep	= 50,  
	kMaxPlatformStep	= 200, 
	kNumPlatforms	=  10,
    kPlatformTopPadding = 10,
    kMinBonusStep		= 30, 
    kMaxBonusStep	= 50, 
    kMinEnemyStep   = 15, 
    kMaxEnemyStep   = 20, 
    kMaxLevel       = 50, 
    kLevelStep      = 20, 
}

GAME_TAG = {
	kSpriteManager = 0,
	kBird = 10,
	kScoreLabel = 50,
	kCloudsStartTag = 100,
	kPlatformsStartTag = 200,
	kBonusStartTag = 300,
	kScoreTitleTag = 500,
    kCrashPlatTag = 600,
    kFireEmiterTag = 700,
    kEnemyTag = 800 ,
    kTargetCross = 900,
    kProtection = 1000
}

BONUS_TAG = {
	kBonus5 = 5,
	kBonus10 = 10,
	kBonus50 = 50,
	kBonus100 = 100,
	kNumBonuses = 4
}

ENIMY_TAG = { 
    kEnemy_wandou = 0, 
    kEnemy_ciwei = 1, 
    kNumEnemies = 2
}

GAME_LAYER = {
BACK_LAYER_1 = 0,
BACK_LAYER_2 = 1,
BACK_LAYER_3 = 2,
CUR_LAYER_1  = 3,
CUR_LAYER_2  = 4,
FRONT_LAYER_1 = 5,
FRONT_LAYER_2 = 6,
FRONT_LAYER_3 = 7,
}