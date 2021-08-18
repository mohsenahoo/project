CREATE OR REPLACE FUNCTION main.register_as_teacher(text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare 
cmd text;
x varchar;
lastname varchar (50);
firstname varchar (50);
	username varchar(50)=$1::json->>'tusername';
begin
   select tusername into x from teacher where tusername =username ;

		if (x is null )then
	 	   cmd='insert into main.teacher(fname,lname,tusername,tpasword,phone,email) 
 	      	values ('''|| (($1::json->>'fname'))|| ''','''|| (($1::json->>'lname'))|| ''',
 			'''|| (($1::json->>'tusername'))|| ''','''|| (($1::json->>'tpasword'))|| ''','''|| (($1::json->>'phone'))|| '''
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



	select main.register_as_teacher(
	'{"fname":"mohsen",
	"lname":"ahmand",
	"tusername":"mohsenahoooo",
	"tpasword":"95463104",
	"phone":"09109717727",
	"email":"mohsenahmand@gmail.com" }');


select * from teacher t 







