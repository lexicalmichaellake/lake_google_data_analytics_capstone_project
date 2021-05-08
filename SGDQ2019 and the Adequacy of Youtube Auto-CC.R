# This R environment comes with many helpful analytics packages installed
# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats
# For example, here's a helpful package to load
library(formattable)
library(rstatix)
library(coin)
library(ggpubr)
library(scales)
library(ggplot2)
library(tidyverse) # metapackage of all tidyverse packages

# Input data files are available in the read-only "../input/" directory
# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory

list.files(path = "../input")

# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using "Save & Run All" 
# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session

brown_data <- read_csv("../input/lexical-bundles-in-the-brown-corpus/brown_corpus_results_final.csv")

brown_data$Formulaicity = formattable::percent(brown_data$Formulaicity) 

first_viz <- data.frame(brown_data$Formulaicity)

first_viz$corpus = "brown"

first_viz = rename(first_viz, Formulaicity = brown_data.Formulaicity)


sgdq_2019_data <- read_csv("../input/sgdq-2019-lexical-bundles-with-formulaicity-txt/sgdq_2019_lexical_bundles_auto_gen_captions_formualicity_pivot_5.csv")

sgdq_2019_data_2 <- sgdq_2019_data

sgdq_2019_data_2$Formulaicity = formattable::percent(sgdq_2019_data_2$Formulaicity) 

second_viz <- data.frame(sgdq_2019_data_2$Formulaicity)

second_viz$corpus = "sgdq"

second_viz = rename(second_viz, Formulaicity = sgdq_2019_data_2.Formulaicity)

new_viz <- rbind(first_viz, second_viz)


new_viz %>%
  group_by(corpus) %>%
  get_summary_stats(Formulaicity, type = "mean_sd")

wilcox.test(Formulaicity~corpus, data = new_viz)



ggplot(data=new_viz, aes(x= corpus, y= Formulaicity, fill=corpus)) + 
    geom_boxplot(alpha=0.7) +
    stat_summary(fun.y=mean, geom="point", shape=20, size=14, color="red", fill="red") +
    theme(legend.position = "top", 
    text = element_text(family = "Garamond", size = 24), plot.title = element_text(size = 30), 
    plot.caption = element_text(size = 144), axis.text.y = element_text(color = "black"), 
    axis.text.x = element_text(color = "black")) + 
    scale_y_continuous() + 
    scale_fill_manual(values = c("red", "seagreen3"))




sgdq_2019_data_3 <- sgdq_2019_data_2 %>% 
gather(key,value,-Files) %>% 
rbind(brown_data %>% 
gather(key,value, -Files)) %>% 
group_by(Files, key) %>% 
summarise(All_vals = sum(value)) %>% 
spread(key, All_vals)

#is.na(sgdq_2019_data_3)

#sgdq_2019_data_4 <- sgdq_2019_data_3 %>% select_if(~sum(!is.na(.)) > 0)

#Preserve columns in common
sgdq_2019_data_4 = sgdq_2019_data_3[,!sapply(sgdq_2019_data_3, function(x) mean(is.na(x)))>0.1]

                                             
sgdq_2019_data_5 = select(sgdq_2019_data_4, -Formulaicity)

sgdq_2019_data_5 = select(sgdq_2019_data_5, -Words)
k = ncol(sgdq_2019_data_5)
sgdq_2019_data_5$Form_after = rowSums(sgdq_2019_data_5[ , c(2:k)], na.rm=TRUE)
                                             
                                             
sgdq_2019_data_5$Words = sgdq_2019_data_4$Words

                                             
sgdq_2019_data_5 <- mutate(sgdq_2019_data_5, Form_index = (Form_after/Words))
                                        
                                             
                                 
#ncol(sgdq_2019_data_4)
#adding category                                             
sgdq_2019_data_5$corpus = "brown"

sgdq_2019_data_5$corpus[1:nrow(sgdq_2019_data)] = "sgdq"

                                             
                                             
sgdq_2019_data_5 %>%
  group_by(corpus) %>%
  get_summary_stats(Form_index, type = "mean_sd")

hist(sgdq_2019_data_5$Form_index,xlab = "formulaicity",col = "yellow",border = "blue")                                             

wilcox.test(Form_index~corpus, data = sgdq_2019_data_5)


ggplot(data=sgdq_2019_data_5, aes(x= corpus, y= for_the_first_time, fill=corpus)) + 
  geom_boxplot(alpha=0.7) +
  stat_summary(fun.y=mean, geom="point", shape=20, size=14, color="red", fill="red") +
  theme(legend.position = "top", 
  text = element_text(family = "Garamond", size = 24), plot.title = element_text(size = 30), 
  plot.caption = element_text(size = 144), axis.text.y = element_text(color = "black"), 
  axis.text.x = element_text(color = "black")) + 
  scale_y_continuous() + 
  scale_fill_manual(values = c("red", "seagreen3"))


ggplot(data=sgdq_2019_data_5, aes(x= corpus, y= Form_index, fill=corpus)) + 
  geom_boxplot(alpha=0.7) +
  stat_summary(fun.y=mean, geom="point", shape=20, size=14, color="red", fill="red") +
  theme(legend.position = "top", 
  text = element_text(family = "Garamond", size = 24), plot.title = element_text(size = 30), 
  plot.caption = element_text(size = 144), axis.text.y = element_text(color = "black"), 
  axis.text.x = element_text(color = "black")) + 
  scale_y_continuous() + 
  scale_fill_manual(values = c("red", "seagreen3"))


