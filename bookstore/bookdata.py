from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import os
import csv
import random

IMG_DIR = 'Images/'
CSV_FILE = 'book_data.csv'
os.makedirs(IMG_DIR, exist_ok=True)

wd = webdriver.Chrome()

def save_to_csv(file_path, data):
    with open(file_path, 'a', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        for row in data:
            writer.writerow(row)

def get_random_isbn():
    prefix = random.choice(['978', '979'])
    main_part = random.randint(100000000, 999999999)
    return f"{prefix}{main_part}"

def get_books_from_barnes_and_noble(wd, delay, max_books):
    page_number = 1
    books_data = []

    while len(books_data) < max_books:
        page_url = f"https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8?Nrpp=20&page={page_number}"
        print(f"Loading page: {page_url}")
        wd.get(page_url)
        time.sleep(delay)

        books = wd.find_elements(By.CSS_SELECTOR, '.product-info-view')
        for book in books:
            title = book.find_element(By.CSS_SELECTOR, '.product-info-title a').text
            author = book.find_element(By.CSS_SELECTOR, '.product-shelf-author').text.replace('by ', '')
            price = book.find_element(By.CSS_SELECTOR, '.buy-new .current').text

            sr_no = len(books_data) + 1
            isbn = get_random_isbn()

            books_data.append([sr_no, isbn, title, author, price])

            if len(books_data) >= max_books:
                save_to_csv(CSV_FILE, books_data)
                return

        print(f"Completed page {page_number}")
        page_number += 1

    save_to_csv(CSV_FILE, books_data)

get_books_from_barnes_and_noble(wd, 2, 40)
wd.quit()
