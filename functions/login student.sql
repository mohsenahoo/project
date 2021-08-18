CREATE OR REPLACE FUNCTION main.login_student(login text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare 
cmd text;
x varchar(50);
y varchar(50);
username varchar(50)=$1::json->>'susername';
pasword varchar(50)=$1::json->>'spasword';


 begin
   select susername, spasword into x ,y from main.student where susername =username ;

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
