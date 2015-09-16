![Money Money Money](https://raw.githubusercontent.com/simonknudsen/articles/master/images/hpi/Green-Business-Money.jpg)

# The Real Reason for House Price Inflation in New Zealand
<p style='text-align: right;'>Simon Knudsen - Sept 2015</p>

Population growth, shortages in housing supply, internal migration, immigration, cheap money, and foreign investors are just a few of the claimed causes of House Price Inflation (HPI) in New Zealand in recent years. The notorious example of HPI in action is NZ's largest city - Auckland. The city has experienced double-digit HPI of late with a polarising effect:

* Homeowner delight at increased "equity" 
* Increasing struggle for renters as disposable income shrinks

This analysis will attempt to shed some light on the cause of HPI in New Zealand. 

##Background
Before digging into the numbers, some definitions are required:

__M3__: As per RBNZ [1]:
_The broadest monetary aggregate. Represents all New Zealand dollar funding of M3 institutions. Consists of notes & coin held by the public plus NZ dollar funding minus inter-M3 institutional claims and minus government deposits._

__Inflation__: More than one definition required as it is a contentious concept. 

From Wikipedia [2]: _In economics, inflation is a sustained increase in the general price level of goods and services in an economy over a period of time. When the price level rises, each unit of currency buys fewer goods and services. Consequently, inflation reflects a reduction in the purchasing power per unit of money – a loss of real value in the medium of exchange and unit of account within the economy._

From Ludwig von Mises [3]: _In theoretical investigation there is only one meaning that can rationally be attached to the expression Inflation: an increase in the quantity of money (in the broader sense of the term, so as to include fiduciary media as well), that is not offset by a corresponding increase in the need for money (again in the broader sense of the term), so that a fall in the objective exchange-value of money must occur._

__Fractional Reserve Banking System__: 

From Investopedia [5]:
_A banking system in which only a fraction of bank deposits are backed by actual cash-on-hand and are available for withdrawal. This is done to expand the economy by freeing up capital that can be loaned out to other parties. Most countries operate under this type of system._

From Boundless [6]: _Because banks are only required to keep a fraction of their deposits in reserve and may loan out the rest, banks are able to create money. A lower reserve requirement allows banks to issue more loans and increase the money supply, while a higher reserve requirement does the opposite._


## What data is available on various culprits? 
Data is readily available on the following potential causes for house price inflation:

* population
* inflation (CPI)
* M3 (money supply)

There are many other cited potential causes and perhaps scapegoats but they are not discussed in this brief analysis. 

Total residential house value across New Zealand is also a readily available statistic. 

![HPI with all factors](https://raw.githubusercontent.com/simonknudsen/articles/master/images/hpi/value_housing_versus_all.png)

All four data sources are plotted in the above chart. In reality these data series would not be so close on a calibrated y-axis. However, it is useful to plot them together so as to gain a feeling for how closely related these data series may be. First impressions suggest the data series are similar. 

## Discussion
Population could be a factor influencing HPI. Population has been growing steadily in NZ for a reasonable period. It would be reasonable to assert that increases in population could also increase demand for housing and force up HPI. However increases in demand for housing would also spur construction and lead to increased supply. 

Inflation as used here may be a bit misleading and also derivative rather than causal. One component used in the derivation of NZ's CPI is HPI. Therefore, it would follow that CPI and HPI should be related somewhat. Inflation is included here for interests sake. 

Money supply (M3) increases as more loans are created to purchase property. Austrian economists, such as Ludwig von Mises, believe money supply expansion alone is responsible for sustained general inflation. 

## Analysis
In order to determine HPI causality it would be ideal if a metric could be derived from which the potential causes could be ranked. This is no easy task in statistics and certainly not achievable in this  brief analysis. A metric that is readily available is the correlation coefficient. For the time series data identified the correlation coefficient with respect to HPI will be ranked.  

It would be amiss to omit the well known statistics mantra:
> Correlation does not imply causation 

This simply means that a strong correlation between two variables does not imply that one caused the other. There may indeed be a third confounding factor linking the two [7]. 

### Preliminary Correlation
The Pearson correlation coefficient to HPI was derived for all three variables:

Factor                 | Correlation to HPI |
---------------------- | ------------------ |
Population             | 0.977667           |
Inflation<sup>1</sup>  | 0.969346           |
Money Supply           | 0.989458           |

All three variables derive coefficients close to 1 and therefore imply a strong positive linear relationship with HPI. 

This result is somewhat misleading and the strong correlation is due to a common trend within all three variables and HPI: a near linear increase over time. Population, compound inflation, money supply and HPI all increase with time in the medium to long term. The strong correlation reflects this general trend to increase over time. 

The next task is to remove the increase trend for each data series and try to isolate the underlying similarities. 

<sup>1</sup> _Please note, compound inflation is used with a base date Q1 1988._

### De-Trending 
Removing trend from each series can provide more insight into potential relationships [4]. The method to remove trend chosen here is linear regression. Linear regression is applied to each series individually and the resultant LR ideal data series subtracted from the original data series. 

![HPI and all three factors de-trended](https://raw.githubusercontent.com/simonknudsen/articles/master/images/hpi/detrended_hpi_versus_all.png)

The above chart shows all three factors plotted against HPI (in green) once the trends have been removed. M3 & HPI are a much closer fit than population and inflation. 

Using the four de-trended data series, the correlation coefficients are calculated and shown below:


Factor            | Correlation to HPI |
----------------- | ------------------ |
Population        | 0.5871926          |
Inflation         | 0.4414522          |
Money Supply      | 0.8569447          |

It can be concluded inflation and population have a moderate linear relationship with HPI whereas money supply has a strong linear relationship with HPI. Again confounding factors may be involved. 

## Conclusion 
To be sure the correlation between M3 and HPI is in fact correct lets take another look at the data plotted together: 

![HPI and M3](https://raw.githubusercontent.com/simonknudsen/articles/master/images/hpi/m3_versus_value_housing.png)

In the chart above HPI seems to be more reactive than M3 which makes rational sense and house prices are determined by purchaser sentiment whereas M3 growth is a downstream result of a decision to borrow. 

The concept that HPI is strongly affected by money supply is not a new concept and brings to light many other related issues:

* Expansion of the money supply is in fact wealth transfer from holders of cash to debtors, holders of hard assets, holders of equities and the government (as a debtor). This wealth transfer could be viewed as theft. 
* Governments use the expansion of the money supply (and the ensuing inflation) to reduce the real value of national debt. In the West governments are refusing to deal with debt in the traditional manner but prefer to inflate away the capital component. 
* In many countries around the world inflation is partially hidden and price rises are attributed to GDP growth. 


## References
__[1]__ <http://www.rbnz.govt.nz/statistics/tables/c1/>

__[2]__ <https://en.wikipedia.org/wiki/Inflation>

__[3]__ <https://en.wikipedia.org/wiki/Austrian_School#Inflation>

__[4]__ <http://svds.com/post/avoiding-common-mistake-time-series>

__[5]__ <http://www.investopedia.com/terms/f/fractionalreservebanking.asp>

__[6]__ <https://www.boundless.com/economics/textbooks/boundless-economics-textbook/the-monetary-system-27/creating-money-116/the-fractional-reserve-system-455-12552/>

__[7]__ <https://en.wikipedia.org/wiki/Confounding>

## Data Sources

__M3__

Source: <http://www.rbnz.govt.nz/statistics/tables/c1/>

Data File: [hc1.xls](https://raw.githubusercontent.com/simonknudsen/articles/master/data/hpi/hc1.xls)


__HOUSE PRICE VALUE & INFLATION__ 

Source: <http://www.rbnz.govt.nz/statistics/key_graphs/house_prices_values/> and <http://www.rbnz.govt.nz/statistics/key_graphs/inflation/>

Data File: [graphdata.xls](https://raw.githubusercontent.com/simonknudsen/articles/master/data/hpi/graphdata.xls)

__POPULATION__

Source: <http://www.stats.govt.nz/infoshare> 

Data File: [population.csv](https://raw.githubusercontent.com/simonknudsen/articles/master/data/hpi/population.csv)

## R Script

Script: [hpi.R](https://raw.githubusercontent.com/simonknudsen/articles/master/src/hpi.R)



