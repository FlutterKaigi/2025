UPDATE public.company_drafts
SET x_account = data.x_account
FROM (
    VALUES
        ('flutter', 'FlutterDev')
) AS data(slug, x_account)
WHERE company_drafts.slug = data.slug;
