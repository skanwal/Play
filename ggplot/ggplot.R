# This was from an online answer that I think I searched when working with the unknown B sample to do fpkm analysisn and 
# drawing plots. Helped me with having multiple data points on lines

require(ggplot2)
require(reshape2)

s.a = rnorm(100)*100
s.b = rnorm(100)*100+50
d.a = -35
d.b = 20
sdata = data.frame(cbind(s.a,s.b))
ddata = data.frame(cbind(d.a,d.b))
sdata.m = melt(sdata)
ddata.m = melt(ddata)

ggplot(sdata.m, aes(x=value, color=variable,linetype=variable,shape=variable))+
  stat_ecdf(size=1)+
  geom_vline(data=ddata.m,
             aes(xintercept = value,color=variable,linetype=variable,shape=variable),
             size=2) +
  geom_point(aes(x=mean(sdata.m$value[sdata.m$variable=="s.a"]),
                 color="s.a.mean",linetype="s.a.mean",shape="s.a.mean",
                 y=.5),size = 5) +
  geom_point(aes(x=mean(sdata.m$value[sdata.m$variable=="s.b"]),
                 color="s.b.mean",linetype="s.b.mean",shape="s.b.mean",
                 y=.5),size = 5) +
  scale_shape_manual(breaks=c("d.a","d.b","s.a","s.a.mean","s.b","s.b.mean"),
                     values=c(16,16,16,16,16,16)) +
  scale_color_manual(breaks=c("d.a","d.b","s.a","s.a.mean","s.b","s.b.mean"),
                     values=c("blue","red","blue","blue","red","red"))+
  scale_linetype_manual(breaks=c("d.a","d.b","s.a","s.a.mean","s.b","s.b.mean"),
                        values=c(2,2,1,0,1,0))+
  guides(color=guide_legend(override.aes=list(shape=c(NA,NA,NA,16,NA,16))))

