# NGram Analysis of text documents

## Working dir
`<your workspace>/HI-labs/hadoop-dev/hive/text`

**Note : Replace MY_NAME appropriately throughout this lab**

## Text data to analyze:  
Choose one of the following text for analysis  
- `moby-dick.txt` : The classic novel
- `sotu-2014-obama.txt` : State of the Union address 2014
- `FOMC20080916meeting.txt` : Feds emergency meeting after 2008 financial crisis  (un-classified after 5 years)

To replace  text content, just delete the existing file and copy a new file in.  Here is an example of replacing the text with `state of the union address`

```
      $  hdfs  dfs  -rm   MY_NAME/hive/text/*
      $  hdfs  dfs  -put  sotu-2014-obama.txt   MY_NAME/hive/text/
```

## STEP 1)
Find the most occuring bigrams (two) in text
```
    $  hive 
    hive> SELECT ngrams(sentences(lower(line)), 2, 20 ) FROM MY_NAME_text
```

Note : The output will be a json structure, it is hard to read.  
Use http://jsoneditoronline.org  to pretty-up the output.  
Copy & paste the hive output into json editor and click 'format'.  

**=> Q : What are the top bi-grams?**  
**=> Q : Do they offer any insights?**  
Hint : these are called [stop words](https://en.wikipedia.org/wiki/Stop_words) (or filler words)


## STEP 2) Text context

- For Moby-dick:   
What words follow the word `whale`
```
        $  hive 
        hive> SELECT context_ngrams(sentences(lower(line)), array("whale", null), 30) FROM MY_NAME_text
```

- For State of the union text  
Find the word the follows the word `american`


## STEP 3)
- For moby-dick:
What are the top adjectives used to describe 'whale'
```
    $  hive 
    hive> SELECT context_ngrams(sentences(lower(line)), array(null, "whale"), 30) FROM MY_NAME_text
```

- For State of The Union:  
What are the adjectives used for 'american'


## STEP 4) 'Visualizing' text
'Word Clouds' are very interesting way of visualizing text.  
Try these word cloud generators  
- https://www.jasondavies.com/wordcloud/

- Copy paste text from [sotu-2014-obama.txt](sotu-2014-obama.txt)  
- Or if the wordcloud generator accepts URL, use the following url
https://raw.githubusercontent.com/elephantscale/HI-labs/master/hadoop-dev/hive/text/sotu-2014-obama.txt
