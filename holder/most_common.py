from collections import Counter 


def analyze():
    with open('./output/Jocko-Podcast-1c_30.txt','r') as data_set:
        split_it = data_set.read().split() 

        counter = Counter(split_it)
        most_occur = counter.most_common(100) 
  
        for each in most_occur:
            print(each)

analyze()