create schema Assignment;

use Assignment;

#Imported all the data for the Bajaj motors (i.e. Bajaj table) , Eicher Motors(i.e. eicher table), and similarly for hero, infosys, tcs and tvs


############################################# BAJAJ DATASET PREP #################################################################
select * from bajaj;

#Converting the text column into DATE type in the bajaj base table after inmporting
UPDATE bajaj 
SET `Date` = STR_TO_DATE(`Date`, '%d-%M-%Y') WHERE 1=1;


#Deleting the bajaj1 table if it already exists
drop table if exists `bajaj1`;
#Creating the new table bajaj1 where we are caluculatin the 20 day moving average and 50 day moving average
CREATE Table bajaj1
AS
SELECT Date
, `Close Price`
, CASE
  WHEN row_number() over w >= 20
  THEN avg(`Close Price`) over (order by Date rows 19 preceding) 
  ELSE NULL
  END as '20 Day MA'
, CASE
  WHEN row_number() over w >= 50
  THEN avg(`Close Price`) over (order by Date rows 49 preceding) 
  ELSE NULL
  END as '50 Day MA'
FROM bajaj
WINDOW w as (ORDER BY `Date`);


#Checking the contents of the bajaj1 table whre we have 20 Day Moving average and 50 day moving average
select * from bajaj1
order by date;

############################################# EICHER  DATASET PREP #################################################################
select * from eicher;

#Converting the text column into DATE type in the eicher base table after inmporting
UPDATE eicher 
SET `Date` = STR_TO_DATE(`Date`, '%d-%M-%Y') WHERE 1=1;

#Deleting the eicher1 table if it already exists
drop table if exists `eicher1`;
#Creating the new table eicher1 where we are caluculatin the 20 day moving average and 50 day moving average
CREATE Table eicher1
AS
SELECT Date
, `Close Price`
, CASE
  WHEN row_number() over w >= 20
  THEN avg(`Close Price`) over (order by Date rows 19 preceding) 
  ELSE NULL
  END as '20 Day MA'
, CASE
  WHEN row_number() over w >= 50
  THEN avg(`Close Price`) over (order by Date rows 49 preceding) 
  ELSE NULL
  END as '50 Day MA'
FROM eicher
WINDOW w as (ORDER BY `Date`);

#Checking the contents of the eicher1 table whre we have 20 Day Moving average and 50 day moving average
select * from eicher1
order by date;

############################################# HERO  DATASET PREP #################################################################
select * from hero;

#Converting the text column into DATE type in the eicher base table after inmporting
UPDATE hero 
SET `Date` = STR_TO_DATE(`Date`, '%d-%M-%Y') WHERE 1=1;


#Deleting the hero1 table if it already exists
drop table if exists `hero1`;
#Creating the new table hero1 where we are caluculatin the 20 day moving average and 50 day moving average
CREATE Table hero1
AS
SELECT Date
, `Close Price`
, CASE
  WHEN row_number() over w >= 20
  THEN avg(`Close Price`) over (order by Date rows 19 preceding) 
  ELSE NULL
  END as '20 Day MA'
, CASE
  WHEN row_number() over w >= 50
  THEN avg(`Close Price`) over (order by Date rows 49 preceding) 
  ELSE NULL
  END as '50 Day MA'
FROM hero
WINDOW w as (ORDER BY `Date`);

#Checking the contents of the hero1 table whre we have 20 Day Moving average and 50 day moving average
select * from hero1
order by date;


############################################# INFOSYS  DATASET PREP #################################################################
#Seeing the data in the infosys table
select * from infosys;

#Converting the text column into DATE type in the eicher base table after inmporting
UPDATE infosys 
SET `Date` = STR_TO_DATE(`Date`, '%d-%M-%Y') WHERE 1=1;

#Deleting the infosys1 table if it already exists
drop table if exists `infosys1`;
#Creating the new table infosys1 where we are caluculatin the 20 day moving average and 50 day moving average
CREATE Table infosys1
AS
SELECT Date
, `Close Price`
, CASE
  WHEN row_number() over w >= 20
  THEN avg(`Close Price`) over (order by Date rows 19 preceding) 
  ELSE NULL
  END as '20 Day MA'
, CASE
  WHEN row_number() over w >= 50
  THEN avg(`Close Price`) over (order by Date rows 49 preceding) 
  ELSE NULL
  END as '50 Day MA'
FROM infosys
WINDOW w as (ORDER BY `Date`);


#Checking the contents of the infosys1 table whre we have 20 Day Moving average and 50 day moving average
select * from infosys1
order by date;


############################################# TCS  DATASET PREP #################################################################
#Seeing the data in the tcs table
select * from tcs;

#Converting the text column into DATE type in the eicher base table after inmporting
UPDATE tcs 
SET `Date` = STR_TO_DATE(`Date`, '%d-%M-%Y') WHERE 1=1;

#Deleting the tcs1 table if it already exists
drop table if exists `tcs1`;
#Creating the new table tcs1 where we are caluculatin the 20 day moving average and 50 day moving average
CREATE Table tcs1
AS
SELECT Date
, `Close Price`
, CASE
  WHEN row_number() over w >= 20
  THEN avg(`Close Price`) over (order by Date rows 19 preceding) 
  ELSE NULL
  END as '20 Day MA'
, CASE
  WHEN row_number() over w >= 50
  THEN avg(`Close Price`) over (order by Date rows 49 preceding) 
  ELSE NULL
  END as '50 Day MA'
FROM tcs
WINDOW w as (ORDER BY `Date`);


#Checking the contents of the tcs1 table whre we have 20 Day Moving average and 50 day moving average
select * from tcs1
order by date;

############################################# TVS  DATASET PREP #################################################################
#Seeing the data in the tvs table
select * from tvs;

#Converting the text column into DATE type in the eicher base table after inmporting
UPDATE tvs 
SET `Date` = STR_TO_DATE(`Date`, '%d-%M-%Y') WHERE 1=1;

drop table if exists `tvs1`;
#Creating the new table tvs1 where we are caluculatin the 20 day moving average and 50 day moving average
CREATE Table tvs1
AS
SELECT Date
, `Close Price`
, CASE
  WHEN row_number() over w >= 20
  THEN avg(`Close Price`) over (order by Date rows 19 preceding) 
  ELSE NULL
  END as '20 Day MA'
  , CASE
  WHEN row_number() over w >= 50
  THEN avg(`Close Price`) over (order by Date rows 49 preceding) 
  ELSE NULL
  END as '50 Day MA'
FROM tvs
WINDOW w as (ORDER BY `Date`);

#Checking the contents of the tvs1 table whre we have 20 Day Moving average and 50 day moving average
select * from tvs1
order by date;


############################################# 2. MASTER TABLE PREP #################################################################
#dropping the master table if exists
drop table if exists `master`;

#Creating the master table
CREATE Table master
AS
select b.date, 
b.`close price` as Bajaj,
t.`close price` as TCS,
tv.`close price` as TVS,
i.`close price` as Infosys,
e.`close price` as Eicher,
h.`close price` as Hero
from bajaj1 b
join eicher1 e using (date)
join hero1 h using (date)
join infosys1 i using (date)
join tcs1 t using (date)
join tvs1 tv using (date);

##3. Use the table created in Part(1) to generate buy and sell signal. Store this in another table named 'bajaj2'. Perform this operation for all stocks.##
################################################bajaj2###############################################################################
#dropping the bajaj2 table if exists
drop table if exists `bajaj2`;

#Creating the table with signal based on golden cross and death cross technique
CREATE table bajaj2 
AS
SELECT Date
, `Close Price`
, CASE 
	WHEN(`20 Day MA` IS NULL) OR (`50 Day MA` IS NULL) 
    THEN 'HOLD'
	ELSE
	CASE
		WHEN `20 Day MA` >= `50 Day MA` 
        THEN
			CASE WHEN LAG(`20 Day MA`) OVER w < LAG(`50 Day MA`) OVER w 
				 THEN 'BUY' 
                 ELSE 'HOLD' 
                 END
		ELSE
			CASE 
				WHEN LAG(`20 Day MA`) OVER w > LAG(`50 Day MA`) OVER w 
				THEN 'SELL' 
                ELSE 'HOLD' 
                END
	END
END as `Signal`
FROM `bajaj1`
WINDOW w as (ORDER BY `Date`);



#######################################################eicher2###################################################################
#dropping the eicher2 table if exists
drop table if exists `eicher2`;

#Creating the table with signal based on golden cross and death cross technique
CREATE table eicher2 
AS
SELECT Date
, `Close Price`
, CASE 
	WHEN(`20 Day MA` IS NULL) OR (`50 Day MA` IS NULL) 
    THEN 'HOLD'
	ELSE
	CASE
		WHEN `20 Day MA` >= `50 Day MA` 
        THEN
			CASE WHEN LAG(`20 Day MA`) OVER w < LAG(`50 Day MA`) OVER w 
				 THEN 'BUY' 
                 ELSE 'HOLD' 
                 END
		ELSE
			CASE 
				WHEN LAG(`20 Day MA`) OVER w > LAG(`50 Day MA`) OVER w 
				THEN 'SELL' 
                ELSE 'HOLD' 
                END
	END
END as `Signal`
FROM `eicher1`
WINDOW w as (ORDER BY `Date`);



#######################################################hero2#######################################################
#dropping the hero2 table if exists
drop table if exists `hero2`;

#Creating the table with signal based on golden cross and death cross technique
CREATE table hero2 
AS
SELECT Date
, `Close Price`
, CASE 
	WHEN(`20 Day MA` IS NULL) OR (`50 Day MA` IS NULL) 
    THEN 'HOLD'
	ELSE
	CASE
		WHEN `20 Day MA` >= `50 Day MA` 
        THEN
			CASE WHEN LAG(`20 Day MA`) OVER w < LAG(`50 Day MA`) OVER w 
				 THEN 'BUY' 
                 ELSE 'HOLD' 
                 END
		ELSE
			CASE 
				WHEN LAG(`20 Day MA`) OVER w > LAG(`50 Day MA`) OVER w 
				THEN 'SELL' 
                ELSE 'HOLD' 
                END
	END
END as `Signal`
FROM `hero1`
WINDOW w as (ORDER BY `Date`);




#######################################################infosys2#######################################################
#dropping the hero2 table if exists
drop table if exists `infosys2`;

#Creating the table with signal based on golden cross and death cross technique
CREATE table infosys2 
AS
SELECT Date
, `Close Price`
, CASE 
	WHEN(`20 Day MA` IS NULL) OR (`50 Day MA` IS NULL) 
    THEN 'HOLD'
	ELSE
	CASE
		WHEN `20 Day MA` >= `50 Day MA` 
        THEN
			CASE WHEN LAG(`20 Day MA`) OVER w < LAG(`50 Day MA`) OVER w 
				 THEN 'BUY' 
                 ELSE 'HOLD' 
                 END
		ELSE
			CASE 
				WHEN LAG(`20 Day MA`) OVER w > LAG(`50 Day MA`) OVER w 
				THEN 'SELL' 
                ELSE 'HOLD' 
                END
	END
END as `Signal`
FROM `infosys1`
WINDOW w as (ORDER BY `Date`);


#######################################################tcs2#######################################################
#dropping the tcs2 table if exists
drop table if exists `tcs2`;

#Creating the table with signal based on golden cross and death cross technique
CREATE table tcs2 
AS
SELECT Date
, `Close Price`
, CASE 
	WHEN(`20 Day MA` IS NULL) OR (`50 Day MA` IS NULL) 
    THEN 'HOLD'
	ELSE
	CASE
		WHEN `20 Day MA` >= `50 Day MA` 
        THEN
			CASE WHEN LAG(`20 Day MA`) OVER w < LAG(`50 Day MA`) OVER w 
				 THEN 'BUY' 
                 ELSE 'HOLD' 
                 END
		ELSE
			CASE 
				WHEN LAG(`20 Day MA`) OVER w > LAG(`50 Day MA`) OVER w 
				THEN 'SELL' 
                ELSE 'HOLD' 
                END
	END
END as `Signal`
FROM `tcs1`
WINDOW w as (ORDER BY `Date`);


####################################################### tvs2 #######################################################
#dropping the tvs2 table if exists
drop table if exists `tvs2`;
#Creating the table with signal based on golden cross and death cross technique
CREATE table tvs2 
AS
SELECT Date
, `Close Price`
, CASE 
	WHEN(`20 Day MA` IS NULL) OR (`50 Day MA` IS NULL) 
    THEN 'HOLD'
	ELSE
	CASE
		WHEN `20 Day MA` >= `50 Day MA` 
        THEN
			CASE WHEN LAG(`20 Day MA`) OVER w < LAG(`50 Day MA`) OVER w 
				 THEN 'BUY' 
                 ELSE 'HOLD' 
                 END
		ELSE
			CASE 
				WHEN LAG(`20 Day MA`) OVER w > LAG(`50 Day MA`) OVER w 
				THEN 'SELL' 
                ELSE 'HOLD' 
                END
	END
END as `Signal`
FROM `tvs1`
WINDOW w as (ORDER BY `Date`);


##4. Create a User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock.##
#Creating a function named getBajajSignal to get the recommendation, the function takes date as input and gives the signal as output
delimiter $$
CREATE FUNCTION getBajajSignal (`reqDate` Date)
RETURNS varchar(5) deterministic
begin
DECLARE `result` char(4);
(select `Signal` into result from bajaj2 where Date=reqDate);
RETURN `result`;
end; $$

#Testing the getBajajSignal Function
SELECT getBajajSignal("2015-12-23") as 'Recommendation';

##4. Analysis##
##To understand the closing prices of the stocks with respect to the max and min date 
select * from master
where date in ('2015-01-01','2018-07-31')

#To get the frequency of different Signals over the period of time 
#A pivot operation is being performed on the below obstained result to understnad the recommendations frequencies
select b.date, 
b.`Signal` as Bajaj,
t.`Signal` as TCS,
tv.`Signal` as TVS,
i.`Signal` as Infosys,
e.`Signal` as Eicher,
h.`Signal` as Hero
from bajaj2 b
join eicher2 e using (date)
join hero2 h using (date)
join infosys2 i using (date)
join tcs2 t using (date)
join tvs2 tv using (date)


