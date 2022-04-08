
#Web scrap the table of regions and university in italy from WIkipedia following this two websites instructions: 
#https://www.delftstack.com/howto/python/python-write-array-to-csv/#
#https://medium.com/analytics-vidhya/web-scraping-a-wikipedia-table-into-a-dataframe-c52617e1f451 #

# library for data analysis
import pandas as pd 
# library to handle requests
import requests
# library to parse HTML documents
from bs4 import BeautifulSoup 


# get the response in the form of html
wikiurl="https://en.wikipedia.org/wiki/List_of_universities_in_Italy"
table_class="wikitable sortable jquery-tablesorter"
response=requests.get(wikiurl)
print(response.status_code)

# parse data from the html into a beautifulsoup object
soup = BeautifulSoup(response.text, 'html.parser')
unitable=soup.find('table',{'class':"wikitable sortable"})

#generate a list and read it 
df=pd.read_html(str(unitable))
df
# convert list to dataframe
df=pd.DataFrame(df[0])

# drop the unwanted columns
data = df.drop(["Name", "Public/private", "Students", "Est."], axis=1)
# rename columns for ease
data = data.rename(columns={"Original name": "uni_name","Headquarters": "reg_uni"})
data.head(20)

#save the data 
data.to_csv('uni_italy.csv')
