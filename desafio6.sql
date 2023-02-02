SELECT MIN(tp.plan_numbers) AS 'faturamento_minimo', 
       MAX(tp.plan_numbers) AS 'faturamento_maximo',
       ROUND(AVG(tp.plan_numbers), 2) AS 'faturamento_medio',
       ROUND(SUM(tp.plan_numbers), 2) AS 'faturamento_total'

FROM SpotifyClone.table_plan AS tp INNER JOIN SpotifyClone.user AS us ON us.plan_table_id = tp.plan_table_id;  