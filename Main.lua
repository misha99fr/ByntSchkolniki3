
local filesystem = require("Filesystem")
local screen = require("Screen")
local image = require("Image")
local GUI = require("GUI")
local system = require("System")
local event = require("Event")

------------------------------------------------------------------------------------------

local spinnersPath = filesystem.path(system.getCurrentScript())
local spinners = {}
local currentSpinner = 1
local spinnerLimit = 5
local spinnerHue = math.random(0, 360)
local spinnerHueStep = 20
local delaySlider = 50
local cadr = 1
local i = 1

local workspace = GUI.workspace()
workspace:addChild(GUI.panel(1, 1, workspace.width, workspace.height, 0x505050))
local spinnerImage = workspace:addChild(GUI.image(1, 1, {100, 45}))

------------------------------------------------------------------------------------------

workspace.eventHandler = function(workspace, object, e1, e2, e3, e4, e5)
  if e1 == "key_down" then
  
    currentSpinner = currentSpinner + 1
    if currentSpinner > #spinners then
      currentSpinner = 1
    end
    spinnerImage.image = spinners[currentSpinner]
  end
  spinnerImage.image = spinners[currentSpinner]
  
  workspace:draw()
end

------------------------------------------------------------------------------------------


for i = 1, spinnerLimit do
  spinners[i] = image.load(spinnersPath .. i .. ".pic")
end 
spinnerImage.localX = math.floor(workspace.width / 2 - spinnerImage.width / 2)
spinnerImage.localY = math.floor(workspace.height / 2 - spinnerImage.height/ 2)

screen.flush()

workspace:start(0)









