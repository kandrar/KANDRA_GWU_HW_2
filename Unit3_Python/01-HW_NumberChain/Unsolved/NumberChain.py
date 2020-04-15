# Initial variable to track game play
user_play = "y"

# Set start and last number
for x in range (11):

# While we are still playing...
    while user_play == "y":
     
    
    # Ask the user how many numbers to loop through
        user_number = int(input("How many numbers?"))
       
    
    # Loop through the numbers. (Be sure to cast the string into an integer.)
       
        for count in range(user_number):
            currentnumber = x + count
    
    # Print each number in the range
            print (currentnumber)
    
    # Set the next start number as the last number of the loop           
        x = currentnumber +1

    # Once complete... ask if the user wants to continue
        user_play = input("Continue play: (y)es or (n)o?")



