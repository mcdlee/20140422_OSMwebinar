cList <- read.csv("cList.csv")
colnames(cList)

grouplist <- levels(cList$groupName)


library(leafletR)
library(scales)

s.dat <- toGeoJSON(data=cList, lat.lon=c("lat", "lon"))
s.sty <- styleCat(prop="groupName",val=grouplist, style.val= hue_pal()(length(grouplist)))
s.map <- leaflet(data=s.dat, style=s.sty, base.map = c("osm", "cm", "mqosm"), popup=c("clinicName", "clinicAddr"))
browseURL(s.map)