El presente Jupyter NoteBook, se usara para realizar la descarga de información correspondiente aL IDH colombiana por departamento. Esta información sera tomada desde la pagina Web https://globaldatalab.org.


```python
import requests
from bs4 import BeautifulSoup
from selenium import webdriver
import re
import time
import random
import pandas as pd
import numpy as np
```


```python
#Se crea la variable n como un numero aleatorio
s = random.randint(0,10)
```


```python
'El presente bot se usa para realizar el descargue del archivo relacionado al IDH'
'Colombiana por departamento entre los años 2016 al 2018'

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


#Proceso para descargar archivo IDH
Boton_1= browser.find_element_by_xpath('/html/body/nav/div[2]/ul[1]/li[2]/a')
Boton_1.click()
time.sleep(s)

Boton_pais = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[5]/div/button/b')
Boton_pais.click()
time.sleep(s)

Boton_seleccion = browser.find_element_by_xpath('//*[@id="select-all-countries"]')
Boton_seleccion.click()
time.sleep(s)

Boton_busqueda = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[5]/div/div/div[2]/ul[2]/li[6]/div/label/input')
Boton_busqueda.click()
time.sleep(s)

Boton_Download = browser.find_element_by_xpath('//*[@id="download-this"]')
Boton_Download.click()
time.sleep(s)
Boton_csv= browser.find_element_by_xpath('//*[@id="download-this-csv"]')
Boton_csv.click()


```

    <ipython-input-3-1a5375db687c>:1: DeprecationWarning: executable_path has been deprecated, please pass in a Service object
      browser = webdriver.Chrome(executable_path=r"/Users/hernangracia/Desktop/Python/phantomjs-2.1.1-macosx/bin/chromedriver")
    <ipython-input-3-1a5375db687c>:7: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Login = browser.find_element_by_xpath('/html/body/nav/div[2]/ul[2]/li[1]/a').click()
    <ipython-input-3-1a5375db687c>:9: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_email = browser.find_element_by_xpath('//*[@id="field_emailaddress"]').send_keys('garcia-hernan-46@hotmail.com')
    <ipython-input-3-1a5375db687c>:11: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Contraseña = browser.find_element_by_xpath('//*[@id="field_password"]').send_keys('Saracamila01')
    <ipython-input-3-1a5375db687c>:13: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Sumit = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div[3]/div/button')
    <ipython-input-3-1a5375db687c>:19: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_1= browser.find_element_by_xpath('/html/body/nav/div[2]/ul[1]/li[2]/a')
    <ipython-input-3-1a5375db687c>:23: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_pais = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[5]/div/button/b')
    <ipython-input-3-1a5375db687c>:27: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_seleccion = browser.find_element_by_xpath('//*[@id="select-all-countries"]')
    <ipython-input-3-1a5375db687c>:31: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_busqueda = browser.find_element_by_xpath('/html/body/div[3]/div/article/form/div/div[1]/div[5]/div/div/div[2]/ul[2]/li[6]/div/label/input')
    <ipython-input-3-1a5375db687c>:35: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_Download = browser.find_element_by_xpath('//*[@id="download-this"]')
    <ipython-input-3-1a5375db687c>:38: DeprecationWarning: find_element_by_* commands are deprecated. Please use find_element() instead
      Boton_csv= browser.find_element_by_xpath('//*[@id="download-this-csv"]')



```python
BaseIDH = pd.read_csv('/Users/hernangracia/Downloads/GDL-Sub-national-HDI-data.csv')
BaseIDH
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
      <th>Country</th>
      <th>ISO_Code</th>
      <th>Level</th>
      <th>GDLCODE</th>
      <th>Region</th>
      <th>1990</th>
      <th>1991</th>
      <th>1992</th>
      <th>1993</th>
      <th>1994</th>
      <th>...</th>
      <th>2010</th>
      <th>2011</th>
      <th>2012</th>
      <th>2013</th>
      <th>2014</th>
      <th>2015</th>
      <th>2016</th>
      <th>2017</th>
      <th>2018</th>
      <th>2019</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>National</td>
      <td>COLt</td>
      <td>Total</td>
      <td>0.605</td>
      <td>0.607</td>
      <td>0.617</td>
      <td>0.624</td>
      <td>0.632</td>
      <td>...</td>
      <td>0.728</td>
      <td>0.733</td>
      <td>0.738</td>
      <td>0.742</td>
      <td>0.753</td>
      <td>0.756</td>
      <td>0.761</td>
      <td>0.762</td>
      <td>0.763</td>
      <td>0.767</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr129</td>
      <td>Amazonas</td>
      <td>0.661</td>
      <td>0.664</td>
      <td>0.675</td>
      <td>0.682</td>
      <td>0.691</td>
      <td>...</td>
      <td>0.656</td>
      <td>0.666</td>
      <td>0.676</td>
      <td>0.684</td>
      <td>0.698</td>
      <td>0.706</td>
      <td>0.710</td>
      <td>0.712</td>
      <td>0.713</td>
      <td>0.717</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr101</td>
      <td>Antioquia (incl Medellin)</td>
      <td>0.603</td>
      <td>0.605</td>
      <td>0.615</td>
      <td>0.622</td>
      <td>0.630</td>
      <td>...</td>
      <td>0.736</td>
      <td>0.741</td>
      <td>0.745</td>
      <td>0.748</td>
      <td>0.758</td>
      <td>0.760</td>
      <td>0.765</td>
      <td>0.767</td>
      <td>0.768</td>
      <td>0.772</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr125</td>
      <td>Arauca</td>
      <td>0.642</td>
      <td>0.644</td>
      <td>0.655</td>
      <td>0.662</td>
      <td>0.671</td>
      <td>...</td>
      <td>0.726</td>
      <td>0.727</td>
      <td>0.727</td>
      <td>0.726</td>
      <td>0.731</td>
      <td>0.729</td>
      <td>0.734</td>
      <td>0.735</td>
      <td>0.736</td>
      <td>0.740</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr102</td>
      <td>Atlantico (incl Barranquilla)</td>
      <td>0.631</td>
      <td>0.633</td>
      <td>0.644</td>
      <td>0.651</td>
      <td>0.659</td>
      <td>...</td>
      <td>0.738</td>
      <td>0.745</td>
      <td>0.751</td>
      <td>0.757</td>
      <td>0.769</td>
      <td>0.774</td>
      <td>0.779</td>
      <td>0.781</td>
      <td>0.782</td>
      <td>0.786</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr103</td>
      <td>Bogota D.C.</td>
      <td>0.675</td>
      <td>0.678</td>
      <td>0.689</td>
      <td>0.696</td>
      <td>0.705</td>
      <td>...</td>
      <td>0.782</td>
      <td>0.786</td>
      <td>0.789</td>
      <td>0.791</td>
      <td>0.800</td>
      <td>0.801</td>
      <td>0.806</td>
      <td>0.807</td>
      <td>0.809</td>
      <td>0.813</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr104</td>
      <td>Bolivar (Sur and Norte)</td>
      <td>0.603</td>
      <td>0.606</td>
      <td>0.616</td>
      <td>0.623</td>
      <td>0.631</td>
      <td>...</td>
      <td>0.709</td>
      <td>0.716</td>
      <td>0.723</td>
      <td>0.728</td>
      <td>0.740</td>
      <td>0.744</td>
      <td>0.749</td>
      <td>0.751</td>
      <td>0.752</td>
      <td>0.756</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr105</td>
      <td>Boyaca</td>
      <td>0.562</td>
      <td>0.564</td>
      <td>0.574</td>
      <td>0.580</td>
      <td>0.588</td>
      <td>...</td>
      <td>0.718</td>
      <td>0.724</td>
      <td>0.730</td>
      <td>0.734</td>
      <td>0.745</td>
      <td>0.749</td>
      <td>0.754</td>
      <td>0.755</td>
      <td>0.756</td>
      <td>0.760</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr106</td>
      <td>Caldas</td>
      <td>0.609</td>
      <td>0.611</td>
      <td>0.621</td>
      <td>0.628</td>
      <td>0.636</td>
      <td>...</td>
      <td>0.738</td>
      <td>0.743</td>
      <td>0.749</td>
      <td>0.752</td>
      <td>0.764</td>
      <td>0.767</td>
      <td>0.772</td>
      <td>0.773</td>
      <td>0.774</td>
      <td>0.778</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr107</td>
      <td>Caqueta</td>
      <td>0.567</td>
      <td>0.569</td>
      <td>0.579</td>
      <td>0.586</td>
      <td>0.593</td>
      <td>...</td>
      <td>0.693</td>
      <td>0.696</td>
      <td>0.698</td>
      <td>0.699</td>
      <td>0.707</td>
      <td>0.707</td>
      <td>0.711</td>
      <td>0.713</td>
      <td>0.714</td>
      <td>0.717</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr126</td>
      <td>Casanare</td>
      <td>0.672</td>
      <td>0.674</td>
      <td>0.685</td>
      <td>0.693</td>
      <td>0.702</td>
      <td>...</td>
      <td>0.717</td>
      <td>0.721</td>
      <td>0.725</td>
      <td>0.727</td>
      <td>0.737</td>
      <td>0.738</td>
      <td>0.743</td>
      <td>0.745</td>
      <td>0.746</td>
      <td>0.750</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr108</td>
      <td>Cauca</td>
      <td>0.558</td>
      <td>0.561</td>
      <td>0.570</td>
      <td>0.576</td>
      <td>0.584</td>
      <td>...</td>
      <td>0.696</td>
      <td>0.698</td>
      <td>0.700</td>
      <td>0.701</td>
      <td>0.709</td>
      <td>0.709</td>
      <td>0.713</td>
      <td>0.715</td>
      <td>0.716</td>
      <td>0.719</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr109</td>
      <td>Cesar</td>
      <td>0.554</td>
      <td>0.556</td>
      <td>0.566</td>
      <td>0.572</td>
      <td>0.579</td>
      <td>...</td>
      <td>0.695</td>
      <td>0.699</td>
      <td>0.704</td>
      <td>0.707</td>
      <td>0.716</td>
      <td>0.719</td>
      <td>0.723</td>
      <td>0.725</td>
      <td>0.726</td>
      <td>0.729</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr112</td>
      <td>Choco</td>
      <td>0.565</td>
      <td>0.567</td>
      <td>0.577</td>
      <td>0.584</td>
      <td>0.591</td>
      <td>...</td>
      <td>0.661</td>
      <td>0.666</td>
      <td>0.671</td>
      <td>0.674</td>
      <td>0.684</td>
      <td>0.686</td>
      <td>0.690</td>
      <td>0.692</td>
      <td>0.693</td>
      <td>0.696</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr110</td>
      <td>Cordoba</td>
      <td>0.553</td>
      <td>0.555</td>
      <td>0.565</td>
      <td>0.571</td>
      <td>0.579</td>
      <td>...</td>
      <td>0.669</td>
      <td>0.676</td>
      <td>0.683</td>
      <td>0.688</td>
      <td>0.701</td>
      <td>0.706</td>
      <td>0.710</td>
      <td>0.712</td>
      <td>0.713</td>
      <td>0.716</td>
    </tr>
    <tr>
      <th>15</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr111</td>
      <td>Cundinamarca</td>
      <td>0.565</td>
      <td>0.566</td>
      <td>0.576</td>
      <td>0.583</td>
      <td>0.590</td>
      <td>...</td>
      <td>0.725</td>
      <td>0.732</td>
      <td>0.739</td>
      <td>0.744</td>
      <td>0.757</td>
      <td>0.762</td>
      <td>0.767</td>
      <td>0.769</td>
      <td>0.770</td>
      <td>0.774</td>
    </tr>
    <tr>
      <th>16</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr130</td>
      <td>Guainja</td>
      <td>0.625</td>
      <td>0.627</td>
      <td>0.637</td>
      <td>0.644</td>
      <td>0.653</td>
      <td>...</td>
      <td>0.673</td>
      <td>0.670</td>
      <td>0.667</td>
      <td>0.663</td>
      <td>0.665</td>
      <td>0.660</td>
      <td>0.664</td>
      <td>0.665</td>
      <td>0.666</td>
      <td>0.670</td>
    </tr>
    <tr>
      <th>17</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr114</td>
      <td>Guajira</td>
      <td>0.563</td>
      <td>0.565</td>
      <td>0.575</td>
      <td>0.581</td>
      <td>0.589</td>
      <td>...</td>
      <td>0.665</td>
      <td>0.669</td>
      <td>0.673</td>
      <td>0.675</td>
      <td>0.683</td>
      <td>0.685</td>
      <td>0.689</td>
      <td>0.691</td>
      <td>0.692</td>
      <td>0.695</td>
    </tr>
    <tr>
      <th>18</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr131</td>
      <td>Guaviare</td>
      <td>0.607</td>
      <td>0.609</td>
      <td>0.619</td>
      <td>0.626</td>
      <td>0.634</td>
      <td>...</td>
      <td>0.704</td>
      <td>0.712</td>
      <td>0.719</td>
      <td>0.725</td>
      <td>0.739</td>
      <td>0.744</td>
      <td>0.749</td>
      <td>0.750</td>
      <td>0.751</td>
      <td>0.755</td>
    </tr>
    <tr>
      <th>19</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr113</td>
      <td>Huila</td>
      <td>0.594</td>
      <td>0.596</td>
      <td>0.606</td>
      <td>0.613</td>
      <td>0.621</td>
      <td>...</td>
      <td>0.694</td>
      <td>0.698</td>
      <td>0.702</td>
      <td>0.704</td>
      <td>0.713</td>
      <td>0.715</td>
      <td>0.720</td>
      <td>0.721</td>
      <td>0.722</td>
      <td>0.726</td>
    </tr>
    <tr>
      <th>20</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr115</td>
      <td>Magdalena</td>
      <td>0.575</td>
      <td>0.577</td>
      <td>0.587</td>
      <td>0.594</td>
      <td>0.601</td>
      <td>...</td>
      <td>0.699</td>
      <td>0.702</td>
      <td>0.705</td>
      <td>0.706</td>
      <td>0.715</td>
      <td>0.715</td>
      <td>0.720</td>
      <td>0.721</td>
      <td>0.722</td>
      <td>0.726</td>
    </tr>
    <tr>
      <th>21</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr116</td>
      <td>Meta</td>
      <td>0.647</td>
      <td>0.650</td>
      <td>0.660</td>
      <td>0.667</td>
      <td>0.676</td>
      <td>...</td>
      <td>0.714</td>
      <td>0.724</td>
      <td>0.734</td>
      <td>0.742</td>
      <td>0.758</td>
      <td>0.766</td>
      <td>0.771</td>
      <td>0.772</td>
      <td>0.773</td>
      <td>0.778</td>
    </tr>
    <tr>
      <th>22</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr117</td>
      <td>Narino</td>
      <td>0.516</td>
      <td>0.518</td>
      <td>0.527</td>
      <td>0.533</td>
      <td>0.540</td>
      <td>...</td>
      <td>0.689</td>
      <td>0.693</td>
      <td>0.697</td>
      <td>0.700</td>
      <td>0.710</td>
      <td>0.712</td>
      <td>0.716</td>
      <td>0.718</td>
      <td>0.719</td>
      <td>0.722</td>
    </tr>
    <tr>
      <th>23</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr118</td>
      <td>Norte de Santander</td>
      <td>0.606</td>
      <td>0.608</td>
      <td>0.618</td>
      <td>0.625</td>
      <td>0.633</td>
      <td>...</td>
      <td>0.704</td>
      <td>0.711</td>
      <td>0.717</td>
      <td>0.722</td>
      <td>0.734</td>
      <td>0.738</td>
      <td>0.743</td>
      <td>0.745</td>
      <td>0.746</td>
      <td>0.750</td>
    </tr>
    <tr>
      <th>24</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr127</td>
      <td>Putumayo</td>
      <td>0.652</td>
      <td>0.654</td>
      <td>0.665</td>
      <td>0.672</td>
      <td>0.681</td>
      <td>...</td>
      <td>0.676</td>
      <td>0.682</td>
      <td>0.688</td>
      <td>0.692</td>
      <td>0.703</td>
      <td>0.707</td>
      <td>0.712</td>
      <td>0.713</td>
      <td>0.714</td>
      <td>0.717</td>
    </tr>
    <tr>
      <th>25</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr119</td>
      <td>Quindio</td>
      <td>0.642</td>
      <td>0.644</td>
      <td>0.655</td>
      <td>0.662</td>
      <td>0.671</td>
      <td>...</td>
      <td>0.731</td>
      <td>0.739</td>
      <td>0.747</td>
      <td>0.753</td>
      <td>0.767</td>
      <td>0.772</td>
      <td>0.778</td>
      <td>0.779</td>
      <td>0.780</td>
      <td>0.784</td>
    </tr>
    <tr>
      <th>26</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr120</td>
      <td>Risaralda</td>
      <td>0.632</td>
      <td>0.634</td>
      <td>0.645</td>
      <td>0.652</td>
      <td>0.660</td>
      <td>...</td>
      <td>0.726</td>
      <td>0.731</td>
      <td>0.735</td>
      <td>0.738</td>
      <td>0.748</td>
      <td>0.750</td>
      <td>0.755</td>
      <td>0.757</td>
      <td>0.758</td>
      <td>0.761</td>
    </tr>
    <tr>
      <th>27</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr128</td>
      <td>San Andres</td>
      <td>0.681</td>
      <td>0.684</td>
      <td>0.695</td>
      <td>0.702</td>
      <td>0.712</td>
      <td>...</td>
      <td>0.763</td>
      <td>0.766</td>
      <td>0.768</td>
      <td>0.769</td>
      <td>0.776</td>
      <td>0.776</td>
      <td>0.782</td>
      <td>0.783</td>
      <td>0.784</td>
      <td>0.789</td>
    </tr>
    <tr>
      <th>28</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr121</td>
      <td>Santander</td>
      <td>0.583</td>
      <td>0.585</td>
      <td>0.595</td>
      <td>0.601</td>
      <td>0.609</td>
      <td>...</td>
      <td>0.715</td>
      <td>0.725</td>
      <td>0.735</td>
      <td>0.743</td>
      <td>0.759</td>
      <td>0.766</td>
      <td>0.771</td>
      <td>0.773</td>
      <td>0.774</td>
      <td>0.778</td>
    </tr>
    <tr>
      <th>29</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr122</td>
      <td>Sucre</td>
      <td>0.532</td>
      <td>0.534</td>
      <td>0.544</td>
      <td>0.550</td>
      <td>0.557</td>
      <td>...</td>
      <td>0.682</td>
      <td>0.692</td>
      <td>0.702</td>
      <td>0.710</td>
      <td>0.725</td>
      <td>0.733</td>
      <td>0.737</td>
      <td>0.739</td>
      <td>0.740</td>
      <td>0.744</td>
    </tr>
    <tr>
      <th>30</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr123</td>
      <td>Tolima</td>
      <td>0.568</td>
      <td>0.570</td>
      <td>0.579</td>
      <td>0.586</td>
      <td>0.593</td>
      <td>...</td>
      <td>0.703</td>
      <td>0.709</td>
      <td>0.715</td>
      <td>0.720</td>
      <td>0.732</td>
      <td>0.736</td>
      <td>0.741</td>
      <td>0.742</td>
      <td>0.743</td>
      <td>0.747</td>
    </tr>
    <tr>
      <th>31</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr124</td>
      <td>Valle (incl Cali)</td>
      <td>0.629</td>
      <td>0.631</td>
      <td>0.641</td>
      <td>0.648</td>
      <td>0.657</td>
      <td>...</td>
      <td>0.741</td>
      <td>0.748</td>
      <td>0.755</td>
      <td>0.761</td>
      <td>0.774</td>
      <td>0.779</td>
      <td>0.784</td>
      <td>0.786</td>
      <td>0.787</td>
      <td>0.791</td>
    </tr>
    <tr>
      <th>32</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr132</td>
      <td>Vaupis</td>
      <td>0.639</td>
      <td>0.642</td>
      <td>0.652</td>
      <td>0.659</td>
      <td>0.668</td>
      <td>...</td>
      <td>0.680</td>
      <td>0.670</td>
      <td>0.659</td>
      <td>0.648</td>
      <td>0.642</td>
      <td>0.629</td>
      <td>0.634</td>
      <td>0.635</td>
      <td>0.636</td>
      <td>0.639</td>
    </tr>
    <tr>
      <th>33</th>
      <td>Colombia</td>
      <td>COL</td>
      <td>Subnat</td>
      <td>COLr133</td>
      <td>Vichada</td>
      <td>0.624</td>
      <td>0.626</td>
      <td>0.637</td>
      <td>0.644</td>
      <td>0.652</td>
      <td>...</td>
      <td>0.666</td>
      <td>0.681</td>
      <td>0.696</td>
      <td>0.709</td>
      <td>0.730</td>
      <td>0.743</td>
      <td>0.748</td>
      <td>0.749</td>
      <td>0.750</td>
      <td>0.754</td>
    </tr>
  </tbody>
</table>
<p>34 rows × 35 columns</p>
</div>




```python
#A nalisis de datos

BaseIDH1 = BaseIDH[(BaseIDH.Region!='Total')].copy()
BaseIDH2 = BaseIDH1.drop(['Country','ISO_Code','Level','GDLCODE','1990','1991','1992','1993','1994','1995','1996','1997','1998','1999','2000','2001','2002','2003','2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015'],axis=1)
BaseIDH2

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
      <td>0.710</td>
      <td>0.712</td>
      <td>0.713</td>
      <td>0.717</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Antioquia (incl Medellin)</td>
      <td>0.765</td>
      <td>0.767</td>
      <td>0.768</td>
      <td>0.772</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Arauca</td>
      <td>0.734</td>
      <td>0.735</td>
      <td>0.736</td>
      <td>0.740</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Atlantico (incl Barranquilla)</td>
      <td>0.779</td>
      <td>0.781</td>
      <td>0.782</td>
      <td>0.786</td>
    </tr>
    <tr>
      <th>5</th>
      <td>Bogota D.C.</td>
      <td>0.806</td>
      <td>0.807</td>
      <td>0.809</td>
      <td>0.813</td>
    </tr>
    <tr>
      <th>6</th>
      <td>Bolivar (Sur and Norte)</td>
      <td>0.749</td>
      <td>0.751</td>
      <td>0.752</td>
      <td>0.756</td>
    </tr>
    <tr>
      <th>7</th>
      <td>Boyaca</td>
      <td>0.754</td>
      <td>0.755</td>
      <td>0.756</td>
      <td>0.760</td>
    </tr>
    <tr>
      <th>8</th>
      <td>Caldas</td>
      <td>0.772</td>
      <td>0.773</td>
      <td>0.774</td>
      <td>0.778</td>
    </tr>
    <tr>
      <th>9</th>
      <td>Caqueta</td>
      <td>0.711</td>
      <td>0.713</td>
      <td>0.714</td>
      <td>0.717</td>
    </tr>
    <tr>
      <th>10</th>
      <td>Casanare</td>
      <td>0.743</td>
      <td>0.745</td>
      <td>0.746</td>
      <td>0.750</td>
    </tr>
    <tr>
      <th>11</th>
      <td>Cauca</td>
      <td>0.713</td>
      <td>0.715</td>
      <td>0.716</td>
      <td>0.719</td>
    </tr>
    <tr>
      <th>12</th>
      <td>Cesar</td>
      <td>0.723</td>
      <td>0.725</td>
      <td>0.726</td>
      <td>0.729</td>
    </tr>
    <tr>
      <th>13</th>
      <td>Choco</td>
      <td>0.690</td>
      <td>0.692</td>
      <td>0.693</td>
      <td>0.696</td>
    </tr>
    <tr>
      <th>14</th>
      <td>Cordoba</td>
      <td>0.710</td>
      <td>0.712</td>
      <td>0.713</td>
      <td>0.716</td>
    </tr>
    <tr>
      <th>15</th>
      <td>Cundinamarca</td>
      <td>0.767</td>
      <td>0.769</td>
      <td>0.770</td>
      <td>0.774</td>
    </tr>
    <tr>
      <th>16</th>
      <td>Guainja</td>
      <td>0.664</td>
      <td>0.665</td>
      <td>0.666</td>
      <td>0.670</td>
    </tr>
    <tr>
      <th>17</th>
      <td>Guajira</td>
      <td>0.689</td>
      <td>0.691</td>
      <td>0.692</td>
      <td>0.695</td>
    </tr>
    <tr>
      <th>18</th>
      <td>Guaviare</td>
      <td>0.749</td>
      <td>0.750</td>
      <td>0.751</td>
      <td>0.755</td>
    </tr>
    <tr>
      <th>19</th>
      <td>Huila</td>
      <td>0.720</td>
      <td>0.721</td>
      <td>0.722</td>
      <td>0.726</td>
    </tr>
    <tr>
      <th>20</th>
      <td>Magdalena</td>
      <td>0.720</td>
      <td>0.721</td>
      <td>0.722</td>
      <td>0.726</td>
    </tr>
    <tr>
      <th>21</th>
      <td>Meta</td>
      <td>0.771</td>
      <td>0.772</td>
      <td>0.773</td>
      <td>0.778</td>
    </tr>
    <tr>
      <th>22</th>
      <td>Narino</td>
      <td>0.716</td>
      <td>0.718</td>
      <td>0.719</td>
      <td>0.722</td>
    </tr>
    <tr>
      <th>23</th>
      <td>Norte de Santander</td>
      <td>0.743</td>
      <td>0.745</td>
      <td>0.746</td>
      <td>0.750</td>
    </tr>
    <tr>
      <th>24</th>
      <td>Putumayo</td>
      <td>0.712</td>
      <td>0.713</td>
      <td>0.714</td>
      <td>0.717</td>
    </tr>
    <tr>
      <th>25</th>
      <td>Quindio</td>
      <td>0.778</td>
      <td>0.779</td>
      <td>0.780</td>
      <td>0.784</td>
    </tr>
    <tr>
      <th>26</th>
      <td>Risaralda</td>
      <td>0.755</td>
      <td>0.757</td>
      <td>0.758</td>
      <td>0.761</td>
    </tr>
    <tr>
      <th>27</th>
      <td>San Andres</td>
      <td>0.782</td>
      <td>0.783</td>
      <td>0.784</td>
      <td>0.789</td>
    </tr>
    <tr>
      <th>28</th>
      <td>Santander</td>
      <td>0.771</td>
      <td>0.773</td>
      <td>0.774</td>
      <td>0.778</td>
    </tr>
    <tr>
      <th>29</th>
      <td>Sucre</td>
      <td>0.737</td>
      <td>0.739</td>
      <td>0.740</td>
      <td>0.744</td>
    </tr>
    <tr>
      <th>30</th>
      <td>Tolima</td>
      <td>0.741</td>
      <td>0.742</td>
      <td>0.743</td>
      <td>0.747</td>
    </tr>
    <tr>
      <th>31</th>
      <td>Valle (incl Cali)</td>
      <td>0.784</td>
      <td>0.786</td>
      <td>0.787</td>
      <td>0.791</td>
    </tr>
    <tr>
      <th>32</th>
      <td>Vaupis</td>
      <td>0.634</td>
      <td>0.635</td>
      <td>0.636</td>
      <td>0.639</td>
    </tr>
    <tr>
      <th>33</th>
      <td>Vichada</td>
      <td>0.748</td>
      <td>0.749</td>
      <td>0.750</td>
      <td>0.754</td>
    </tr>
  </tbody>
</table>
</div>




```python
BaseIDH2=BaseIDH2.rename({'Region':'departamento'}, axis='columns')
```


```python
# Se deja archivo unicamente con Los datos del 2016

BaseIDH2016 = BaseIDH2.drop(['2017','2018','2019'],axis=1).copy()
BaseIDH2016.set_index("departamento", inplace=True)
BaseIDH2016=BaseIDH2016.assign(año=2016)
BaseIDH2016.head()

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
      <td>0.710</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Antioquia (incl Medellin)</th>
      <td>0.765</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Arauca</th>
      <td>0.734</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Atlantico (incl Barranquilla)</th>
      <td>0.779</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Bogota D.C.</th>
      <td>0.806</td>
      <td>2016</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Se cambia el nombre del año por IDH
BaseIDH2016=BaseIDH2016.rename({'2016':'IDH'}, axis='columns')

```


```python
# Se deja archivo unicamente con Los datos del 2017

BaseIDH2017 = BaseIDH2.drop(['2016','2018','2019'],axis=1).copy()
BaseIDH2017=BaseIDH2017.assign(año=2017)
BaseIDH2017.set_index("departamento", inplace=True)
BaseIDH2017.head()

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
      <td>0.712</td>
      <td>2017</td>
    </tr>
    <tr>
      <th>Antioquia (incl Medellin)</th>
      <td>0.767</td>
      <td>2017</td>
    </tr>
    <tr>
      <th>Arauca</th>
      <td>0.735</td>
      <td>2017</td>
    </tr>
    <tr>
      <th>Atlantico (incl Barranquilla)</th>
      <td>0.781</td>
      <td>2017</td>
    </tr>
    <tr>
      <th>Bogota D.C.</th>
      <td>0.807</td>
      <td>2017</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Se cambia el nombre del año por IDH
BaseIDH2017=BaseIDH2017.rename({'2017':'IDH'}, axis='columns')

```


```python
# Se deja archivo unicamente con Los datos del 2018

BaseIDH2018 = BaseIDH2.drop(['2016','2017','2019'],axis=1).copy()
BaseIDH2018=BaseIDH2018.assign(año=2018)
BaseIDH2018.set_index("departamento", inplace=True)
BaseIDH2018.head()
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
      <td>0.713</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>Antioquia (incl Medellin)</th>
      <td>0.768</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>Arauca</th>
      <td>0.736</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>Atlantico (incl Barranquilla)</th>
      <td>0.782</td>
      <td>2018</td>
    </tr>
    <tr>
      <th>Bogota D.C.</th>
      <td>0.809</td>
      <td>2018</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Se cambia el nombre del año por IDH
BaseIDH2018=BaseIDH2018.rename({'2018':'IDH'}, axis='columns')

```


```python
# Se deja archivo unicamente con Los datos del 2018

BaseIDH2019 = BaseIDH2.drop(['2016','2017','2018'],axis=1).copy()
BaseIDH2019=BaseIDH2019.assign(año=2019)
BaseIDH2019.set_index("departamento", inplace=True)
BaseIDH2019.head()
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
      <td>0.717</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Antioquia (incl Medellin)</th>
      <td>0.772</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Arauca</th>
      <td>0.740</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Atlantico (incl Barranquilla)</th>
      <td>0.786</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Bogota D.C.</th>
      <td>0.813</td>
      <td>2019</td>
    </tr>
  </tbody>
</table>
</div>




```python
#Se cambia el nombre del año por IDH
BaseIDH2019=BaseIDH2019.rename({'2019':'IDH'}, axis='columns')

```


```python
#se Unen los DF'S creados anteriormente

BaseIDHTotal = pd.concat([BaseIDH2016,BaseIDH2017,BaseIDH2018,BaseIDH2019])
BaseIDHTotal
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
      <th>IDH</th>
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
      <td>0.710</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Antioquia (incl Medellin)</th>
      <td>0.765</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Arauca</th>
      <td>0.734</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Atlantico (incl Barranquilla)</th>
      <td>0.779</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>Bogota D.C.</th>
      <td>0.806</td>
      <td>2016</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>Sucre</th>
      <td>0.744</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Tolima</th>
      <td>0.747</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Valle (incl Cali)</th>
      <td>0.791</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Vaupis</th>
      <td>0.639</td>
      <td>2019</td>
    </tr>
    <tr>
      <th>Vichada</th>
      <td>0.754</td>
      <td>2019</td>
    </tr>
  </tbody>
</table>
<p>132 rows × 2 columns</p>
</div>




```python
BaseIDHTotal.to_csv('Base_IDH.csv')
```
