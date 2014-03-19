-- Using data using HCatalog

-- # TODO : fix <your name>
billing = load '<your name>_biling' using org.apache.hcatalog.pig.HCatLoader();
describe billing;
