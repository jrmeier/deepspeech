from bs4 import BeautifulSoup
import re
import requests
import csv

html = requests.get("https://jockopodcast.libsyn.com/page/1/size/300").text

for link in BeautifulSoup(html,features="html.parser").find_all('a', attrs={'href': re.compile("^https://www.podtrac.com/")}):
    print(link.get('href'))
    line = "{},".format(link.get('href'))