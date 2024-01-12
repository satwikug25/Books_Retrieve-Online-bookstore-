from selenium import webdriver
from selenium.webdriver.common.by import By
import time
import os
import csv
import random
import hashlib
from bs4 import BeautifulSoup
from PIL import Image
from tqdm import tqdm

IMG_DIR = 'Images/'
os.makedirs(IMG_DIR, exist_ok=True)
CSV_FILE = 'book_data_with_images.csv'
HEADINGS = ['Serial Number', 'ISBN', 'Title', 'Author', 'Price', 'Number of Pages', 'Image URL']
os.makedirs(IMG_DIR, exist_ok=True)

wd = webdriver.Chrome()

def save_to_csv(file_path, headings, data):
    with open(file_path, 'w', newline='', encoding='utf-8') as file:
        writer = csv.writer(file)
        writer.writerow(headings)
        for row in data:
            writer.writerow(row)

def get_random_isbn():
    prefix = random.choice(['978', '979'])
    main_part = random.randint(100000000, 999999999)
    return f"{prefix}{main_part}"

def get_random_pages():
    return random.randint(100, 1000)

def generate_unique_id(title, author):
    hash_input = title + author + str(time.time())
    return hashlib.sha1(hash_input.encode()).hexdigest()[:10]

def get_images_from_google(wd, delay, max_images):
    page_number = 1
    image_urls = []
    while len(image_urls) < max_images:
        page_url = f"https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8?Nrpp=20&page={page_number}"
        wd.get(page_url)
        time.sleep(delay)

        noscript_tags = wd.find_elements(By.CSS_SELECTOR, 'a.pTopXImageLink noscript')
        for noscript in noscript_tags:
            soup = BeautifulSoup(noscript.get_attribute('innerHTML'), 'html.parser')
            img_tag = soup.find('img')
            if img_tag and img_tag.has_attr('src'):
                image_url = img_tag['src']
                if image_url.startswith('//'):
                    image_url = 'https:' + image_url
                if image_url and image_url not in image_urls:
                    image_urls.append(image_url)
                    if len(image_urls) >= max_images:
                        return image_urls

        page_number += 1
    return image_urls

def get_books_from_barnes_and_noble(wd, delay, max_books):
    page_number = 1
    books_data = []
    while len(books_data) < max_books:
        page_url = f"https://www.barnesandnoble.com/b/books/_/N-1fZ29Z8q8?Nrpp=20&page={page_number}"
        wd.get(page_url)
        time.sleep(delay)

        books = wd.find_elements(By.CSS_SELECTOR, '.product-info-view')
        for book in books:
            try:
                title = book.find_element(By.CSS_SELECTOR, '.product-info-title a').text
                author = book.find_element(By.CSS_SELECTOR, '.product-shelf-author').text.replace('by ', '')
                price = book.find_element(By.CSS_SELECTOR, '.buy-new .current').text
                pages = get_random_pages()

                sr_no = generate_unique_id(title, author)
                isbn = get_random_isbn()

                books_data.append([sr_no, isbn, title, author, price, pages])

                if len(books_data) >= max_books:
                    return books_data
            except Exception as e:
                print(f"Error processing a book entry: {e}")

        page_number += 1
    return books_data

image_urls = get_images_from_google(wd, 2, 60)
book_data = get_books_from_barnes_and_noble(wd, 2, 60)

combined_data = [book + [image_urls[i]] for i, book in enumerate(book_data)]
save_to_csv(CSV_FILE, HEADINGS, combined_data)

# def download_image(download_path, url, file_name, pbar):
#     try:
#         response = requests.get(url, stream=True)
#         if response.status_code == 200:
#             file_path = os.path.join(download_path, file_name)
#             with open(file_path, 'wb') as f:
#                 for chunk in response.iter_content(1024):
#                     f.write(chunk)
#             pbar.update(1)  # Update progress bar upon successful download
#     except Exception as e:
#         print(f'Failed to download {url} - {e}')

# # Start downloading images
# pbar = tqdm(total=len(image_urls), desc='Downloading')
# threads = []
# for i, url in enumerate(image_urls):
#     file_name = f"image_{i + 1}.jpg"
#     thread = threading.Thread(target=download_image, args=(IMG_DIR, url, file_name, pbar))
#     threads.append(thread)
#     thread.start()

#     # Join threads in batches of 50
#     if len(threads) >= 50 or i == len(image_urls) - 1:
#         for th in threads:
#             th.join()
#         threads = []

# # Close progress bar
# pbar.close()
wd.quit()


