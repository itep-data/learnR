library(dplyr)

set.seed(123)

#Jakku
origin <- c('Tuanul',"Reestki","Cratertown","Blowback Town","Outskirts")
dest <- c("Niima Outpost","Raiders","Trade caravan")

parts <- data.frame(desc = c("Acceleration compensator","Activation cylinder","Antishock field",
                              "Atmospheric processor","Atmospheric thrusters","Atomic drive",
                              "Attitude thruster","Aural sensor","Backup hyperdrive",
                             "Black box","Bulkhead","Carbon-Durasteel Armor",
                             "Dedicated energy receptor","Dual-drive system","Electromagnetic discharge filter",
                             "Electrotelescope","Energy-wave detector",'Enviro filter',
                             "Flight recorder","Full-spectrum transceiver","Hull Panel",
                             "Hyperdrive","Hyperdrive motivator","Inertial compensator",
                             "Ion drive","Ion engine","Landing jet",
                              "Lateral thruster","Magnetic turbine","Main drive",
                             "Maneuvering jet","Microthruster","Navigation computer",
                             "Optical transducer panel","Proximity sensor","Reactant agitator injector",
                             "Repulsorlift array","Repulsorlift generator","Retrorocket",
                             "Starship sensor array","Sublight drive","Sublight engine",
                             "Turbo injector","Vitus-Series Attitude Thrusters"),
                    pounds = c(1.5,25,153,
                               467,2697,5001,
                               1369,NA,45,
                               15,321,4,
                               NA,78,NA,
                               198,125,3,
                               NA,457,641,
                               6021,NA,687,
                               945,NA,NA,
                               NA,6872,789,
                               NA,39,NA,
                               1237,NA,NA,
                               467,232,NA,
                               637,NA,NA,
                               NA,NA),
                    units = c("Items","Items","Items",
                              "Items","Items","Items",
                              "Items","Tons","Items",
                              "Items","Cubic Yards","Items",
                              "Tons","Items","Tons",
                              "Items","Items","Items",
                              "Tons","Items","Cubic Yards",
                              "Items","Tons","Items",
                              "Items","TONS","Tons",
                              "Tons","Items","Items",
                              "Tons","Items","Tons",
                              "Items","Tons","Tons",
                              "Cubic Yards","Items","Tons",
                              "Cubic Yards","Tons","Tons",
                              "Tons","Tons"),
                    price = round(rexp(44,.001),2),
                    stringsAsFactors = FALSE)


data <- data.frame(Salvage = sample(parts$desc, replace = TRUE, size = 573), 
                   Origin = sample(origin, replace = TRUE, size = 573),
                   Dest = sample(dest),
                   Amount = round(rexp(573,.0002),0),
                   stringsAsFactors = FALSE)

data <- inner_join(data, parts, by = c("Salvage" = "desc")) %>% 
  select(Salvage, Origin, Dest, Amount, Units = units, Price_per_Ton = price)


total <- data.frame(Salvage = "Total",
                    Units = "Tons",
                    Origin = "All",
                    Dest ="All",
                    Amount = sum(data$Amount),
                    Price_per_Ton = sum(data$Price_per_Ton))

jakku_data_full <-bind_rows(data,total)

jakku_data_tons <- filter(jakku_data_full, Units %in% c("Tons","TONS"))

write.csv(jakku_data_tons, "starwars_scrap_jakku.csv",row.names = FALSE)
write.csv(jakku_data_full, "starwars_scrap_jakku_full.csv",row.names = FALSE)
write.csv(parts, "conversion_table.csv", row.names = FALSE)
