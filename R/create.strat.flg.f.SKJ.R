#' xxx
#' 
#' \code{create.strat.flg.f.SKJ} yyy
#' 
#' @export

create.strat.flg.f.SKJ = function(lat.5deg,lon.5deg,is.lwrght,month,setype,vessel.class,PS) {

  # number of records in input vectors
  nrecs<-length(lat.5deg)
  
  # initialize and fill gear vector
  gear<-rep(NA,nrecs)
  gear[setype==1 & vessel.class<=5]<-4
  gear[setype==1 & vessel.class==6]<-7
  gear[setype==4 & vessel.class<=5]<-3
  gear[setype==4 & vessel.class==6]<-6
  gear[setype==5 & vessel.class<=5]<-2
  gear[setype==5 & vessel.class==6]<-5
  
  # if lat.5deg and lon.5deg are lower right corner, convert these to 5 degree square center
  if(is.lwrght){
    lat.5deg<-lat.5deg+2.5
    lon.5deg<-lon.5deg-2.5
  }
  
  # SKJ Mark assessment for SAC 2022
  
  # Catch areas for SKJ in OBJ
  if(PS=="OBJ")  {
    area<-rep(1,nrecs)
    area[lon.5deg>=(-117.5) & lon.5deg<=(-97.5) & lat.5deg<=(-7.5)]<-2
    area[lon.5deg>=(-92.5) & lat.5deg<=(-17.5)]<-3
    area[lon.5deg>=(-92.5) & lat.5deg>=(-12.5) & lat.5deg<=(-7.5)]<-4
    area[lon.5deg>=(-117.5) & lat.5deg>=(-2.5)]<-5
    
    print("Using fishery stratification: SKJ assessment 2024 for OBJ")
    
    # Fishery area-gears for SKJ in OBJ (DEL and UNA are junk)
    fishery.areagear<-rep(NA,nrecs)
    fishery.areagear[(gear==2 | gear==5) & area==1]<-"FO.A1"
    fishery.areagear[(gear==2 | gear==5) & area==2]<-"FO.A2"
    fishery.areagear[(gear==2 | gear==5) & area==3]<-"FO.A3"
    fishery.areagear[(gear==2 | gear==5) & area==4]<-"FO.A4"
    fishery.areagear[(gear==2 | gear==5) & area==5]<-"FO.A5"
    
    fishery.areagear[(gear==3 | gear==6) & area==1]<-"UN.A1"
    fishery.areagear[(gear==3 | gear==6) & area>1]<-"UN.A2"
    
    fishery.areagear[(gear==4 | gear==7) & area==1]<-"DP.A1"
    fishery.areagear[(gear==4 | gear==7) & area>1]<-"DP.A2"
  }
  
  if(PS=="DEL") {
    area<-rep(1,nrecs)
    area[lat.5deg<=(-2.5)]<-2
    
    print("Using fishery stratification: SKJ assessment 2024 for DEL")
    
    # Fishery area-gears for SKJ in DEL (UNA and OBJ are junk)
    fishery.areagear<-rep(NA,nrecs)
    fishery.areagear[(gear==2 | gear==5) & area==1]<-"FO.A1"
    fishery.areagear[(gear==2 | gear==5) & area>1]<-"FO.A2"
    #
    fishery.areagear[(gear==3 | gear==6) & area==1]<-"UN.A1"
    fishery.areagear[(gear==3 | gear==6) & area>1]<-"UN.A2"
    #
    fishery.areagear[(gear==4 | gear==7) & area==1]<-"DP.A1"
    fishery.areagear[(gear==4 | gear==7) & area==2]<-"DP.A2"
  }
  
  if(PS=="NOA") {
    area<-rep(1,nrecs)
    area[lon.5deg>=(-122.5) & lat.5deg<=(-12.5)]<-2
    area[lon.5deg>=(-122.5) & lat.5deg<=(12.5) & lat.5deg>=(-7.5)]<-3
    area[lon.5deg>=(-122.5) & lat.5deg>=(17.5)]<-4
    
    print("Using fishery stratification: SKJ assessment 2024 for UNA")
    
    # Fishery area-gears for SKJ in UNA (DEL and OBJ are junk)
    fishery.areagear<-rep(NA,nrecs)
    fishery.areagear[(gear==2 | gear==5) & area==1]<-"FO.A1"
    fishery.areagear[(gear==2 | gear==5) & area>1]<-"FO.A2"

    fishery.areagear[(gear==3 | gear==6) & area==1]<-"UN.A1"
    fishery.areagear[(gear==3 | gear==6) & area==2]<-"UN.A2"
    fishery.areagear[(gear==3 | gear==6) & area==3]<-"UN.A3"
    fishery.areagear[(gear==3 | gear==6) & area==4]<-"UN.A4"

    fishery.areagear[(gear==4 | gear==7) & area==1]<-"DP.A1"
    fishery.areagear[(gear==4 | gear==7) & area>1]<-"DP.A2"
  }
  
  # return stratum id data frame
  stratum.id<-data.frame(area,month,gear,fishery.areagear)
  stratum.id$fishery.areagear<-as.character(stratum.id$fishery.areagear)
  
  return(stratum.id)
}