require("core/NCube")

local doc = Document:create()
doc:loadNcl("doc.ncl")

print(doc:writeNcl())

print(doc:getDescendantById("rg3"):writeNcl())

--print(d1:writeNcl())

--print(doc:getHead():getRegionBaseById("rb1"):getPosChild(rg1))

--local rg3 = Region:create({id="rg3", width="100%", height="100%"})5
--doc:getHead():getRegionBase(1):addRegion(rg3)
--
--local d3 = Descriptor:create{id="d3", region="rg3"}
--
--doc:getHead():getDescriptorBase():addDescriptor(d3)
--
--doc:saveNcl("doc2.ncl")