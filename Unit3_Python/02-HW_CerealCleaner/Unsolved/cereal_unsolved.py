import os
import csv


cereal_csv = os.path.join("../Resources", "cereal.csv")

with open(cereal_csv,newline="") as cereal_file:

# CSV reader specifies delimiter and variable that holds contents(default delimiter is a comma)
    cerealread = csv.reader(cereal_file, delimiter=",")
    header = next(cereal_file)
 
    
    for row in cerealread:
        if float(row[7])>=5:
         
            brand_name=row [0]
            fiber=float (row [7])
            calories=int (row [3])
     
            print (f"{brand_name} has {fiber}gm of fiber and {calories} calories per serving.")

