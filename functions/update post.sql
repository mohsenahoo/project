CREATE OR REPLACE FUNCTION main.update_post(post text)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare 
cmd text;
p_idd int =$1::json->>'order_id';
c_id int =$1::json->>'course_id';
o_date date =$1::json->>'order_date';
o_fee int =$1::json->>'fee';
begin
	
	UPDATE student_order 
SET fee =o_fee , order_date=o_date ,course_id=c_id
WHERE order_id = p_idd;

return 'your post successfully updated';
exception
	WHEN others THEN
		return SQLERRM;
END;
$function$
;
