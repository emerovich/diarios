from bs4 import BeautifulSoup
import codecs
from urllib.request import Request, urlopen
from urllib.error import HTTPError
import os
import csv
#import pyautogui
import pandas as pd
import time
import random
import numpy

ano = '2015'
mes = '03'

dias_del_mes = 31
dias_del_mes = dias_del_mes + 1

os.chdir('D:/Dropbox (MPD)/Eze Merovich/s/marzo_2015')

base = 'https://www.clarin.com/ediciones-anteriores/' + ano + mes

for i in range(1,dias_del_mes):
        if i <10:
                numero = '0' + str(i)
        else:
                numero = str(i)
        link = base + numero
        req = Request(link, headers={'User-Agent': 'Mozilla/5.0'})
        html = urlopen(req).read()
        bs = BeautifulSoup(html, 'html.parser')
        for link in bs.find_all('a'):
                if 'href' in link.attrs:
                        if len(link.attrs['href'])>0:
                                if link.attrs['href'][0] == '/' and link.attrs['href'][-5:] == '.html' and link.attrs['href']!='/contactenos.html':
                                        data = {'Link': 'http://www.clarin.com' + link.attrs['href']}
                                        frame = pd.DataFrame(data, index=[0])
                                        if i == 1:
                                                database = frame
                                        else:
                                                database = database.append(frame, ignore_index = True)
                                        print(link.attrs['href'])

links_clarin_viejo = database.replace(r'^\s*$', numpy.nan, regex=True)
links_clarin_viejo = links_clarin_viejo.replace(numpy.nan, 'NA', regex=True)
directorio = 'links_clarin_viejo_' + ano + '_' + mes + '.csv'
links_clarin_viejo.to_csv(directorio,encoding='utf-8-sig', sep=' ', index=False)


#        pass
