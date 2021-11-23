El presente Jupyter NoteBook, se usara para realizar la descarga de información correspondiente a la pobación colombiana por departamento. Esta información sera tomada desde la pagina Web https://globaldatalab.org.


```python
import requests
from bs4 import BeautifulSoup
from selenium import webdriver
import re
import time
import pandas as pd
import numpy as np
import random
```


```python
#Se crea la variable n como un numero aleatorio
s = random.randint(0,10)
```


```python
'El presente bot se usa para realizar el descargue del archivo relacionado a la población'
'Colombiana por departamento entre los años 2016 al 2018'


#uso del Webdriver de Chrome e indicación del link a usar
browser = webdriver.Chrome(executable_path=r"/Users/hernangracia/Desktop/Python/phantomjs-2.1.1-macosx/bin/chromedriver")
browser.get("https://globaldatalab.org/")
browser.maximize_window()
time.sleep(s)

#Ingresar usuario y clave para iniciar sesion
Boton_Login = browser.find_element_by_xpath('/html/body/nav/div[2]/ul[2]/li[1]/a').click()
time.sleep(s)
Boton_email = browser.find_element_by_xpath('//*[@id="field_emailaddress"]').send_keys('garcia-hernan-46@hotmail.com')
time.sleep(s)
Boton_Contraseña = browser.find_element_by_xpath('//*[@id="field_password"]').send_keys('Saracamila01')
time.sleep(s)
Boton_Sumit = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div[3]/div/button')
Boton_Sumit.click()
time.sleep(s)

#Proceso para descargar archivo de Población
Boton_1= browser.find_element_by_xpath('/html/body/nav/div[2]/ul[1]/li[2]/a')
Boton_1.click()
time.sleep(s)

Boton_Cat = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[1]/div/div/button/b')
Boton_Cat.click()
time.sleep(s)
Boton_Cat1 = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[1]/div/div/ul/li[3]/a/label/input')
Boton_Cat1.click()
time.sleep(s)

Boton_ind = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[2]/div/div/button')
Boton_ind.click()
time.sleep(s)
Boton_ind1 = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[2]/div/div/ul/li[13]/a/label/input')
Boton_ind1.click()
time.sleep(s)

Boton_Country = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[5]/div/button')
Boton_Country.click()
time.sleep(s)
Boton_Selec = browser.find_element_by_xpath('//*[@id="select-all-countries"]')
Boton_Selec.click()
time.sleep(s)
Boton_Country1 = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[5]/div/div/div[2]/ul[2]/li[6]/div/label/input')
Boton_Country1.click()
time.sleep(s)

Boton_Download = browser.find_element_by_xpath('//*[@id="download-this"]')
Boton_Download.click()
time.sleep(s)
Boton_csv= browser.find_element_by_xpath('//*[@id="download-this-csv"]')
Boton_csv.click()
```

    <ipython-input-3-bbdcbbeea69c>:6: DeprecationWarning: executable_path has been deprecated, please pass in a Service object
      browser = webdriver.Chrome(executable_path=r"/Users/hernangracia/Desktop/Python/phantomjs-2.1.1-macosx/bin/chromedriver")
    <ipython-input-3-bbdcbbeea69c>:12: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Login = browser.find_element_by_xpath('/html/body/nav/div[2]/ul[2]/li[1]/a').click()
    <ipython-input-3-bbdcbbeea69c>:14: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_email = browser.find_element_by_xpath('//*[@id="field_emailaddress"]').send_keys('garcia-hernan-46@hotmail.com')
    <ipython-input-3-bbdcbbeea69c>:16: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Contraseña = browser.find_element_by_xpath('//*[@id="field_password"]').send_keys('Saracamila01')
    <ipython-input-3-bbdcbbeea69c>:18: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Sumit = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div[3]/div/button')
    <ipython-input-3-bbdcbbeea69c>:23: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_1= browser.find_element_by_xpath('/html/body/nav/div[2]/ul[1]/li[2]/a')
    <ipython-input-3-bbdcbbeea69c>:27: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Cat = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[1]/div/div/button/b')
    <ipython-input-3-bbdcbbeea69c>:30: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Cat1 = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[1]/div/div/ul/li[3]/a/label/input')
    <ipython-input-3-bbdcbbeea69c>:34: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_ind = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[2]/div/div/button')
    <ipython-input-3-bbdcbbeea69c>:37: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_ind1 = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[2]/div/div/ul/li[13]/a/label/input')
    <ipython-input-3-bbdcbbeea69c>:41: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Country = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[5]/div/button')
    <ipython-input-3-bbdcbbeea69c>:44: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Selec = browser.find_element_by_xpath('//*[@id="select-all-countries"]')
    <ipython-input-3-bbdcbbeea69c>:47: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Country1 = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[5]/div/div/div[2]/ul[2]/li[6]/div/label/input')
    <ipython-input-3-bbdcbbeea69c>:51: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Download = browser.find_element_by_xpath('//*[@id="download-this"]')
    <ipython-input-3-bbdcbbeea69c>:54: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_csv= browser.find_element_by_xpath('//*[@id="download-this-csv"]')



```python
# Uso del archivo

BasePoblacion = pd.read_csv('/Users/hernangracia/Downloads/GDL-Population-size-in-thousands-data.csv')
```


```python
#Analisis del Archivo

BasePoblacion1 = BasePoblacion[(BasePoblacion.Region!='Total')].copy()
BasePoblacion2 = BasePoblacion1.drop(['Country','ISO_Code','Level','GDLCODE','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015'],axis=1)
BasePoblacion2
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Region</th>
      <th>2016</th>
      <th>2017</th>
      <th>2018</th>
      <th>2019</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>1</th>
      <td>Amazonas</td>
      <td>76.1</td>
      <td>77.3</td>
      <td>78.4</td>
      <td>79.5</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Antioquia (incl Medellin)</td>
      <td>6464.0</td>
      <td>6562.0</td>
      <td>6662.0</td>
      <td>6755.0</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Arauca</td>
      <td>263.0</td>
      <td>267.0</td>
      <td>271.0</td>
      <td>274.0</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Atlantico (incl Barranquilla)</td>
      <td>2463.0</td>
      <td>2500.0</td>
      <td>2539.0</td>
      <td>2574.0</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Bogota D.C.</td>
      <td>7888.0</td>
      <td>8007.0</td>
      <td>8129.0</td>
      <td>8243.0</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Bolivar (Sur and Norte)</td>
      <td>2100.0</td>
      <td>2132.0</td>
      <td>2164.0</td>
      <td>2194.0</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Boyaca</td>
      <td>1278.0</td>
      <td>1297.0</td>
      <td>1317.0</td>
      <td>1336.0</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Caldas</td>
      <td>989.0</td>
      <td>1004.0</td>
      <td>1020.0</td>
      <td>1034.0</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Caqueta</td>
      <td>478.0</td>
      <td>486.0</td>
      <td>493.0</td>
      <td>500.0</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Casanare</td>
      <td>357.0</td>
      <td>362.0</td>
      <td>368.0</td>
      <td>373.0</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Cauca</td>
      <td>1381.0</td>
      <td>1402.0</td>
      <td>1423.0</td>
      <td>1443.0</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Cesar</td>
      <td>1030.0</td>
      <td>1046.0</td>
      <td>1062.0</td>
      <td>1077.0</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Choco</td>
      <td>501.0</td>
      <td>508.0</td>
      <td>516.0</td>
      <td>523.0</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Cordoba</td>
      <td>1712.0</td>
      <td>1737.0</td>
      <td>1764.0</td>
      <td>1789.0</td>
    </tr>
    <tr>
      <th>15</th>
      <td>Cundinamarca</td>
      <td>2683.0</td>
      <td>2724.0</td>
      <td>2765.0</td>
      <td>2804.0</td>
    </tr>
    <tr>
      <th>16</th>
      <td>Guainja</td>
      <td>41.4</td>
      <td>42.1</td>
      <td>42.7</td>
      <td>43.3</td>
    </tr>
    <tr>
      <th>17</th>
      <td>Guajira</td>
      <td>959.0</td>
      <td>974.0</td>
      <td>989.0</td>
      <td>1002.0</td>
    </tr>
    <tr>
      <th>18</th>
      <td>Guaviare</td>
      <td>65.0</td>
      <td>66.0</td>
      <td>67.0</td>
      <td>68.0</td>
    </tr>
    <tr>
      <th>19</th>
      <td>Huila</td>
      <td>1156.0</td>
      <td>1174.0</td>
      <td>1192.0</td>
      <td>1208.0</td>
    </tr>
    <tr>
      <th>20</th>
      <td>Magdalena</td>
      <td>1262.0</td>
      <td>1281.0</td>
      <td>1300.0</td>
      <td>1318.0</td>
    </tr>
    <tr>
      <th>21</th>
      <td>Meta</td>
      <td>962.0</td>
      <td>977.0</td>
      <td>992.0</td>
      <td>1006.0</td>
    </tr>
    <tr>
      <th>22</th>
      <td>Narino</td>
      <td>1746.0</td>
      <td>1773.0</td>
      <td>1800.0</td>
      <td>1825.0</td>
    </tr>
    <tr>
      <th>23</th>
      <td>Norte de Santander</td>
      <td>1357.0</td>
      <td>1378.0</td>
      <td>1399.0</td>
      <td>1419.0</td>
    </tr>
    <tr>
      <th>24</th>
      <td>Putumayo</td>
      <td>345.0</td>
      <td>351.0</td>
      <td>356.0</td>
      <td>361.0</td>
    </tr>
    <tr>
      <th>25</th>
      <td>Quindio</td>
      <td>566.0</td>
      <td>575.0</td>
      <td>583.0</td>
      <td>591.0</td>
    </tr>
    <tr>
      <th>26</th>
      <td>Risaralda</td>
      <td>953.0</td>
      <td>967.0</td>
      <td>982.0</td>
      <td>996.0</td>
    </tr>
    <tr>
      <th>27</th>
      <td>San Andres</td>
      <td>76.6</td>
      <td>77.8</td>
      <td>78.9</td>
      <td>80.0</td>
    </tr>
    <tr>
      <th>28</th>
      <td>Santander</td>
      <td>2063.0</td>
      <td>2094.0</td>
      <td>2126.0</td>
      <td>2156.0</td>
    </tr>
    <tr>
      <th>29</th>
      <td>Sucre</td>
      <td>853.0</td>
      <td>866.0</td>
      <td>879.0</td>
      <td>891.0</td>
    </tr>
    <tr>
      <th>30</th>
      <td>Tolima</td>
      <td>1410.0</td>
      <td>1431.0</td>
      <td>1453.0</td>
      <td>1473.0</td>
    </tr>
    <tr>
      <th>31</th>
      <td>Valle (incl Cali)</td>
      <td>4619.0</td>
      <td>4689.0</td>
      <td>4761.0</td>
      <td>4827.0</td>
    </tr>
    <tr>
      <th>32</th>
      <td>Vaupis</td>
      <td>43.8</td>
      <td>44.5</td>
      <td>45.2</td>
      <td>45.8</td>
    </tr>
    <tr>
      <th>33</th>
      <td>Vichada</td>
      <td>31.3</td>
      <td>31.8</td>
      <td>32.3</td>
      <td>32.7</td>
    </tr>
  </tbody>
</table>
</div>




```python
BasePoblacion2=BasePoblacion2.rename({'Region':'departamento'}, axis='columns')
```


```python
# Se deja archivo unicamente con Los datos del 2016

BasePoblacion2016 = BasePoblacion2.drop(['2017','2018','2019'],axis=1).copy()
BasePoblacion2016.set_index("departamento", inplace=True)
BasePoblacion2016=BasePoblacion2016.assign(año=2016)
BasePoblacion2016.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>2016</th>
      <th>año</th>
    </tr>
    <tr>
      <th>departamento</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Amazonas</th>
      <td>76.1</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Antioquia (incl Medellin)</th>
      <td>6464.0</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Arauca</th>
      <td>263.0</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Atlantico (incl Barranquilla)</th>
      <td>2463.0</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Bogota D.C.</th>
      <td>7888.0</td>
      <td>2016</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Se deja archivo unicamente con Los datos del 2017

BasePoblacion2017 = BasePoblacion2.drop(['2016','2018','2019'],axis=1).copy()
BasePoblacion2017.set_index("departamento", inplace=True)
BasePoblacion2017=BasePoblacion2017.assign(año=2017)
BasePoblacion2017.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>2017</th>
      <th>año</th>
    </tr>
    <tr>
      <th>departamento</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Amazonas</th>
      <td>77.3</td>
      <td>2017</td>
    </tr>
    <tr>
      <th>Antioquia (incl Medellin)</th>
      <td>6562.0</td>
      <td>2017</td>
    </tr>
    <tr>
      <th>Arauca</th>
      <td>267.0</td>
      <td>2017</td>
    </tr>
    <tr>
      <th>Atlantico (incl Barranquilla)</th>
      <td>2500.0</td>
      <td>2017</td>
    </tr>
    <tr>
      <th>Bogota D.C.</th>
      <td>8007.0</td>
      <td>2017</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Se deja archivo unicamente con Los datos del 2018

BasePoblacion2018 = BasePoblacion2.drop(['2016','2017','2019'],axis=1).copy()
BasePoblacion2018.set_index("departamento", inplace=True)
BasePoblacion2018=BasePoblacion2018.assign(año=2018)
BasePoblacion2018.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>2018</th>
      <th>año</th>
    </tr>
    <tr>
      <th>departamento</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Amazonas</th>
      <td>78.4</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>Antioquia (incl Medellin)</th>
      <td>6662.0</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>Arauca</th>
      <td>271.0</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>Atlantico (incl Barranquilla)</th>
      <td>2539.0</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>Bogota D.C.</th>
      <td>8129.0</td>
      <td>2018</td>
    </tr>
  </tbody>
</table>
</div>




```python
# Se deja archivo unicamente con Los datos del 2019

BasePoblacion2019 = BasePoblacion2.drop(['2016','2017','2018'],axis=1).copy()
BasePoblacion2019.set_index("departamento", inplace=True)
BasePoblacion2019=BasePoblacion2019.assign(año=2019)
BasePoblacion2019.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>2019</th>
      <th>año</th>
    </tr>
    <tr>
      <th>departamento</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Amazonas</th>
      <td>79.5</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Antioquia (incl Medellin)</th>
      <td>6755.0</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Arauca</th>
      <td>274.0</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Atlantico (incl Barranquilla)</th>
      <td>2574.0</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Bogota D.C.</th>
      <td>8243.0</td>
      <td>2019</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Se cambia el nombre del año por IDH
BasePoblacion2016=BasePoblacion2016.rename({'2016':'Poblacion'}, axis='columns')
BasePoblacion2017=BasePoblacion2017.rename({'2017':'Poblacion'}, axis='columns')
BasePoblacion2018=BasePoblacion2018.rename({'2018':'Poblacion'}, axis='columns')
BasePoblacion2019=BasePoblacion2019.rename({'2019':'Poblacion'}, axis='columns')

```


```python
#se Unen los DF'S creados anteriormente

BasePoblacionTotal = pd.concat([BasePoblacion2016,BasePoblacion2017,BasePoblacion2018,BasePoblacion2019])
BasePoblacionTotal
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Poblacion</th>
      <th>año</th>
    </tr>
    <tr>
      <th>departamento</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Amazonas</th>
      <td>76.1</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Antioquia (incl Medellin)</th>
      <td>6464.0</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Arauca</th>
      <td>263.0</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Atlantico (incl Barranquilla)</th>
      <td>2463.0</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Bogota D.C.</th>
      <td>7888.0</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>Sucre</th>
      <td>891.0</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Tolima</th>
      <td>1473.0</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Valle (incl Cali)</th>
      <td>4827.0</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Vaupis</th>
      <td>45.8</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Vichada</th>
      <td>32.7</td>
      <td>2019</td>
    </tr>
  </tbody>
</table>
<p>132 rows × 2 columns</p>
</div>




```python
BasePoblacionTotal.to_csv('Base_Poblacion.csv')
```
