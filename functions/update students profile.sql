CREATE OR REPLACE FUNCTION main.update_teachers_profile(profile text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare 
cmd text;
t_fname varchar(50) =$1::json->>'fname';
t_lname varchar(50) =$1::json->>'lname';
t_username varchar(50) =$1::json->>'tusername';
t_pasword varchar(50) =$1::json->>'tpasword';
t_phone varchar(50) =$1::json->>'phone';
t_major int =$1::json->>'major_id';
begin
	
	UPDATE main.teacher 
SET fname=t_fname , lname=t_lname  , tpasword=t_pasword ,phone=t_phone , major_id=t_major
WHERE tusername=t_username;

return 'your profile successfully updated';
exception
	WHEN others THEN
		return SQLERRM;
END;
$function$
;
