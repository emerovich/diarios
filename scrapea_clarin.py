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

os.chdir('D:/Dropbox (MPD)/Eze Merovich/s/marzo_2015')

exampleFile = open('links_clarin_viejo_2015_03.csv')
exampleReader = csv.reader(exampleFile)
exampleData = list(exampleReader)

m=0
probadosFile = open('links_probados_clarin.csv')
probadosReader = csv.reader(probadosFile)
links_probados = list(probadosReader)
for i in exampleData:
        print(m)
        hilo = str(i)
        if i not in links_probados:
                time.sleep(random.randint(5,11))
                try:
                        req = Request(hilo[2:(len(hilo)-2)], headers={'User-Agent': 'Mozilla/5.0'})
                        html = urlopen(req).read()
                        bs = BeautifulSoup(html, 'html.parser')
                        links_probados.append(i)
                        titulo = bs.find('h1')
                        subtitulo = bs.find('h2')
                        epigrafe = bs.find('div', id='galeria-trigger')
                        fecha = bs.find('div', class_="breadcrumb col-lg-6 col-md-12 col-sm-12 col-xs-12")
                        categoria = bs.find('ul',class_="listado-items simply-scroll-list")
                        try:
                            categoria = categoria.li.text
                        except:
                            categoria = "NA"
                        try:
                                cuerpo = bs.find('div', class_='body-nota').findAll('p')
                                texto = str()
                                for parrafo in cuerpo:
                                        texto = texto + str(parrafo.text)  #decode(latin_1)
                        except AttributeError:
                                texto = "NA"
                        try:
                                titulo = titulo.text
                        except AttributeError:
                                titulo = "NA"
                        try:
                                subtitulo = subtitulo.text
                        except AttributeError:
                                subtitulo = "NA"
                        try:
                                epigrafe = epigrafe.p.text
                        except AttributeError:
                                epigrafe = "NA"
                        try:
                                fecha = fecha.span.text
                        except AttributeError:
                                fecha = "NA"

                        data = {'Link': [hilo[2:(len(hilo)-2)]],
                                'Fecha': [fecha],
                                'Titulo': [titulo],
                                'Subtitulo': [subtitulo],
                                'Epigrafe': [epigrafe],
                                'Cuerpo': [texto],
                                'Categoria': [categoria]}
                        frame = pd.DataFrame(data)
                        if m==0:
                                database = frame
                                m = m+1
                        elif m>0:
                                database = database.append(frame, ignore_index = True)
                                m = m+1
                except ValueError:
                        pass
                except HTTPError:
                        pass


clarin_test = database.replace(r'^\s*$', numpy.nan, regex=True)
clarin_test = clarin_test.replace(numpy.nan, 'NA', regex=True)
clarin_test.to_csv(r'D:\Dropbox (MPD)\Eze Merovich\s\marzo_2015\database_clarin_0.csv',encoding='utf-8-sig', sep=' ', index=False)

#database = database.drop(0, axis=0)

linksprobados = pd.DataFrame(links_probados)
linksprobados.to_csv(r'D:\Dropbox (MPD)\Eze Merovich\s\marzo_2015\linksprobados_clarin.csv',encoding='utf-8-sig',sep=' ', index=False)


#        pass
