# Google Data Analytics Certificate Capstone Project

My Capstone Project for the Google Data Analytics program at Coursera.org.

## The Adequacy of YouTube Auto-Generated Closed Captions as Data Sources for Formulaic Language Studies

### Task

In the face of a rapidly-changing world economies in the past year, upskilling has become crucial. One avenue at which to train workers from around the world comes in the form of English for Specific Purposes (ESP) courses. ESP differs from other English classes in their focus primarily on English vocabulary and concepts that a learner will encounter in their desired profession.

One issue in designing ESP courses is a source of authentic data that reflects the reality of the profession in which a learner will enter. Fortunately, in the past 30 years, major advancements have been made in corpus linguistics (CL). Broadly speaking, corpus linguistics is an approach which allows teachers and researchers to investigate specific questions about language using large collections of text files to see how patterns repeat. One successful application of this approach is found in the book Write Like a Chemist, which bases all of its lessons on data extracted from a million words of academic chemistry articles. Data from fields other than highly formalized, written texts, however, are needed in order for a wider range of ESP courses to reach learners in need.

Accordingly, the purpose of the present case study is to investigate the extent to which closed captions automatically generated by YouTube can serve as adequate data sources for formulaic research among specialists. Such data could enhance the quality, authenticity, and relevance of teaching materials in ESP classrooms.

### Data sources used

I used two text corpora (or collections of text) for this analysis: the Brown Corpus as a representative of general English; and the SGDQ 2019 corpus, a collection of auto-generated Closed Caption Files from the Summer Games Done Quick 2019 telethon.

#### I. Brown Corpus:

The Brown University Standard Corpus of Present-Day American English is a series of transcribed text files in a variety of genres collected by researchers at Brown University. 

#### II. SGDQ 2019:

This corpus of text files consists of auto-generated closed-caption files for the Summer Games Done Quick (SGDQ) 2019 telethon.

SGDQ 2019 is a telethon done in partnership with Doctors without Borders, an organization which provides medical care to areas in need.

To raise money, experts complete video games at nigh world-record times, often with hundreds of thousands of synchronous onlookers. These sessions are referred to as "speedruns".  Speedrunners, as the performers call themselves, often carry out strategies that rely on perfect timing to manipulate the games' memory. Meanwhile, viewers make donations, which can often amount to millions of dollars over the course of a week, to Doctors without Borders. 

I have chosen the auto-generated transcripts of the SGDQ2019 broadcasts at this event as an understudied genre of texts with which I am familiar and that exercises a notable public impact of good. The success of this analysis could determine the relevance of this research methodology for more high-stakes specialist language such as physical therapy sessions or psychological counseling.


### Data cleaning & Manipulation

To obtain the Brown Corpus, I downloaded the first version on [Robert Bley-Vroman's website](http://www.sls.hawaii.edu/bley-vroman/brown_corpus.html). I noticed that documents tended to change at each instance of a newline followed by a #. Thus, I used a terminal script to split the file into separate pieces. Doing so allows balanced measurements to be obtained from individual text files.

Here is the script:
`csplit -z * /\n\n#/ '{*}'`

To assemble the SGDQ2019 corpus, I obtained a list of URLs for every recording. I then found [some Python code that uses the pytube library](https://www.geeksforgeeks.org/python-downloading-captions-from-youtube/) on GeeksforGeeks. I modified it with [the following code to download more than 1 file at a time](https://github.com/lexicalmichaellake/lake_google_data_analytics_capstone_project/blob/main/caption_downloader_converter.py).

Unsure of the structure of the files, I noticed that the resulting SRT-like files had both text and time tags that show the time at which an utterance appears. I used opened up all of the text files in a text editor for Linux called "Kate" and used a regular expression to eliminate the time tags.

I then opened up all the treated text files in a software tool which I am developing with Viviana Cortes, my dissertation chair. The program can output a list of "lexical bundles", or expressions that recur in a collection of text files.  I noticed that the SGDQ2019 corpus had over 1800 lexical bundles, while the Brown Corpus yielded about 200. To make a more balanced comparison, I took recommendations from Pan, Reppen & Biber (2020) who propose keeping only lexical bundles that occur in at least 10% of the texts in a collection. After applying that criterion, the number of lexical bundles as consolidated to about 1200 -- a ~33% reduction. When I applied this criterion to the Brown corpus, however, the number of lexical bundles decreased to about 40. To keep a more equal number of lexical bundles open for comparison between the two corpora, for the purposes of this report, I only applied the 10% dispersion (the extent to which a lexical item apppears in all texts in a collection of texts) criterion to the SGDQ corpus. 

### Analysis Summary 

You can see the details of how I joined and subsetted the two dataframes [in this area of the GitHub repository](https://github.com/lexicalmichaellake/lake_google_data_analytics_capstone_project/blob/main/SGDQ2019%20and%20the%20Adequacy%20of%20Youtube%20Auto-CC.R). 

I compared the summed frequencies of lexical bundles that occur in both the Brown Corpus and the SGDQ2019 Corpus. I ran a histogram inspection and found that the data were not normally distributed. Thus, the appropriate comparison test is a Wilcoxon Sign Ranked test since the data were not normally distributed.
The results are as follows: 
|  Corpus | Variable | Number of text files |  Mean | SD |   
| ------- | -------- | - | ----- | -- |
| Brown |  Formulaicity | 825 | 1.0% | 0.8% |
| SGDQ |  Formulaicity | 103 | 5.5% | 0.5% |

The following boxplot illustrates these scores

![Boxplot of mean formualicity scores in both corpora](https://github.com/lexicalmichaellake/lake_google_data_analytics_capstone_project/blob/main/all_formualicity_boxplot.png "Boxplot of mean formualicity scores in both corpora").

Thus, even controlling for lexical bundles that occurred in fewer than 10% of the texts in the SGDQ corpus, it is shown that auto-generated closed-captions contain significantly more lexical bundles than did texts in the Brown Corpus.

### Qualitative Examples
Now, returning to the main question, to what extent do closed captions automatically generated by YouTubeserve as adequate data sources for formulaic research? 

The following qualitative examples will show some of the kinds of situations that appear in broadcasts of SGDQ.

Example 1, for instance, takes place during a speedrun of a game in the Legend of Zelda series by Nintendo. The commentator describes a situation in which a speedrunner manipulates a glitch in the game's code to skip an area in the game that may take a normal player an hour or two to complete. Lexical bundles appear in bold. 

> (1) "you don't know this at the time that you normally do this portal but it actually opens a portal to a much later area of the game which **you're not supposed to** have access to at this point this whole what later on in the run let us skip basically directly to the second-to-last engine" (8_1.txt)

It is worth noting that YouTube transcribed the phrase "second-to-last dungeon" as "second-to-last engine", showing that the captions are imperfect in a range of specifics. However, they appear adequate so far when looking at formulaic sequences. 

We notice another description of strategies performed by a speedrunner to complete the game more quickly in Super Mario Bros. 2, also by Nintendo. 

> (2) "so normally what you do there is climb to **the top of** that screen and bring a key **all the way** down so that **saves a lot of time**" (4_2.txt)

Another example shows the importance of women as participants in the telethon. The commentator describes strategies used by one woman speedrunner completing Sega's Monster Boy and the Cursed Kingdom.

> (3) "so we got a few small puzzles going through here this is pretty straightforward for just a moment mostly **she's gonna** try and hit the torches out of order of what the game is intending" (4_2.txt)

In all, it appears that, despite imperfections at the individual word level, the sequences detected within this method can prove quite comprehensible. They may serve as adequate sources of input for phrases to teach future experts in ESP courses.


### Future deliverables 

This method should be applied to other genres of YouTube videos in English and other languages. 

### Further insights

YouTube auto-generated closed captions are currently inadequate for precise transcriptions, but can serve as a practical, accurate source of data for learning formulaic phrases used amongst practitioners in specific fields.

This knowledge has applications for learning to speak like several popular types of YouTube hosts, including those who have:
* cooking shows
* makeup tutorials
* news & commentary

If you have any suggestions or questions, please feel free to send me a message at admin_at_wmichaellake.net (<- replace the \_at\_ with an "@").
