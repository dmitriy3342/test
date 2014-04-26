rkstlib.scene = require "RakastettuLibs.Scene"
rkstlib.layer = require "RakastettuLibs.Layer"
rkstlib.node = require "RakastettuLibs.Node"

local Game = {} --game with one scene

function Game:resizeWindow(width, height)
	local cam = self.scene._camera
	cam._sizes.width = width
	cam._sizes.height = height

	--send event to layers? -- no
end

function Game:init(width, height)
	print("Game:init() called")

	self.scene = rkstlib.scene.new()

	self:resizeWindow(width, height)
	self:_initTestScene()
end

--[[
Тестовая сцена
Один слой с двумя нодами
Вращение и зум камеры
]]--
function Game:_initTestScene()
	--test----------------
	local mainLayer = rkstlib.layer.new()

	local layer1 = rkstlib.layer.new()


	local nodes = {}

	for i = 1,9 do
		
			nodes[i] = rkstlib.node.new()
			nodes[i]:setRect(50, 50, 50, 50)

			if i>3 or i<7 then
			nodes[i]:moveTo(i*110-220, 2*110-205)
			elseif  i>6 or i<10 then
			nodes[i]:moveTo(i*110-220, 3*110-205)
			end



			mainLayer:addNode(nodes[i])
		
	end

	local node2 = rkstlib.node.new()
	node2:setRect(50, 50, 50, 50)
	node2:moveTo(0,-205)
	layer1:addNode(node2)




function love.keypressed(button)
	
end
	


	self.scene:addLayer(mainLayer)
	self.scene:addLayer(layer1)
	function game.scene:update(dt)
		if true == love.keyboard.isDown( 'w' ) then

				--node1:move(0,-1)
				self._camera._zoom = self._camera._zoom + 0.5 * dt
				self._camera._zoom_aspect = math.sin(90 + self._camera._zoom)
		end

		if true == love.keyboard.isDown( 's' ) then

				--node1:move(0,1)
				--self._camera._zoom = self._camera._zoom + 1 * dt
				--self._camera._angle = (self._camera._angle + dt * 2 * 0.2) --Поворот
				self._camera._zoom = self._camera._zoom - 0.5 * dt
				self._camera._zoom_aspect = math.sin(90 + self._camera._zoom)
		end	

		if true == love.keyboard.isDown( 'a' ) then

				--node1:move(-1,0)
				self._camera._angle = self._camera._angle-0.1
				--self._camera._zoom_aspect = self._camera._angle + 0.02
		end	

		if true == love.keyboard.isDown( 'd' ) then
				self._camera._angle = self._camera._angle+0.1
				--node1:move(1,0)
		end

		if true == love.keyboard.isDown( 'q' ) then

				--node1:move(-1,0)
				
				self._camera._zoom = self._camera._zoom + 0.1
		end	
				if true == love.keyboard.isDown( 'e' ) then

				--node1:move(-1,0)
				self._camera._zoom = self._camera._zoom - 0.1
		end	

		if true == love.keyboard.isDown( 'z' ) then

				--node1:move(-1,0)
					for i = 1,3 do
						
							nodes[i]:move(1, 1)
						
					end
				--self._camera._zoom = self._camera._zoom - 0.1
		end	
		-- local phi = 2
		-- local zv = 1
		-- self._camera._angle = (self._camera._angle + dt * phi * 0.2) % (2 * math.pi)
		-- self._camera._zoom = self._camera._zoom + zv * dt
		-- self._camera._zoom_aspect = 1 + 0.3*math.sin(self._camera._angle*20.0)
		-- if self._camera._zoom > 2 then
		-- 	self._camera._zoom = 0.5
		-- 	print("over")
		-- end
	end

	






	----------------------
end






return Game