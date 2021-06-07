local Draggable = require('draggable')

local handle = {
  img = love.graphics.newImage('drag_handle.png'),
  height = 35
}

local cursor = love.mouse.getSystemCursor('sizeall')
local hover = false

function love.load()
  love.graphics.setBackgroundColor(1, 1, 1, 1)
end

function love.mousemoved(x, y, dx, dy)
  if Draggable.dragging() or y < handle.height then
    hover = true
    love.mouse.setCursor(cursor)
  else
    hover = false
    love.mouse.setCursor()
  end

  Draggable.move(dx, dy)
end

function love.mousepressed(x, y)
  if y < handle.height then
    Draggable.start()
  end
end

function love.mousereleased()
  Draggable.stop()
end

function love.draw()
  local w, h = love.graphics.getDimensions()
  love.graphics.setColor(0, 0, 0, 0.2)
  love.graphics.rectangle("fill", 0, 0, w, handle.height)
  love.graphics.setColor(0, 0, 0, 1.)
  love.graphics.draw(handle.img, 10, 10)
  love.graphics.print('Hi! Drag me up!', 30, 9)
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end
