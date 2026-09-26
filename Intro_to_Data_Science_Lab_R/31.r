student <- data.frame(
  ID = 1:10,
  Name = c("Anita","Rahul","Meena","Kiran","Sana",
           "Arjun","Divya","Vikram","Priya","Ravi"),
  Age = c(20,21,20,22,21,23,20,22,21,24),
  Marks = c(78,85,67,91,73,59,88,64,95,70),
  Study_Hours = c(5,7,4,8,6,3,8,4,9,5),
  Placed = c("Yes","Yes","No","Yes","Yes",
             "No","Yes","No","Yes","Yes")
)

head(student); tail(student); str(student)
dim(student); names(student); summary(student)

student$Placed <- as.factor(student$Placed)
levels(student$Placed)

student$Study_Hours[4] <- NA
colSums(is.na(student))

mean_hours <- mean(student$Study_Hours, na.rm=TRUE)
student$Study_Hours[is.na(student$Study_Hours)] <- mean_hours

student <- rbind(student, student[5, ])
sum(duplicated(student))
student[duplicated(student), ]

student <- student[!duplicated(student), ]

student$Placed_Code <- ifelse(student$Placed=="Yes", 1, 0)

student$Marks_Normalized <-
  (student$Marks-min(student$Marks)) /
  (max(student$Marks)-min(student$Marks))

student$Marks_Standardized <- as.numeric(scale(student$Marks))

student[,c("Marks","Marks_Normalized","Marks_Standardized")]

write.csv(student,"my_student_data_preprocessed.csv",row.names=FALSE)
