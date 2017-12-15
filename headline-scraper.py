# Adapted from https://stackoverflow.com/questions/43750044/google-news-crawler-to-return-results-with-url-title-and-briefing

import time
import datetime
import requests
from bs4 import BeautifulSoup

def print_headlines(subject, 
                    year_s, month_s, day_s, 
                    year_e, month_e, day_e):
    start_date = datetime.datetime(year_s, month_s, day_s)
    end_date = datetime.datetime(year_e, month_e, day_e)

    curr_date = start_date
    while curr_date <= end_date:
        print(curr_date.strftime('%Y-%m-%d'))
        url = "https://www.google.com.sg/search?q=%22"+subject+"%22&tbs=cdr%3A1%2Ccd_min%3A"+str(curr_date.month)+"%2F"+str(curr_date.day)+"%2F"+str(curr_date.year)+"%2Ccd_max%3A"+str(curr_date.month)+"%2F"+str(curr_date.day)+"%2F"+str(curr_date.year)+"%2&tbm=nws"
        htmlpage = requests.get(url)
        soup = BeautifulSoup(htmlpage.text,'lxml')
        for result_table in soup.findAll("div", {"class": "g"}):
            a_click = result_table.find("a")
            raw_title = str(a_click.renderContents())
            proc_title = ((raw_title[2:])[:-1]).replace('<b>','').replace('</b>','')
            print(proc_title)
        curr_date += datetime.timedelta(days=1)
        time.sleep(2)

print_headlines("bitcoin", 2017, 12, 12, 2017, 12, 14)
