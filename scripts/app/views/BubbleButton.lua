
local BubbleButton = {}

-- create bubble button
function BubbleButton.new(params)
    local listener = params.listener
    local button -- pre-reference

    params.listener = function(tag)
        if params.prepare then
            params.prepare()
        end

        local function zoom1(offset, time, onComplete)
            local x, y = button:getPosition()
            local size = button:getContentSize()

            local scaleX = button:getScaleX() * (size.width + offset) / size.width
            local scaleY = button:getScaleY() * (size.height - offset) / size.height

            transition.moveTo(button, {x = x - offset, time = time})
            transition.moveTo(button, {x = x + offset, time = time * 2})
            transition.moveTo(button, {x = x, time = time})
            transition.scaleTo(button, {
                scaleX     = scaleX/2,
                scaleY     = scaleY/2,
                time       = time,
                onComplete = onComplete,
            })
        end

        local function zoom2(offset, time, onComplete)
            local x, y = button:getPosition()
            local size = button:getContentSize()

            transition.moveTo(button, {x = x + offset, time = time / 2})
            transition.moveTo(button, {x = x - offset, time = time })
            transition.moveTo(button, {x = x, time = time/2})
            transition.scaleTo(button, {
                scaleX     = 1.0,
                scaleY     = 1.0,
                time       = time,
                onComplete = onComplete,
            })
        end

        button:getParent():setEnabled(false)

        zoom1(40, 0.08, function()
            zoom2(80, 0.09, function()
                zoom1(20, 0.10, function()
                    zoom2(20, 0.11, function()
                        button:getParent():setEnabled(true)
                        listener(tag)
                    end)
                end)
            end)
        end)
    end

    button = ui.newImageMenuItem(params)
    return button
end

return BubbleButton
