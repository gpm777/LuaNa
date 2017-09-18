local NCLElem = require "core/NCLElem"

local Region = Class:createClass(NCLElem)

Region.name = "region"

Region.attributes = {
  id = nil, 
  title = nil, 
  left = nil, 
  right = nil, 
  top = nil, 
  bottom = nil, 
  height = nil, 
  width = nil, 
  zIndex = nil
}

Region.childsMap = {
 ["region"] = {Region, "many", 1}
}

Region.regions = nil 
Region.seq = true

function Region:create(attributes, empty)
   local attributes = attributes or {}  
   local region = Region:new() 
    
   region:setAttributes(attributes)
   region:setChilds() 
   
   if(empty ~= nil)then
      region.regions = {}
      region:addChild({} , 1)
   end
   
   return region
end

function Region:setId(id)
   self.attributes.id = id
end

function Region:getId()
   return self.attributes.id
end

function Region:setTitle(title)
   self.attributes.title = title
end

function Region:getTitle()
   return self.attributes.title
end

function Region:setLeft(left)
   self.attributes.left = left
end

function Region:getLeft()
   return self.attributes.left
end

function Region:setRight(right)
   self.attributes.right = right
end

function Region:getRight()
   return self.attributes.right
end

function Region:setTop(top)
   self.attributes.top = top
end

function Region:getTop()
   return self.attributes.top
end

function Region:setBottom(bottom)
   self.attributes.bottom = bottom
end

function Region:getBottom()
   return self.attributes.bottom
end

function Region:setHeight(height)
   self.attributes.height = height
end

function Region:getHeight()
   return self.attributes.height
end

function Region:setWidth(width)
   self.attributes.width = width
end

function Region:getWidth()
   return self.attributes.width
end

function Region:setDim(height, width) 
   self:setHeight(height)
   self:setWidth(width)
end

function Region:setPos(left, right, top, bottom) 
   self:setLeft(left)
   self:setRight(right)
   self:setTop(top)
   self:setBottom(bottom)
end

function Region:setZIndex(zIndex)
   self.attributes.zIndex = zIndex
end

function Region:getZIndex()
   return self.attributes.zIndex
end

function Region:addRegion(region)
    table.insert(self.regions, region)
    table.insert(self:getChild(1), region)
end

function Region:getRegion(i)
    return self.regions[i]
end

function Region:getRegionById(id)
   for i, v in ipairs(self.regions) do
       if(self.regions[i]:getId() == id)then
          return self.regions[i]
       end
   end
   
   return nil
end

function Region:setRegions(...)
    if(#arg>0)then
      for i, v in ipairs(arg) do
          self:addRegion(v)
      end
    end
end

return Region