import time
from selenium import webdriver
import pandas as pd
from selenium.common.exceptions import NoSuchElementException
import os
#from webdriver_manager.chrome import ChromeDriverManager
# Activar el browser (es necesario bajar el driver del browser e indicar su ubicación)
browser = webdriver.Chrome(r'C:\Users\PC\Downloads\chromedriver_win32 (3)\chromedriver.exe')
names=['clarincom'] #+ ['LANACION']
ts2=20
ts1=2

day1=['01'] #+ ['01'] 
day2=['02'] #+ ['28'] 

months=  ['12']  #+ ['02'] 
# Three loops
for year in range(2019,2020):
	for month in months:
		for name in names:
			year=str(year)
			timest=[] 
			tweetid=[]
			text=[]
			# Build url combining information in date and user           
			base_url='https://twitter.com/search?f=tweets&vertical=default=&q=from%3A'
			since='since%3A'
			year2=year
			month2=month
			for j in range(0,1):
				if int(day1[j])==28:
					print(int(year))
					if int(month)==12:
						month2='01'
						year2=str(int(year)+1)
					elif int(month)<12:
						month2=str(int(month)+1)
						if len(month2)==1:
							month2='0'+month2
				sinced=year + '-' + month + '-' + day1[j] + '%20'
				until= 'until%3A'
				untild= year2 + '-' + month2 + '-' + day2[j]
				end='&src=typd&lang=en'
				user= name + '%20'
				rtw='filter%3Anativeretweets%20'
				url=base_url  + user + since + sinced + until + untild + end
                # Navegar al sitio y deslizar hacia abajo hasta que no aumenten el número de tweets
				browser.get(url)
				time.sleep(1)
				l1=0
				while True:   # scroll down while more tweets are found
					browser.execute_script("window.scrollTo(0, document.body.scrollHeight);")
					time.sleep(ts1)
					tweets=browser.find_elements_by_class_name('tweet-text') # Seleccionar elementos de correspondan al texto de un tweet		
					var=len(tweets)-l1 # Verificar si aumentó el número de twwets
					l1=len(tweets)
					print('scrolleando')
					if var==0:
						break	
                # Extraer los elementos que se desean alamcenar: timestamp, texto y identificador de tweet
				tweets=browser.find_elements_by_class_name('js-original-tweet')	# Formar olección de tweets	
				for tweet in tweets: 
					try:     # Get tweet text if available if not leave empty 
						t=tweet.find_element_by_class_name("tweet-text").text
						text=text+[t]
					except NoSuchElementException as ex:
						text=text + [""]
					tweetid = tweetid + [tweet.get_attribute("data-tweet-id")]
					try:
						t2=tweet.find_element_by_class_name('js-short-timestamp')		
						timest = timest + [t2.get_attribute("data-time")]
					except NoSuchElementException as ex:
						timest = timest + [""]
					print('extrayendo')
			#print(text)
			#print(timest)
			#print(tweetid)
			if len(text)>1:
                # Generar tabla y guardar como archivo con valores separados por comas
				list2 = pd.DataFrame({'text' : text,
				'tweetid' : tweetid,
				 'timest':timest,
				  })
				name2=name+year+month+'.csv'
                #list2.to_csv(name2, sep=',')
				list2.to_csv(name2, sep=',')
				time.sleep(ts2)
