<?xml version= "1.0" encoding="ISO-8859-1"?>
<ncl id="doc" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
 <head>
  <regionBase id="rb1" device="rbTV">
   <region height="100%" id="rg1" width="100%"/>
   <region height="25%" id="rg2" width="25%">
    <region height="50%" id="rg3" width="50%"/>
   </region>
  </regionBase>
  <descriptorBase>
   <descriptor id="d1" region="rg1"/>
   <descriptor id="d2" region="rg2"/>
  </descriptorBase>
 </head>
 <body>
  <port id="p2" component="m2"</port>
  <media id="m2" src="media/media2.mpg" descriptor="d2" type="video/mpeg"/>
 </body>
</ncl>