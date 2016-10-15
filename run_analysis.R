library(plyr)
library(dplyr)
library(tidyr)
library(reshape2)

trainx <- read.table("~/X_train.txt")
trainy <- read.table("~/y_train.txt")
trainsub <- read.table("~/subject_train.txt")
testx <- read.table ("~/X_test.txt")
testy <- read.table("~/y_test.txt")
testsub <- read.table("~/subject_test.txt")

trainsub <- rename(trainsub, "subjectid" = V1)
trainy <- rename(trainy, "activityid" = V1)
testsub <- rename(testsub, "subjectid" = V1)
testy <- rename(testy, "activityid" = V1)

test <- cbind(testsub,testy, testx)
train <- cbind(trainsub, trainy, trainx)
data <- rbind(test,train)

datat <- data%>%select(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 
                255:256, 268:273, 296:298, 347:352, 375:377, 426:431, 454:456, 505:506, 515, 518:519,
                528, 531:532, 541, 544:545, 554)%>%
        mutate(activityid = recode(data$activityid, `1`="walking", `2`="walkingupstairs",
                          `3`="walkingdownstairs", `4`="sitting", `5`="standing", `6`="laying"))%>%
        gather(variable,value,-c(subjectid,activityid))%>%
        mutate(domain=ifelse(variable %in% c("V1","V2","V3","V4","V5","V6",
                                         "V41","V42","V43","V44","V45","V46",
                                         "V81","V82","V83","V84","V85","V86",
                                         "V121","V122","V123","V124","V125","V126",
                                         "V161","V162","V163","V164","V165","V166",
                                         "V201","V202","V214","V215","V227","V228",
                                         "V240","V241","V253","V254"),"time","frequency"))%>%
        mutate(source=ifelse(variable %in% c("V41","V42","V43","V44","V45","V46",
                                             "V214","V215"),"gravity","body"))%>%
        mutate(tool=ifelse(variable %in% c("V121","V122","V123","V124","V125","V126",
                                           "V161","V162","V163","V164","V165","V166",
                                           "V253","V254", "V424","V425","V426", "V427",
                                           "V428","V429","V452","V453","V454",
                                           "V529","V530","V539","V542","V543","V552")
                           ,"gyroscope","accelerometer"))%>%
        mutate(measurement=ifelse(variable %in% c("V294","V295","V296","V373","V374","V375",
                                                  "V452","V453","V454","V513","V526","V539","V552"),
                                  "frequencymean",ifelse(variable %in% 
                                                           c("V4","V5","V6","V44","V45","V46",
                                                             "V84","V85","V86","V124","V125","V126",
                                                             "V164","V165","V166","V202","V215","V228",
                                                             "V241","V254","V269","V270","V271",
                                                             "V348","V349","V350","V427","V428","V429",
                                                             "V504","V517","V530","V543"),
                                                         "standarddeviation","mean")))%>%
        mutate(axis=ifelse(variable %in% c("V1","V4","V41","V44","V81","V84","V121","V124","V161",
                                           "V164","V266","V269","V294","V345","V348","V373","V424",
                                           "V427","V452"),"x",ifelse(variable %in% c("V2","V5","V42",
                                                                              "V45","V82","V85","V122",
                                                                              "V125","V162","V165",
                                                                              "V267","V270","V295",
                                                                              "V346","V349","V374",
                                                                              "V425","V428","V453"),"y",
                                                           ifelse(variable %in% c("V3","V6","V43","V46",
                                                                                  "V83","V86","V123",
                                                                                  "V126","V163","V166",
                                                                                  "V268","V271","V296",
                                                                                  "V347","V350","V375",
                                                                                  "V426","V429","V454"),
                                                                                  "z","NA")))) %>%
        mutate(jerk=ifelse(variable %in% c("V81","V82","V83","V84","V85","V86",
                                         "V161","V162","V163","V164","V165","V166",
                                         "V227","V228","V253","V254","V345","V346","V347",
                                         "V348","V349","V350","V373","V374","V375",
                                         "V516","V517","V526","V542","V543","V552"),"yes","no")) %>%
        mutate(magnitude=ifelse(variable %in% c("V201","V202","V214","V215","V227","V228",
                                                "V240","V241","V253","V254","V503","V504",
                                                "V513","V516","V517","V526","V529","V530",
                                                "V539","V542","V543","V552"),"yes","no"))%>%
        arrange(axis,magnitude,jerk,measurement,tool,source,domain,activityid,subjectid)

datat <- datat[,c("subjectid","activityid","domain","source","tool","measurement",
                  "jerk","magnitude", "axis","value")]

tidydata <- aggregate(datat[,10],datat[,1:9],mean)

tidydatawrite <- write.table(tidydata,"~/tidydata.txt")


