
#### example 1: 
single_300= read.csv('~/Google Drive/ACE_workshop_Dec2019/ACE_workshop/data/single_300x.csv')


prep_1= mag.prepdata(single_300)
mag_1= mag.single(prep_1)
cut_1= cut.off.single(mag_1)

plot(cut_1$final.data$vaf.1,prep_1$depths$depth.1 , col=cut_1$final.data$colors)


run_1= mag.single.run(single_300)
plot(run_1$results$vaf.1, run_1$results$depth.1, col=run_1$results$colors)



#### example 2
single_30= read.csv('~/Google Drive/ACE_workshop_Dec2019/ACE_workshop/data/single_30x.csv')

prep_2=mag.prepdata(single_30)
mag_2= mag.single(prep_2)
cut_2=cut.off.single(mag_2)

plot(cut_2$final.data$vaf.1,prep_2$depths$depth.1, col=cut_2$final.data$colors)



run_2= mag.single.run(single_30,fold = F)


plot(run_2$results$vaf.1, run_2$results$depth.1, col=run_2$results$colors)


### Example 3: Multiple

multiple_1 <- read.table("~/Google Drive/ACE_workshop_Dec2019/ACE_workshop/data/multiple_1.input", 
                         "\t",header = T)
head(multiple_1)

prep_3=mag.prepdata.v3(multiple_1[,-1])
plot(prep_3$vafs[,-3])
dim(prep_3$vafs)
mag_3= mag.multiple(prep_3)
mv_3=mag.var(mag_3)
cut_3= cut.off.multiple.v3.2(mv_3)
plot(cut_3$final.data$vaf.1, cut_3$final.data$vaf.2, col=cut_3$final.data$colors)

run_3= mag.multiple.run(multiple_1[,-1])
plot(run_3$results$vaf.1, run_3$results$vaf.2, col=run_3$results$colors)


### Example 4
multiple_2 <- read.table("~/Google Drive/ACE_workshop_Dec2019/ACE_workshop/data/multiple_2_cell.csv", header = T, sep=',')
head(multiple_2)
prep_4= mag.prepdata.v3(multiple_2)

plot(prep_4$vafs$vaf.1, prep_4$vafs$vaf.2, xlim=c(0,0.8), ylim=c(0,0.8))

red=mag.reduce.graph(prep_4)#, threshold = 0.03)
mag=mag.multiple(prep_4, x.el.cut = red$x.el.red)
mv=mag.var(mag)
cut= cut.off.multiple(mv)
plot(cut$final.data$vaf.1, cut$final.data$vaf.2, col=cut$final.data$colors, 
     xlim=c(0,0.8), ylim=c(0,0.8))


plot(cut$final.data$vaf.1, cut$final.data$vaf.2, col=col)






