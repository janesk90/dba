SET GLOBAL log_bin_trust_function_creators = 1;
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `calendar_days_from_day`(
	d TIMESTAMP
)
RETURNS int
BEGIN
	IF WEEKDAY(d) = 0 OR WEEKDAY(d) = 6 THEN
		RETURN 4;
	ELSEIF WEEKDAY(d) = 5 THEN
		RETURN 5;
	ELSE
		RETURN 6;
	END IF;
END$$
DELIMITER ;
