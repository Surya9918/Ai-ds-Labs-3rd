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
print(student)
head(student)
tail(student)
str(student)
dim(student)
nrow(student)
ncol(student)
names(student)


cat("\nMissing values:\n")
print(colSums(is.na(student)))

cat("\nNumber of duplicate rows:", sum(duplicated(student)), "\n")
if(sum(duplicated(student)) > 0) {
  student <- student[!duplicated(student), ]
  cat("Duplicates removed. New dimension:", nrow(student), "x", ncol(student), "\n")
}

student$Marks_Normalized <- (student$Marks - min(student$Marks)) / 
                             (max(student$Marks) - min(student$Marks))
student$Age_Normalized <- (student$Age - min(student$Age)) / 
                          (max(student$Age) - min(student$Age))

cat("\nData Summary After Preprocessing\n")
str(student)
summary(student)