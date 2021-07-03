output example:

```
****************************************
****** robot example ain't gonna cut it:
******  -) 'objects' are simply functions with global vars
******  -) 'objects' data is initialised from scratch on every call
******  -) duplicate code per 'person' - impossible to maintain
****************************************
   adding [3] points to Andrew...
Andrew has 3 points
   adding [5] points to Andrew...
Andrew has 8 points
   adding [7] points to Darren...
Darren has 15 points


****************************************
****** pseudo objects
******  -) don't hide the fact that globals are globals but make them unique instead
******  -) values are not re-assigned every time
******  -) one function for all people
****************************************
   andrew: initialising score...
   andrew: adding [3]...
andrew has 3 points
   andrew: adding [5]...
andrew has 8 points
   daz: initialising score...
   daz: adding [7]...
daz has 7 points
   daz: adding [3]...
daz has 10 points
```
