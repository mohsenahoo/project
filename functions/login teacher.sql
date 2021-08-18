CREATE OR REPLACE FUNCTION main.login_teacher(login text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare 
cmd text;
x varchar(50);
y varchar(50);
username varchar(50)=$1::json->>'tusername';
pasword varchar(50)=$1::json->>'tpasword';


 begin
   select tusername, tpasword into x ,y from main.teacher where tusername =username ;

		if (y=pasword)then

return 'successfully loged in';
			
		else
	
return 'oops!!! something went wrong';

end if;
exception
	WHEN others THEN
		return SQLERRM;
END;
$function$
;
