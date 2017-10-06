local NCLElem = require "core/structure_content/NCLElem"
local CausalConnector = require "core/connectors/CausalConnector"

local ConnectorBase = NCLElem:extends()

ConnectorBase.name = "connectorBase"

ConnectorBase.childsMap = {
 ["causalConnector"] = {CausalConnector, "many"}
}

ConnectorBase.causalConnectors = nil

function ConnectorBase:create(attributes, full)  
   local connectorBase = ConnectorBase:new() 
   
   connectorBase.attributes = {
      ["id"] = ""
   }  
   
   if(attributes ~= nil)then
      connectorBase:setAttributes(attributes)
   end
     
   connectorBase.childs = {}
   connectorBase.causalConnectors = {}
    
   if(full ~= nil)then      
       connectorBase:addCausalConnector(CausalConnector:create(nil, full))       
   end
   
   return connectorBase
end

function ConnectorBase:setId(id)
   self.attributes.id = id
end

function ConnectorBase:getId()
   return self.attributes.id
end

function ConnectorBase:addCausalConnector(causalConnector)
    table.insert(self.causalConnectors, causalConnector)    
    local p = self:getLastPosChild("causalConnector")
    if(p ~= nil)then
       self:addChild(causalConnector, p+1)
    else
       self:addChild(causalConnector, 1)
    end
end

function ConnectorBase:getCausalConnector(i)
    return self.causalConnectors[i]
end

function ConnectorBase:getCausalConnectorById(id)
   for _, causalConnector in ipairs(self.causalConnectors) do
       if(causalConnector:getId() == id)then
          return causalConnector
       end
   end
   
   return nil
end

function ConnectorBase:setCausalConnectors(...)
    if(#arg>0)then
      for _, causalConnector in ipairs(arg) do
          self:addCausalConnector(causalConnector)
      end
    end
end

function ConnectorBase:removeCausalConnector(causalConnector)
   self:removeChild(causalConnector)
   
   for i, cc in ipairs(self.causalConnectors) do
       if(causalConnector == cc)then
           table.remove(self.causalConnectors, i)  
       end
   end 
end

function ConnectorBase:removeCausalConnectorPos(i)
   self:removeChildPos(i)
   table.remove(self.causalConnectors, i)
end

return ConnectorBase