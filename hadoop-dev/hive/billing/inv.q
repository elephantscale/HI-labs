-- calculates total invoice and saves the results into a table
-- TODO : fix <your name>
INSERT OVERWRITE TABLE <your name>_invoices
    SELECT customer_id, SUM(cost) as total
    FROM <your name>_billing
    GROUP BY customer_id;

