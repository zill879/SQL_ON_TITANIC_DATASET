use titanic;

create table tit(
PassengerId int,
Survived int,
Pclass int,
Name varchar(250),
Sex varchar(10),
Age numeric,
SibSp numeric,
Parch numeric,
Ticket int,
Fare numeric,
Cabin varchar(10),
Embarked varchar(10)
);
show tables;
select * from tested;
select count(*) from tested where passengerid<>0;
drop table tit;
select count(passengerid) from tested where survived=0;#147 didn't  survived
select count(passengerid) from tested where 
(survived=0 and pclass=3);#71 did't survive that are in pclass=3
select count(passengerid) from tested where pclass=3;#total 110 pclass=3
select count(passengerid) from tested where survived=1;#84  survived
select count(passengerid) from tested where 
(survived=1 and pclass=3);#39 survived 
select age,count(passengerid) from tested where 
(survived=0 and pclass=3) group by(age);#show group age that not survive in pclass=3
select age,count(passengerid) from tested where 
(survived=1 and pclass=3) group by age order by age;#show group by age that survive in pclass=3 in ascend order
select sex,count(passengerid) AS Survived from tested where (survived=1 and  pclass=3) group by sex order by Survived; 
select passengerid,name,sex  from tested where 
(survived=1 and pclass=3);#39 total survived in pclass and all of them are female
select (select count(passengerid) from tested where (survived=1 and pclass=3 and sex="female"))/
(select count(passengerid) from tested where(survived=1 and pclass=3)) AS avg_female_survived_Pclass3;
select (select count(passengerid) from tested where (survived=1 and pclass=3 and sex="male"))/
(select count(passengerid) from tested where(survived=1 and pclass=3)) AS avg_male_survived_Pclass3;
select age,count(passengerid)/(select count(passengerid) from tested where (survived=1 and pclass=3)) AS avg_survived_per_age 
from tested where (survived=1 and pclass=3) group by age order by age;
select embarked,count(passengerid) AS count from tested group by embarked order by count; 
select embarked,count(passengerid) as count from tested where (pclass=3) group by embarked order by count;
select embarked,count(passengerid) as count from tested where (survived=1 and pclass=3) group by embarked order by count;
select embarked,(count(passengerid)/(select count(passengerid) from tested where(survived=1 and pclass=3))) AS avg_survived_per_embarked 
from tested where(survived=1 and pclass=3)group by embarked order by avg_survived_per_embarked;
select round(avg(age)) from tested where survived=1 and pclass=3;
select embarked,round(avg(age)) as avg_age from tested where survived=1 and pclass=3 group by embarked order by avg_age;

SELECT count(passengerid) AS survived_pclass2
FROM tested 
WHERE survived=1 AND pclass=2;# 15 survived
SELECT count(passengerid) AS total_pclass
FROM tested 
WHERE pclass=2;#55 in toal
SELECT count(passengerid) AS unsurvived_pclass2
FROM tested 
WHERE survived=0 AND pclass=2;#40 not survived
SELECT sex,count(passengerid) as survived_gender
FROM tested
WHERE survived=1 AND pclass=2
GROUP BY sex ORDER BY survived_gender;#no male survive only 15 female survived
SELECT embarked,count(passengerid) as embarked_from
FROM tested
WHERE survived=1 AND pclass=2
GROUP BY embarked ORDER BY embarked_from;#all of them survuved from s
SELECT embarked,count(passengerid) as embarked_total_class2
FROM tested
WHERE pclass=2
GROUP BY embarked ORDER BY embarked_total_class2;#show emarked from places
SELECT age,count(passengerid) AS age_count
FROM tested
WHERE pclass=2
GROUP BY age ORDER BY age_count;#age of all peolpe in titanic class2
SELECT age,count(passengerid) AS age_count
FROM tested
WHERE pclass=2 AND survived=1;# age of class2 survived
SELECT round(avg(age)) as avg_cutomer_age_class2_survived
FROM tested
WHERE survived=1 AND pclass=2;#avg age of survived
SELECT round(avg(age)) as avg_customer_age_class2
FROM tested 
WHERE pclass=2;#avg age of survived
SELECT age,name,CASE WHEN survived=1 AND pclass=2 AND 30>age THEN passengerid END AS suvival_coampare
FROM tested WHERE survived=1 AND pclass=2;
SELECT age,count(CASE WHEN survived=1 AND pclass=2 AND 30>age THEN passengerid END )AS suvival_coampare
FROM tested WHERE survived=1 AND pclass=2
GROUP BY age;
SELECT ((SELECT count(passengerid) FROM tested WHERE survived=1 AND pclass=2)/(SELECT count(passengerid) FROM 
tested WHERE  pclass=2)) AS pro_survival_of_class2 ;

SELECT count(passengerid) AS class1_total
FROM tested WHERE pclass=1;#66
SELECT count(passengerid) AS class1_total_survived
FROM tested WHERE pclass=1 AND survived=1;# 30 survived
SELECT sex,count(passengerid) AS class1_geneder_survive
FROM tested WHERE pclass=1 AND survived=1
GROUP BY sex;#30 female
SELECT sex,count(passengerid) AS class1_geneder_survive
FROM tested WHERE pclass=136 
GROUP BY sex;#36 male 30 female
SELECT age,count(passengerid) AS age
FROM tested 
WHERE survived=1 AND pclass=1 GROUP BY age;
SELECT age,count(passengerid) AS age
FROM tested 
WHERE  pclass=1 GROUP BY age;
SELECT (SELECT avg(age) FROM tested WHERE pclass=1) AS avg_age_of_all,(SELECT avg(age) FROM tested WHERE survived
=1 AND pclass=1) AS avg_age_of_survival_class1;
SELECT ((SELECT count(passengerid) FROM tested WHERE survived=1 AND pclass=1)/(SELECT count(passengerid) FROM 
tested WHERE  pclass=1)) AS pro_survival_of_class1 ;
SELECT embarked,count(passengerid) AS count_emarked
FROM tested 
WHERE pclass=1 GROUP BY embarked;
SELECT embarked,count(passengerid) AS count_emarked
FROM tested 
WHERE pclass=1 AND survived= 1 GROUP BY embarked;
SELECT embarked,round(avg(age)) AS avg_age_emarked
FROM tested 
WHERE pclass=1 AND survived= 1 GROUP BY embarked;
