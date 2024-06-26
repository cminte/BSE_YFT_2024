#' xxx
#' 
#' \code{create.fishery.flg.f.YFT} yyy
#' 
#' @export

create.fishery.flg.f.YFT = function(strat.defns,PS)
{

  # number of records in input vectors
  nrecs<-nrow(strat.defns)
  # print(nrecs)
  
  # compute quarter id vector
  quarter<-ceiling(strat.defns$month/3)
  
  # YFT SAC 15 assessment (2024)
  
  if(PS=="DEL") {
    print("Using fishery stratification: YFT SAC 15 for DEL")
    areagear<-rep(NA,nrecs)
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==1]<-"FO.A1"
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==2]<-"FO.A2"
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==3]<-"FO.A3"
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==4]<-"FO.A4"
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==5]<-"FO.A5"
    
    
    areagear[(strat.defns$gear==3 | strat.defns$gear==6) & strat.defns$area==1]<-"UN.A1"
    areagear[(strat.defns$gear==3 | strat.defns$gear==6) & strat.defns$area==2]<-"UN.A2"
    areagear[(strat.defns$gear==3 | strat.defns$gear==6) & strat.defns$area==3]<-"UN.A3"
    areagear[(strat.defns$gear==3 | strat.defns$gear==6) & strat.defns$area==4]<-"UN.A4"
    areagear[(strat.defns$gear==3 | strat.defns$gear==6) & strat.defns$area==5]<-"UN.A5"
    
    
    
    areagear[(strat.defns$gear==4 | strat.defns$gear==7) & strat.defns$area==1]<-"DP.A1"
    areagear[(strat.defns$gear==4 | strat.defns$gear==7) & strat.defns$area==2]<-"DP.A2"
    areagear[(strat.defns$gear==4 | strat.defns$gear==7) & strat.defns$area==3]<-"DP.A3"
    areagear[(strat.defns$gear==4 | strat.defns$gear==7) & strat.defns$area==4]<-"DP.A4"
    areagear[(strat.defns$gear==4 | strat.defns$gear==7) & strat.defns$area==5]<-"DP.A5"
    }
  
  if(PS=="NOA") {
    print("Using fishery stratification: YFT SAC 14 for UNA based on DEL")
    areagear<-rep(NA,nrecs)
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & (strat.defns$area==1 | strat.defns$area==3)]<-"FO.A1"
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & (strat.defns$area==2 | strat.defns$area==4)]<-"FO.A2"

    areagear[(strat.defns$gear==3 | strat.defns$gear==6) & strat.defns$area==1]<-"UN.A1"
    areagear[(strat.defns$gear==3 | strat.defns$gear==6) & strat.defns$area==2]<-"UN.A2"
    areagear[(strat.defns$gear==3 | strat.defns$gear==6) & strat.defns$area==3]<-"UN.A3"
    areagear[(strat.defns$gear==3 | strat.defns$gear==6) & strat.defns$area==4]<-"UN.A4"

    areagear[(strat.defns$gear==4 | strat.defns$gear==7) & (strat.defns$area==1 | strat.defns$area==3)]<-"DP.A1"
    areagear[(strat.defns$gear==4 | strat.defns$gear==7) & (strat.defns$area==2 | strat.defns$area==4)]<-"DP.A2"
  }

  if(PS=="OBJ") {
    print("Using fishery stratification: YFT SAC 15 for OBJ based on DEL")
    areagear<-rep(NA,nrecs)
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==1]<-"FO.A1"
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==2]<-"FO.A2"
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==3]<-"FO.A3"
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==4]<-"FO.A4"
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==5]<-"FO.A5"
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==6]<-"FO.A6"
    areagear[(strat.defns$gear==2 | strat.defns$gear==5) & strat.defns$area==7]<-"FO.A7"
    

    areagear[(strat.defns$gear==3 | strat.defns$gear==6) & strat.defns$area<5]<-"UN.A1"
    areagear[(strat.defns$gear==3 | strat.defns$gear==6) & strat.defns$area==5]<-"UN.A2"

    areagear[(strat.defns$gear==4 | strat.defns$gear==7) & strat.defns$area<5]<-"DP.A1"
    areagear[(strat.defns$gear==4 | strat.defns$gear==7) & strat.defns$area==5]<-"DP.A2"
  }

  # return fishery ids data frame
  return(list(fishery.quarter=quarter,fishery.areagear=areagear))
}
