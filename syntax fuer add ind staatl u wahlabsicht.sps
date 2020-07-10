* Encoding: UTF-8.
*** Schaffung add. Index in allbusdaten18.sav
* F. Wisniewski
* 9. Juli 2020

*GET DF

GET FILE "/Users/flo/Documents/Uni/SS 2020/Wahlforschung Arbeit/allbus 18.sav/allbusdaten18.sav".

* COMPUTE

COMPUTE staatl = (pt02 + pt03 + pt08 + pt12).
VARIABLE LABELS staatl "Add. Index: Vertrauen in staatliche Institutionen".
VALUE LABELS staatl
4 "GAR KEIN VERTRAUEN"
28 "GROSSES VERTRAUEN".
EXECUTE.

FREQUENCIES VARIABLES staatl
/HISTOGRAM.

* RECODE für wahlabsicht

IF (pv01 EQ 1) wahlabsicht EQ 1.
IF (pv01 NE 1) wahlabsicht EQ 0.

FREQUENCIES VARIABLES wahlabsicht.

* neues COMPUTE für Heimatverbunden

COMPUTE heimat = (pn12 + pn16).
VARIABLE LABELS heimat "Add. Index: Heimatverbundenheit Befragte(r)".
VALUE LABELS heimat
2 "STARK VERBUNDEN"
8 "GAR NICHT VERBUNDEN".
EXECUTE.

FREQUENCIES VARIABLES heimat
/HISTOGRAM.

*****

COMPUTE fluechtl = (mp16 + mp17 + mp18 + mp19).
VARIABLE LABELS fluechtl "Add. Index: Einstellung Befr. zu Flüchtlingen".
VALUE LABELS fluechtl
4 "RISIKO ÜBERWIEGT"
20 "CHANCE ÜBERWIEGT".
EXECUTE.

FREQUENCIES VARIABLES fluechtl
/HISTOGRAM.






