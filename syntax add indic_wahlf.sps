* Encoding: UTF-8.
***
F. Wisniewski
Vorbereitungen in SPSS für Wahlforschung - Add. Indizes
Datum: 23-06-2020
Daten: ALLBUS 2018
***

GET FILE "/Users/flo/Documents/Uni/SS 2020/Wahlforschung Arbeit/allbus 18.sav/allbusdaten18.sav".

* compute

COMPUTE vertrStaat = (pt02 + pt03 + pt04 + pt08 + pt12 + pt14 + pt15).
VARIABLE LABELS vertrStaat "Add. Index: Vertrauen in Staat und seine Institutionen".
VALUE LABELS vertrStaat
7 "niedriges Vertrauen"
49 "hohes Vertrauen".
EXECUTE.

FREQ vertrStaat.

COMPUTE vertrStaatKlein = (pt02 + pt03 + pt08 + pt12)/4.
VARIABLE LABELS vertrStaatKlein "Add. Index: Vertrauen in Staat und seine Institutionen".
VALUE LABELS vertrStaatKlein
1 "niedriges Vertrauen"
7 "hohes Vertrauen".
EXECUTE.

FREQ vertrStaatKlein.








