CREATE OR REPLACE FUNCTION main.add_post(text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare 
cmd text;

begin

	 	   cmd='insert into main.student_order(course_id,order_date,fee,susername) 
 	      	values ('''|| (($1::json->>'course_id'))|| ''','''|| (($1::json->>'order_date'))|| ''',
 			'''|| (($1::json->>'fee'))|| ''','''|| (($1::json->>'susername'))|| ''')';
 		  --  return cmd;
 	      	execute cmd;
return 'your post successfully added';
exception
	WHEN others THEN
		return SQLERRM;
END;
$function$
;
