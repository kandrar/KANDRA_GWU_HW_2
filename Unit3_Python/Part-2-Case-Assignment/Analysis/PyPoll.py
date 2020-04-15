#Assignment(PyPoll-Part2)

# Import Modules/Dependencies
import os
import csv

# Variables
total_votes = 0
khan_votes = 0
correy_votes = 0
li_votes = 0
otooley_votes = 0

# Set Path For File
electiondata_csv = os.path.join('..','Resources','election_data.csv')

# Open & Read CSV File
with open(electiondata_csv,'r') as elecdata:

    # CSV Reader Specifies Delimiter & Variable That Holds Contents
    csvreader = csv.reader(elecdata, delimiter=',')
    
    # Read The Header Row
    csv_header = next(csvreader)

    # Read Each Row Of Data After The Header
    for row in csvreader:
        
        # Total Number Of Votes
        total_votes += 1
        
        # Total Number Of Votes Each Candidate Won
        if (row[2] == "Khan"):
            khan_votes += 1
        elif (row[2] == "Correy"):
            correy_votes += 1
        elif (row[2] == "Li"):
            li_votes += 1
        else:
            otooley_votes += 1
            
    # Percentage Of Votes Each Candidate Won
    kahn_percent = khan_votes / total_votes
    correy_percent = correy_votes / total_votes
    li_percent = li_votes / total_votes
    otooley_percent = otooley_votes / total_votes
    
    # Winner Of The Election Based On Popular Vote
    winner = max(khan_votes, correy_votes, li_votes, otooley_votes)

    if winner == khan_votes:
        winner_name = "Khan"
    elif winner == correy_votes:
        winner_name = "Correy"
    elif winner == li_votes:
        winner_name = "Li"
    else:
        winner_name = "O'Tooley" 

# Print Analysis
print(f"Election Results")
print(f"---------------------------")
print(f"Total Votes: {total_votes}")
print(f"---------------------------")
print(f"Kahn: {kahn_percent:.3%}({khan_votes})")
print(f"Correy: {correy_percent:.3%}({correy_votes})")
print(f"Li: {li_percent:.3%}({li_votes})")
print(f"O'Tooley: {otooley_percent:.3%}({otooley_votes})")
print(f"---------------------------")
print(f"Winner: {winner_name}")
print(f"---------------------------")

# Specify File To Write To
output_file = os.path.join('Analysis')

# Open File Using "Write" Mode. Specify The Variable To Hold The Contents
with open(output_file, 'w',) as pypoll:

# Write New Data
    pypoll.write(f"Election Results")
    pypoll.write(f"---------------------------\n")
    pypoll.write(f"Total Votes: {total_votes}")
    pypoll.write(f"---------------------------\n")
    pypoll.write(f"Kahn: {kahn_percent:.3%}({khan_votes})")
    pypoll.write(f"Correy: {correy_percent:.3%}({correy_votes})")
    pypoll.write(f"Li: {li_percent:.3%}({li_votes})")
    pypoll.write(f"O'Tooley: {otooley_percent:.3%}({otooley_votes})")
    pypoll.write(f"---------------------------\n")
    pypoll.write(f"Winner: {winner_name}")
    pypoll.write(f"---------------------------\n")