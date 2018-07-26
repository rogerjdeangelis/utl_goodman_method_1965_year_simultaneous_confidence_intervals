Goodman method (1965 year) simultaneous confidence intervals

WPS/Proc R or IML/R

github
https://tinyurl.com/ya2ukldj
https://github.com/rogerjdeangelis/utl_goodman_method_1965_year_simultaneous_confidence_intervals

SAS FORUM
https://tinyurl.com/yc4zkcpo
https://communities.sas.com/t5/SAS-Statistical-Procedures/Goodman-method-1965-year-confidence-interval-using-SAS/m-p/481554

for SAS solution
https://blogs.sas.com/content/iml/2017/02/15/confidence-intervals-multinomial-proportions.html


INPUT
=====

  SD1.HAVE total obs=4

   CATEGORY                COUNT

   Neurotic                  91
   Depressed                 49
   Schizophrenic             37
   Personality disorder      43

  Example Output ( Simultaneous 95% CI categrory)

  WANT

  Original Intervals

  Lower Limit
  [1] 0.3342025 0.1608587 0.1145513 0.1374690
  Upper Limit
  [1] 0.4978332 0.2998874 0.2401121 0.2702358

  Adjusted Intervals

  Lower Limit
  [1] 0.3342025 0.1608587 0.1145513 0.1374690
  Upper Limit
  [1] 0.4978332 0.2998874 0.2401121 0.2702358

  Volume
  [1] 0.00037924


PROCESS  (WORKING CODE)
=======================

  want<-capture.output(GM(have$COUNT,0.05));


OUTPUT
======

  WANT

  Original Intervals

  Lower Limit
  [1] 0.3342025 0.1608587 0.1145513 0.1374690
  Upper Limit
  [1] 0.4978332 0.2998874 0.2401121 0.2702358

  Adjusted Intervals

  Lower Limit
  [1] 0.3342025 0.1608587 0.1145513 0.1374690
  Upper Limit
  [1] 0.4978332 0.2998874 0.2401121 0.2702358

  Volume
  [1] 0.00037924

*                _              _       _
 _ __ ___   __ _| | _____    __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \  / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/ | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|  \__,_|\__,_|\__\__,_|

;

from
https://blogs.sas.com/content/iml/2017/02/15/confidence-intervals-multinomial-proportions.html

options validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have;
input Category $21. Count;
cards4;
Neurotic              91
Depressed             49
Schizophrenic         37
Personality disorder  43
;;;;
run;quit;

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

%utl_submit_wps64('
libname sd1 "d:/sd1";
options set=R_HOME "C:/Program Files/R/R-3.3.1";
libname wrk sas7bdat "%sysfunc(pathname(work))";
libname hlp sas7bdat "C:\progra~1\SASHome\SASFoundation\9.4\core\sashelp";
proc r;
submit;
source("C:/Program Files/R/R-3.3.1/etc/Rprofile.site", echo=T);
library(haven);
library(CoinMinD);
have<-read_sas("d:/sd1/have.sas7bdat");
y=have$COUNT;;
z=0.05;
want<-capture.output(GM(y,z));
str(want);
endsubmit;
import r=want data=wrk.wantwps;
run;quit;
');

proc print data=wantwps;
run;quit;


