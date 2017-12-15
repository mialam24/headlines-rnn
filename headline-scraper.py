# Adapted from https://stackoverflow.com/questions/43750044/google-news-crawler-to-return-results-with-url-title-and-briefing

import time
from random import randint
import requests
from bs4 import BeautifulSoup

subject = "bitcoin"
month_s = str(12)
day_s = str(14)
year_s = str(14)
month_e = str(2017)
day_e = str(14)
year_e = str(2017)
url = "https://www.google.com.sg/search?q=%22"+subject+"%22&source=lnt&tbs=cdr%3A1%2Ccd_min%3A"+month_s+"%2F"+day_s+"%2F"+year_s+"%2Ccd_max%3A"+month_e+"%2F"+day_e+"%2F"+year_e+"%2&tbm=nws"
time.sleep(randint(0, 2))
htmlpage = requests.get(url)
soup = BeautifulSoup(htmlpage.text,'lxml')
for result_table in soup.findAll("div", {"class": "g"}):
    a_click = result_table.find("a")
    raw_title = str(a_click.renderContents())
    proc_title = ((raw_title[2:])[:-1]).replace('<b>','').replace('</b>','')
    print(proc_title)
