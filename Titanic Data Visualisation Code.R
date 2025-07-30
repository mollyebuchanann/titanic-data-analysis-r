library(tidyverse)
titanic = read_csv("titanic.csv")

#PART 1
#Question 1.
titanic
nrow(titanic)

male = titanic %>%
  filter(Sex == 'male')
nrow(male)


female = titanic %>%
  filter(Sex == 'female')
nrow(female)

#Question 2.
under_18 = titanic %>%
  filter(Age < 18)
nrow(under_18)

over_70 = titanic %>%
  filter(Age > 70)
nrow(over_70)

#Question 3.
titanic %>%
  arrange(Age) %>%
  select(PassengerId, Name, Age)

titanic %>%
  arrange(desc(Age)) %>%
  select(PassengerId, Name, Age)

#Question 4.
pclass_1 = titanic %>%
  filter(Pclass == "1")
nrow(pclass_1)

pclass_2 = titanic %>%
  filter(Pclass == "2")
nrow(pclass_2)

pclass_3 = titanic %>%
  filter(Pclass == "3")
nrow(pclass_3)

#Question 5.
titanic %>%
  arrange(Fare) %>%
  select(Ticket, Fare)

#Question 6. 
survived = titanic %>%
  filter(Survived == "1")
nrow(survived)


#PART 2
ggplot(titanic) + geom_boxplot(aes(x = Fare, y = Pclass, group = Pclass), color = "blue", fill = "orange") +
  labs(x = "Cost of Ticket [£]", y = "Class", title = "Figure 1: A Summary of Passenger Class and Fare Price")

aggregate(titanic$Fare,
          list(titanic$Pclass),
          median)

#PART 3
survival = ggplot(titanic) + geom_col(aes(x= Pclass, y = Survived, fill = Sex)) +
  labs(title = "Figure 2: Survival Rate for Each Passenger Class and Gender",
       x = "Passenger Class", y = "Survived") + scale_fill_manual(values = c("blue", "orange"))
survival + coord_flip()