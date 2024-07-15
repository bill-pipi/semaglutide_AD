library(forestplot)
workdir <- "."
#datafile <- file.path(workdir,"Figure2a.csv")

#datafile <- file.path(workdir,"Figure3a.csv")
#datafile <- file.path(workdir,"Figure3b.csv")

#datafile <- file.path(workdir,"Figure4a.csv")
#datafile <- file.path(workdir,"Figure4b.csv")

#datafile <- file.path(workdir,"Supplement_Figure2.csv")


#datafile <- file.path(workdir,"Supplement_Figure3a.csv")
#datafile <- file.path(workdir,"Supplement_Figure3b.csv")
#datafile <- file.path(workdir,"Supplement_Figure3c.csv")

#datafile <- file.path(workdir,"Supplement_Figure4a.csv")
datafile <- file.path(workdir,"Supplement_Figure4b.csv")


data <- read.csv(datafile, stringsAsFactors=FALSE,row.names=NULL)



## Combine the count and percent column
np <- ifelse(!is.na(data$case_group), paste(data$case_group," (",data$p_val,")",sep=""), NA)

## The rest of the columns in the table. 
tabletext <- cbind(c("Size/Group",data$casecount),
                   c("Exposure Group",data$controlcount),
                   c("Comparison Group", data$blah),
                   c("Exposure Group \nCases (Overall Risk)\n",data$case_group),
                   c("Comparison Group \nCases(Overall Risk)\n", data$control_group),
                   #c("\nNo. of cases (overall risk)\nExposure cohort\n",data$casecount),
                   #c("\nNo. of cases (overall risk)\nComparison cohort\n",data$controlcount),

                   c("        HR (95% CI)",data$CI)
)

#pdf(file.path(workdir,"Figure2a.pdf"),  onefile=FALSE, width=14, height=5)

#pdf(file.path(workdir,"Figure3a.pdf"),  onefile=FALSE, width=14, height=5)
#pdf(file.path(workdir,"Figure3b.pdf"),  onefile=FALSE, width=14, height=5)

#pdf(file.path(workdir,"Figure4a.pdf"),  onefile=FALSE, width=14, height=5)
#pdf(file.path(workdir,"Figure4b.pdf"),  onefile=FALSE, width=14, height=5)

#pdf(file.path(workdir,"Supplement_Figure2.pdf"),  onefile=FALSE, width=14, height=5)

#pdf(file.path(workdir,"Supplement_Figure3a.pdf"),  onefile=FALSE, width=14, height=5)
#pdf(file.path(workdir,"Supplement_Figure3b.pdf"),  onefile=FALSE, width=14, height=5)
#pdf(file.path(workdir,"Supplement_Figure3c.pdf"),  onefile=FALSE, width=14, height=5)

#pdf(file.path(workdir,"Supplement_Figure4a.pdf"),  onefile=FALSE, width=14, height=5)
pdf(file.path(workdir,"Supplement_Figure4b.pdf"),  onefile=FALSE, width=14, height=5)


forestplot(labeltext=tabletext, 
           graphwidth = unit(90, 'mm'),
           graph.pos=6,
           #is.summary=c(TRUE,TRUE, rep(FALSE, 5),TRUE,rep(FALSE, 5),TRUE,rep(FALSE, 5),TRUE,rep(FALSE, 8)),
           is.summary=c(TRUE,rep(FALSE,12)),
        
          # is.summary=c(TRUE,TRUE,TRUE,rep(FALSE,6),TRUE,rep(FALSE,10)),
           #is.summary=c(TRUE,TRUE,TRUE,rep(FALSE,4),TRUE,rep(FALSE,4),TRUE,rep(FALSE,4),TRUE,rep(FALSE,4),TRUE,rep(FALSE,4),TRUE,rep(FALSE,4),TRUE,rep(FALSE,4),TRUE,rep(FALSE,4),TRUE,rep(FALSE,10)),
           #is.summary=c(TRUE,TRUE,TRUE,rep(FALSE,2),TRUE,rep(FALSE,2),TRUE,rep(FALSE,2),TRUE,rep(FALSE,2),TRUE,rep(FALSE,2),TRUE,rep(FALSE,2),TRUE,rep(FALSE,2),TRUE,rep(FALSE,2),TRUE,rep(FALSE,10)),
           #is.summary=c(TRUE,rep(FALSE,10)),
           mean=c(NA,data$AOR), 
           lower=c(NA,data$down), upper=c(NA,data$up),
          #Figure2a
          #title ="Risk of first-time diagnosis of Alzheimer's disease in patients with type 2 diabetes \n(comparison between matched semaglutide vs other anti-diabetes medications groups)", 
          
          #Figure3a&b
          #title ="Risk of first-time diagnosis of Alzheimer's disease in women with type 2 diabetes \n(comparison between matched semaglutide vs other anti-diabetes medications groups)", 
          #title ="Risk of first-time diagnosis of Alzheimer's disease in men with type 2 diabetes \n(comparison between matched semaglutide vs other anti-diabetes medications groups)", 
          
          #Figure4a&b
          #title ="Risk of first-time diagnosis of Alzheimer's disease in patients with type 2 diabetes (with obesity)\n(comparison between matched semaglutide vs other anti-diabetes medications groups)", 
          #title ="Risk of first-time diagnosis of Alzheimer's disease in patients with type 2 diabetes (without obesity)\n(comparison between matched semaglutide vs other anti-diabetes medications groups)", 
          
          #Supplement_Figure2
          #title ="Risk of first-time diagnosis of Alzheimer's disease in patients with type 2 diabetes (age ≥ 60)\n(comparison between matched semaglutide vs other anti-diabetes medications groups)", 
          
          
          
          #Supplement_Figure3a-c
          #title ="Risk of Alzheimer's disease-related medication prescriptions in patients with type 2 diabetes\n(comparison between matched semaglutide vs other anti-diabetes medications groups)", 
          #title ="Risk of Alzheimer's disease-related medication prescriptions in patients with type 2 diabetes (with obesity) \n(comparison between matched semaglutide vs other anti-diabetes medications groups)", 
          #title ="Risk of Alzheimer's disease-related medication prescriptions in patients with type 2 diabetes (without obesity) \n(comparison between matched semaglutide vs other anti-diabetes medications groups)", 
          
          #Supplement_Figure4a&b
          #title ="Risk of overall medical encounters in patients with type 2 diabetes\n(comparison between matched semaglutide vs other anti-diabetes medications groups)", 
          title ="Risk of overall outpatient medical encounters in patients with type 2 diabetes\n(comparison between matched semaglutide vs other anti-diabetes medications groups)", 
         
           xticks=log(c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,2,3,4,5,6,7,8,9,10)), # log 10 scale, comment out if you want linear scale
           xlog = TRUE, # set to FALSE if you use linear scale
           xlab="Hazard Ratio (HR)",
           
           #### Add horizontal lines on the plot
           hrzl_lines=list("2" = gpar(lwd = 1.2, lty=1, col='black')
                         
                           
           ),
          
          #txt_gp=fpTxtGp(label=list(gpar(cex=1.5,fontface='bold'),gpar(cex=1.5),gpar(cex=1.5),gpar(cex=1.5),gpar(cex=1.5),gpar(cex=1.5),gpar(cex=1.5)),
          txt_gp=fpTxtGp(label=list(gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9),gpar(cex=0.9)),
                         ticks=gpar(cex=0.9),
                         xlab=gpar(cex=0.9,col='black',fontface='bold'),
                         #xlab=gpar(cex = 1.8),
                         title=gpar(cex = 1.3)),
          #clip=c(0.001, 4.5), 
          
          col=fpColors(box="black", lines="black", zero = "black"),
          lwd.zero = 001,
          lwd.xaxis = 0.7,
          mar = unit(c(0,0,0,0), "mm"),
          zero=1, cex=0.01, lineheight = unit(3, "mm"), boxsize=0.2, colgap=unit(3,"mm"),
          lwd.ci=0.8, ci.vertices=TRUE, ci.vertices.height = 0.15)

dev.off()


