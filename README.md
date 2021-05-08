# lake_google_data_analytics_capstone_project
My Capstone Project for the Google Data Analytics program at Coursera

You will produce a report with the following deliverables:
1. A clear statement of the business task you have selected to investigate

the rise in need for english for specific purposes at technical colleges


To what extent are YouTube's auto-generated captions adequate for studying how specialists talk?







2. A description of all data sources used


Brown Corpus:

Wikipedia: "The Brown University Standard Corpus of Present-Day American English (or just Brown Corpus) is an electronic collection of text samples of American English, the first major structured corpus of varied genres."

SGDQ 2019:

Auto-generated closed-caption files for the Summer Games Done Quick 2019 telethon.

THis is a telethon done in partnership with Doctors without Borders, an organization which provides medical cares to areas in need.

TO raise money, experts complete video games at world-record times, often with hundreds of thousands of viewers at a time. They often perform strategies that rely on perfect timing to manipulate the games' memory. Meanwhile, viewers donate. The event consistently raises several millions of dollars for Doctors without Borders.

I have chosen this event as an understudied  genre of texts with whcih I am familiar and that exercises a notable public impact of good.



3. Documentation of any cleaning or manipulation of data

To get the Brown Corpus, I downloaded from [URL]. I used "text separator character" to separate the text into individual text files. 

To get the SGDQ2019 corpus, I obtained a list of URLs for every recording. I then found [program] on GeeksforGeeks. I modified it with the following code to download more than 1 file at a time.

I then opened up all the text files in a software tool which I am developing with my dissertation chair (more details on this program in a few months). The program can output a list of "lexical bundles", or  expressions that recur in a collection of text files.  




4. A summary of your analysis

I compared the frequencies of lexical bundles that occur in both the Brown Corpus and the SGDQ2019 Corpus. I ran a histogram inspection and found that the data were not normally distributed. Thus, the appropriate comparison test is a Wilcoxon Sign Ranked test since the data were not normally distributed.

5. Supporting visualizations and key findings

![Boxplot of mean formualicity scores in both corpora](https://github.com/lexicalmichaellake/lake_google_data_analytics_capstone_project/blob/main/all_formualicity_boxplot.png "Boxplot of mean formualicity scores in both corpora").



![Boxplot of mean formualicity scores in LBs shared in corpora](https://github.com/lexicalmichaellake/lake_google_data_analytics_capstone_project/blob/main/shared_formualicity_boxplot.png "Boxplot of mean formualicity scores in LBs shared in corpora").


6. Based on what you discover, a list of additional deliverables you think would be helpful to include for further exploration

Cleaning up the transcription of [speedrun] that has the most formulaic sequences and bolding those.


7. Your top high-level insights based on your analysis

YouTube auto-generated closed captions are currently inadequate for precise transcriptions, but can serve as a practical, accurate source of data for learning formulaic phrases used amongst specific practitioners.

This knowledge has applications for learning to speak like a:
* cooking show host
* makeup tutorial host
* talk radio host
* many others


Sources:
Python – Downloading captions from YouTube
https://www.geeksforgeeks.org/python-downloading-captions-from-youtube/
