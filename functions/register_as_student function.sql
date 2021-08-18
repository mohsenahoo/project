CREATE OR REPLACE FUNCTION main.register_as_student(text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare 
cmd text;
x varchar;
lastname varchar (50);
firstname varchar (50);
	username varchar(50)=$1::json->>'susername';
begin
   select susername into x from main.student where susername =username ;

		if (x is null )then
	 	   cmd='insert into main.student(fname,lname,susername,spasword,phone,email) 
 	      	values ('''|| (($1::json->>'fname'))|| ''','''|| (($1::json->>'lname'))|| ''',
 			'''|| (($1::json->>'susername'))|| ''','''|| (($1::json->>'spasword'))|| ''','''|| (($1::json->>'phone'))|| '''
			,'''|| (($1::json->>'email'))|| ''')';
 		  --  return cmd;
 	      	execute cmd;
return 'successfully added';
			
		else
	
return 'your usernamr has already taken. try another one please!!!';

end if;
exception
	WHEN others THEN
		return SQLERRM;
END;
$function$
;
