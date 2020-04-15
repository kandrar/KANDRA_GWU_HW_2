#Assignment(PyBank-Part1)

# Import Modules/Dependencies
import os
import csv

# Variables
total_months = 0
net_amount = 0
monthly_change = []
month_count = []
greatest_increase = 0
greatest_increase_month = 0
greatest_decrease = 0
greatest_decrease_month = 0


# Set Path For File
budgetdata_csv = os.path.join('..','Resources','budget_data.csv')

# Open & Read CSV File
with open(budgetdata_csv,'r') as pybank:
    
    csvreader = csv.reader(pybank, delimiter=',')
    
    csv_header = next(csvreader)
    row= next(csvreader)
   
    
# Calculate Total Number Of Months, Net Amount Of "Profit/Losses" & Set Variables For Rows
    monthrow = int(row[1])
    total_months += 1
    net_amount += int(row[1])
    greatest_increase = int(row[1])
    greatest_increase_month = row[0]
    
    for row in csvreader:
        
        # Total Number Of Months Included In Dataset
        total_months += 1
        # Net Amount Of "Profit/Losses" 
        net_amount += int(row[1])

        # Calculate Change From Current Month To Previous Month
        revenue_change = int(row[1]) - monthrow
        monthly_change.append(revenue_change)
        previous_row = int(row[1])
        month_count.append(row[0])
        
        # Calculate The Greatest Increase
        if int(row[1]) > greatest_increase:
            greatest_increase = int(row[1])
            greatest_increase_month = row[0]
            
        # Calculate The Greatest Decrease
        if int(row[1]) < greatest_decrease:
            greatest_decrease = int(row[1])
            greatest_decrease_month = row[0]  
        
    # Calculate The Average & Date
    average_change = sum(monthly_change)/ len(monthly_change)
    highest = max(monthly_change)
    lowest = min(monthly_change)

# Print
print(f"Financial Analysis")
print(f"---------------------------")
print(f"Total Months: {total_months}")
print(f"Total: ${net_amount}")
print(f"Average Change: ${average_change:.2f}")
print(f"Greatest Increase in Profits:, {greatest_increase_month}, (${highest})")
print(f"Greatest Decrease in Profits:, {greatest_decrease_month}, (${lowest})")

# Specify File To Write To
output_file = os.path.join('Analysis')

# Open File Using "Write" Mode. Specify The Variable To Hold The Contents
with open(output_file,'w',) as pybank_new:

# Write New Data
    pybank_new.write(f"Financial Analysis")
    pybank_new.write(f"---------------------------\n")
    pybank_new.write(f"Total Months: {total_months}")
    pybank_new.write(f"Total: ${net_amount}")
    pybank_new.write(f"Average Change: ${average_change}")
    pybank_new.write(f"Greatest Increase in Profits:, {greatest_increase_month}, (${highest})")
    pybank_new.write(f"Greatest Decrease in Profits:, {greatest_decrease_month}, (${lowest})")