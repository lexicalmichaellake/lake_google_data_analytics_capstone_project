# Google Data Analytics Certificate Capstone Project

My Capstone Project for the Google Data Analytics program at Coursera.org.

## The Adequacy of YouTube Auto-Generated Closed Captions as Data Sources for Formulaic Language Studies

### Task

In the face of a rapidly-changing world economies in the past year, upskilling is crucial. One avenue at which to upskill workers from around the world comes in the form of English for Specific Purposes (ESP) courses. ESP differs from other English classes in their focus solely on English that a learner will encounter in their desired profession.

One issue in designing ESP courses is a source of authentic data that reflects the reality of the profession in which a learner will enter. Fortunately, in the past 30 years, major advancements have been made in corpus linguistics (CL). Broadly speaking, corpus linguistics is an approach which allows teachers and researchers to investigate specific questions about language using large collections of text files to see how patterns repeat. One successful application of this approach is found in the book Write Like a Chemist, which bases all of its lessons on data extracted from a million words of academic chemistry articles. Data from fields besides highly formalized, written texts, however, are needed in order for a wider range of ESP courses to reach learners in need.

Accordingly, the purpose of the present case study is to investigate the extent to which Closed Captions auto-generated by  YouTube can serve as adequate data sources for formulaic research among specialists.

### Data sources used

I used two text corpora for this analysis: the Brown Corpus as a representative of general English; and the SGDQ 2019 corpus, a collection of auto-generated Closed Caption Files from the Summer Games Done Quick 2019 telethon.

#### I. Brown Corpus:

The Brown University Standard Corpus of Present-Day American English is a series of transcribed text files in a variety of genres collected by researchers at Brown University. 

#### II. SGDQ 2019:

This corpus of text files consists of auto-generated closed-caption files for the Summer Games Done Quick 2019 telethon.

SGDQ 2019 is a telethon done in partnership with Doctors without Borders, an organization which provides medical cares to areas in need.

To raise money, experts complete video games at world-record times, often with hundreds of thousands of viewers at a time. These sessions are referred to as "speedruns".  Speedrunners, as the performers call themselves, often perform strategies that rely on perfect timing to manipulate the games' memory. Meanwhile, viewers donate. The event consistently raises several millions of dollars for Doctors without Borders.

I have chosen the transcripts of the proceedings at this event as an understudied  genre of texts with which I am familiar and that exercises a notable public impact of good. The success of this analysis could determine the relevance of this research methodology for more high-stakes specialist language such as physical therapy sessions or psychological counseling.


### Data cleaning & Manipulation

To get the Brown Corpus, I downloaded the first version on [Robert Bley-Vroman's website](http://www.sls.hawaii.edu/bley-vroman/brown_corpus.html). I noticed that documents tented to change at each instance of a newline followed by a #. Thus, I used a terminal script to split the file into separate pieces. Doing so allows balanced measurements to be obtained from individual text files.

Here is the script:
`csplit -z * /\n\n#/ '{*}'`

To get the SGDQ2019 corpus, I obtained a list of URLs for every recording. I then found [some Python code that uses the pytube library](https://www.geeksforgeeks.org/python-downloading-captions-from-youtube/) on GeeksforGeeks. I modified it with [the following code to download more than 1 file at a time](https://github.com/lexicalmichaellake/lake_google_data_analytics_capstone_project/blob/main/caption_downloader_converter.py).

I then opened up all the text files in a software tool which I am developing with my dissertation chair (more details on this program in a few months). The program can output a list of "lexical bundles", or  expressions that recur in a collection of text files.  

### Analysis Summary 

I compared the summed frequencies of lexical bundles that occur in both the Brown Corpus and the SGDQ2019 Corpus. I ran a histogram inspection and found that the data were not normally distributed. Thus, the appropriate comparison test is a Wilcoxon Sign Ranked test since the data were not normally distributed.
The results are as follows: 
|  Corpus | Variable | N |  Mean | SD |   
| ------- | -------- | - | ----- | -- |
| Brown |  Formulaicity | 825 | 1.0% | 0.8%
| SGDQ |  Formulaicity | 103 | 5.5% | 0.5

The following boxplot illustrates these scores

![Boxplot of mean formualicity scores in both corpora](https://github.com/lexicalmichaellake/lake_google_data_analytics_capstone_project/blob/main/all_formualicity_boxplot.png "Boxplot of mean formualicity scores in both corpora").

Thus, it is shown that Auto-generated Closed-Captions contain significantly more lexical bundles than did texts in the Brown Corpus.

Now, returning to the main question, how to the practitioners in the videos talk?

The following qualitative examples will show some of the kinds of situations that appear in broadcasts of SGDQ.

This segment, for example, takes place during a speedrun of a game in the Legend of Zelda series by Nintendo. The commentator describes a situation in which a speedrunner manipulates a glitch in the game's code to skip an area in the game that may take a normal player an hour or two to complete. 

> "you don't know this at the time that you normally do this portal but it actually opens a portal to a much later area of the game which **you're not supposed to** have access to at this point this whole what later on in the run let us skip basically directly to the second-to-last engine" (8_1.txt)

It is worth noting that YouTube transcribed the phrase "second-to-last dungeon" as "second-to-last engine", showing that the captions are imperfect in a range of specifics. However, they appear adequate so far when looking at formulaic sequences. 

We notice another description of strategies performed by a speedrunner to complete the game more quickly in Super Mario Bros. 2, also by Nintendo. Lexical bundles appear in bold. 

> "so normally what you do there is climb to **the top of** that screen and bring a key **all the way** down so that **saves a lot of time**" (4_2.txt)

Another example shows the importance of women as participants in the telethon. The commentator describes strategies used by one woman speedrunner completing Sega's Monster Boy and the Cursed Kingdom.

> "so we got a few small puzzles going through here this is pretty straightforward for just a moment mostly **she's gonna** try and hit the torches out of order of what the game is intending" (4_2.txt)

In all, it appears that the sequences detected within this method can be quite comprehensible. They may serve as adequate sources of input for phrases to teach experts in ESP courses.


### Future deliverables 

This method should be applied to other genres of YouTube videos in English and other languages. 

### Your top high-level insights based on your analysis

YouTube auto-generated closed captions are currently inadequate for precise transcriptions, but can serve as a practical, accurate source of data for learning formulaic phrases used amongst specific practitioners.

This knowledge has applications for learning to speak like several popular types of YouTube hosts, including those who have:
* cooking shows
* makeup tutorials
* talk radio commentary

If you have any suggestions or questions, please feel free to e-mail me.
