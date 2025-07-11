drop index if exists "public"."idx_users_active";

drop index if exists "public"."idx_users_deleted_at";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION public.replace_user_roles(p_user_id uuid, p_roles role[])
 RETURNS void
 LANGUAGE plpgsql
AS $function$
BEGIN
  DELETE FROM public.user_roles WHERE user_id = p_user_id;

  IF array_length(p_roles, 1) IS NOT NULL THEN
    INSERT INTO public.user_roles (user_id, role)
    SELECT p_user_id, unnest(p_roles);
  END IF;
END;
$function$
;


