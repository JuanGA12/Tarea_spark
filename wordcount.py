from pyspark import SparkContext, SparkConf
import os

conf = SparkConf().setAppName("WordCount")
sc = SparkContext(conf=conf)

input_file = sc.textFile("/mnt/disk_spark/movies.csv")

words = input_file.flatMap(lambda line: line.split(" "))

word_counts = words.countByValue()

sorted_word_counts = sorted(word_counts.items(), key=lambda x: x[1], reverse=True)

save_path="/mnt/disk_spark"
file_name='output.txt'
complete_name=os.path.join(save_path,file_name)
f=open(complete_name,'w+')
for word, count in sorted_word_counts:
    stri = word.encode("ascii",errors="ignore")+": "+str(count)+"\n"
    f.write(stri)
f.close()
sc.stop()


