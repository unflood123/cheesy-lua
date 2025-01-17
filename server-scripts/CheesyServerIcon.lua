local screensize = vec2(ac.getSim().windowWidth,ac.getSim().windowHeight)
local timer = 0

--image_0 is used as the rules splash screen
local image_0 = {
    ['src'] = 'public-url-link-goes-here',
    ['sizeX'] = 512, --size of your image in pixels
    ['sizeY'] = 512, --size of your image in pixels
    ['paddingX'] = screensize.x/2-512/2, --this makes it sit in the centre of the screen
    ['paddingY'] = -50 --this moves it up 50 pixels
}

--image_1 is used as the icon
local image_1 = {
    ['src'] = 'https://cdn.discordapp.com/attachments/916519586332049429/1056821070281310299/LOGO_Transparent.png',
    ['sizeX'] = 256,
    ['sizeY'] = 256,
    ['paddingX'] = 50, --use this to align it, currently 50 pixels from top right
    ['paddingY'] = 810 --use this to align it, currently 50 pixels from top right
}

--this waits for the driver to not be in the setup screen, then starts the timer for the rule splash image
function script.update(dt)
    ac.debug('isInMainMenu', ac.getSim().isInMainMenu)
    if not ac.getSim().isInMainMenu then
        if timer >= 0 then
            timer = timer - dt
        end        
    end
end

--this draws the splash screen then after draws the icon
function script.drawUI()
    if timer >= 0 and not ac.getSim().isInMainMenu then
        ac.log("Rules Displayed")
        ui.drawImage(image_0.src, vec2(image_0.paddingX, screensize.y-image_0.sizeY-image_0.paddingY), vec2(image_0.sizeX+image_0.paddingX, screensize.y-image_0.paddingY), true)
    end
    if timer <= 0 then
        ac.log("Icon Active")
        ui.drawImage(image_1.src, vec2(image_1.paddingX, image_1.paddingY), vec2(image_1.sizeX+image_1.paddingX, image_1.sizeY+image_1.paddingY), true)
    end
end
