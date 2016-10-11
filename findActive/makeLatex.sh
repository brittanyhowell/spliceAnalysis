#!/bin/bash
## Some helpful commands to make the final L1 splice tables into LaTeX tables.

cat UniqueMouse_stringent.txt | awk '{print   $1 " & " $2 " & " $3 " & " $4 " & "  $5 " \\\\"}' > LaTeXUniqueMouse_stringent.txt

cat UniqueHuman.txt | awk '{print   $1 " & " $2 " & " $3 " & " $4 " & "  $5 " \\\\"}' > LaTeXUniqueHuman_stringent.txt

cat UniqueHuman_either.txt | awk '{print   $1 " & " $2 " & " $3 " & " $4 " & "  $5 " \\\\"}' > LaTeXUniqueHuman_either.txt

