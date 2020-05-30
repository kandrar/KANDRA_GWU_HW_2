-- Drop table if exists
DROP TABLE firepower;
-- Create new table to import data
CREATE TABLE firepower (
	country VARCHAR,
	ISO3 VARCHAR,
	rank INT,
	TotalPopulation INT,
	ManpowerAvailable INT,
	TotalMilitaryPersonnel INT,
	ActivePersonnel INT,
	ReservePersonnel INT,
	TotalAircraftStrength INT,
	FighterAircraft INT,
	AttackAircraft INT,
	TotalHelicopterStrength INT,
	AttackHelicopters INT 
SELECT * FROM firepower;	
delete from firepower where ReservePersonnel = 0;
update firepower set FighterAircraft = 1 where fighteraircraft = 0;
update firepower set TotalAircraftStrength = TotalAircraftStrength + 1
where fighteraircraft =1;
SELECT AVG(TotalMilitaryPersonnel) as Avg_MilitaryPersonnel
	,AVG(TotalAircraftStrength) as Avg_AircraftStrength
	,AVG(TotalHelicopterStrength) as Avg_HelicopterStrength
	,AVG(TotalPopulation) as Avg_Population
from firepower;