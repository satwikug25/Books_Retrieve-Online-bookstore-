import pandas as pd
import hashlib
import random

bookdata = "book_data_with_images.csv"

# Function to generate a hash of a string
def hash_string(string):
    return hashlib.sha256(string.encode()).hexdigest()

# Reading the CSV file into a DataFrame
df = pd.read_csv(bookdata)

# Creating a dictionary of hashed author names
authors = df['Author'].unique()
hashed_authors = {author: hash_string(author) for author in authors}

# Adding 'authorID' column to the DataFrame
df['authorID'] = df['Author'].apply(lambda x: hashed_authors[x])

# Publisher names need to be hashed
publisherDict = {
    'Pearson Education': '',
    'Penguin Random House': '',
    'Hachette Book Group': '',
    'HarperCollins': '',
    'John Wiley & Sons': '',
    'Springer Nature': '',
    'Scholastic': '',
    'McGraw-Hill Education': ''
}

# Creating a dictionary of hashed publisher names
hashed_publisher_dict = {key: hash_string(key) for key in publisherDict.keys()}

# Assigning random publishers from the list and adding 'publisherName' and 'publisherID' columns to the DataFrame
df['publisherName'] = [random.choice(list(publisherDict.keys())) for _ in range(len(df))]
df['publisherID'] = df['publisherName'].apply(lambda x: hashed_publisher_dict[x])

# Saving the modified DataFrame back to a new CSV file
modified_csv_path = 'book_data_with_images_modified.csv'
df.to_csv(modified_csv_path, index=False)

"""
Author Table (Attributes: authorID, authorname)
Written By table (Attributes: bookID, authorID)
Publisher Table (Attributes: publisherid, publishername)
Books Table (Attributes: bookid, title, price, isbn, pages, publisherId, imagesurl)
"""
