-- Using  Pig with HCatalog

-- # TODO-1: fix <your name>
billing = load '<your name>_biling' using org.apache.hcatalog.pig.HCatLoader();
describe billing;

-- ## TODO-2 : inspect the data
-- ## hint : use LIMIT  or SAMPLE keywords
-- ## reference : http://pig.apache.org/docs/r0.8.1/piglatin_ref2.html
-- data = __________ ;
-- dump data;