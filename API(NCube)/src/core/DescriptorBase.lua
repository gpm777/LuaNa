local NCLElem = require "core/NCLElem"

local DescriptorBase = Class:createClass(NCLElem)

DescriptorBase.name = "descriptorBase"

DescriptorBase.attributes = { 
  id = nil
}

local Descriptor = require "core/Descriptor"

DescriptorBase.childsMap = {
 ["descriptor"] = {Descriptor, "many", 1}
}

DescriptorBase.descritptors = nil
DescriptorBase.seq = true

function DescriptorBase:create(attributes, full)
   local attributes = attributes or {}  
   local descriptorBase = DescriptorBase:new()
   
   descriptorBase:setAttributes(attributes)
   descriptorBase:setChilds()    
   
   if(full ~= nil)then
      descriptorBase.descriptors = {}
      descriptorBase:addChild({} , 1)
   end
   
   return descriptorBase
end

function DescriptorBase:setId(id)
   self.attributes.id = id
end

function DescriptorBase:getId()
   return self.attributes.id
end

function DescriptorBase:addDescriptor(descriptor)
    table.insert(self.descriptors, descriptor)
    table.insert(self:getChild(1), descriptor)
end

function DescriptorBase:getDescriptor(i)
    return self.descriptors[i]
end

function DescriptorBase:getDescriptorById(id)
   for i, descriptor in ipairs(self.descriptors) do
       if(descriptor:getId() == id)then
          return descriptor
       end
   end
   
   return nil
end

function DescriptorBase:setDescriptors(...)
    if(#arg>0)then
      for i, v in ipairs(arg) do
          self:addDescriptor(v)
      end
    end
end

return DescriptorBase