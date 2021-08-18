CREATE OR REPLACE FUNCTION main.delete_post(post text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare 
cmd text;
username varchar(50)=$1::json->>'susername';
idd int =$1::json->>'order_id';
begin
delete from main.student_order where order_id =idd;

return 'your post successfully deleted';
exception
	WHEN others THEN
		return SQLERRM;
END;
$function$
;
