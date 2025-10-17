-- nameplate_idを埋めるSQL
-- ticket_type_idが'normal'以外のチケット購入に対して、
-- A-01, B-01, C-01, D-01, A-02, B-02, C-02, D-02... という順序でnameplate_idを割り当てる
WITH
  ranked_purchases AS (
    SELECT
      id,
      row_number() OVER (
        ORDER BY
          created_at,
          id
      ) AS rn
    FROM
      public.ticket_purchases
    WHERE
      ticket_type_id != 'normal'
      AND nameplate_id IS NULL
  ),
  nameplate_assignments AS (
    SELECT
      id,
      chr(65 + ((rn - 1) % 4)::integer) || '-' || lpad(((rn - 1) / 4 + 1)::text, 2, '0') AS new_nameplate_id
    FROM
      ranked_purchases
  )
UPDATE public.ticket_purchases
SET
  nameplate_id = nameplate_assignments.new_nameplate_id
FROM
  nameplate_assignments
WHERE
  ticket_purchases.id = nameplate_assignments.id;
