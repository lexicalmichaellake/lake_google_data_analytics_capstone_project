import glob
import re
import shutil
import string
import os
from pytube import YouTube

global wd
global curr_directory
curr_directory = os.getcwd()
global wd
wd = os.path.dirname(os.path.abspath(__file__))
print(wd)

#modify this URL list with the video ids you wish to download.
url_list = ["Rql--9SOMC8", "zUXwqYxKkN0"]


j = 0
#many thanks to https://www.geeksforgeeks.org/python-downloading-captions-from-youtube/
for i in url_list:
	link = 'https://www.youtube.com/watch?v=' + str(i)
	src = YouTube(link)
	# Getting only English captions by specifying 'en' as parameter
	a_en_caption = src.captions.get_by_language_code('a.en')
	print(a_en_caption.xml_captions)
  	# Instead of Captions in XML format we are converting it to string format.
	en_caption_convert_to_srt = 		(a_en_caption.generate_srt_captions())
	# print(en_caption_convert_to_srt)
	f = open( curr_directory + "/" + str(i) + ".txt", 'w', encoding="utf8")		
	f.truncate()
	f.write(en_caption_convert_to_srt)
	f.close()
	j = j + 1
