from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
import psycopg2
import os



@api_view(["GET"])
def retrieveInfoForAllBooks(request):
    con = psycopg2.connect(
    database='bookstore',
    user=os.environ['POSTGRESUSERNAME'],
    password=os.environ['POSTGRESPASSWORD']
    )

    cur = con.cursor()
    
    cur.execute('''select b_id, title, price, isbn, pages, a_name, p_name, url from books
                join written_by on books.b_id = written_by.w_b_id
                join authors on written_by.w_a_id = authors.a_id
                join publishers on books.p_id = publishers.p_id''')

    rows = cur.fetchall()
    books = []

    for row in rows:
        bookInfo = {
            "id": row[0],
            "title": row[1],
            "price": row[2],
            "isbn": row[3],
            "pages": row[4],
            "author": row[5],
            "publisher": row[6],
            "url": row[7]
        }
        books.append(bookInfo)

    cur.close()
    con.close()
    
    return Response(books)


@api_view(["GET"])
def searchForBookByName(request):
    con = psycopg2.connect(
    database='bookstore',
    user=os.environ['POSTGRESUSERNAME'],
    password=os.environ['POSTGRESPASSWORD']
    )

    cur = con.cursor()

    try:
        cur.execute('''select b_id, title, price, isbn, pages, a_name, p_name, url from books
                    join written_by on books.b_id = written_by.w_b_id
                    join authors on written_by.w_a_id = authors.a_id
                    join publishers on books.p_id = publishers.p_id
                    where title = (%s)''', (request.GET.get("q"),))
    except:
        return Response(status=status.HTTP_400_BAD_REQUEST)
    
    rows = cur.fetchall()

    if not rows:
        return Response(status=status.HTTP_204_NO_CONTENT)
    
    books = []

    for row in rows:
        bookInfo = {
            "title": row[1],
            "price": row[2],
            "isbn": row[3],
            "pages": row[4],
            "author": row[5],
            "publisher": row[6],
            "url": row[7]
        }
        books.append(bookInfo)

    cur.close()
    con.close()
    
    return Response(books)
    

@api_view(["GET", "DELETE"])
def retrieveSingleBook(request, pk):
    con = psycopg2.connect(
    database='bookstore',
    user=os.environ['POSTGRESUSERNAME'],
    password=os.environ['POSTGRESPASSWORD']
    )

    cur = con.cursor()
    response = None
    
    cur.execute('''select case when count(*) > 0 then 1 else 0 end as is_present from books where b_id = (%s);''', (pk,))
    if not (cur.fetchall()[0][0]):
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    if request.method == "GET":
        cur.execute('''select b_id, title, price, isbn, pages, a_name, p_name, url from books
                join written_by on books.b_id = written_by.w_b_id
                join authors on written_by.w_a_id = authors.a_id
                join publishers on books.p_id = publishers.p_id
                where books.b_id = (%s)''', (pk,))

        rows = cur.fetchall()
        books = []

        for row in rows:
            bookInfo = {
                "id": row[0],
                "title": row[1],
                "price": row[2],
                "isbn": row[3],
                "pages": row[4],
                "author": row[5],
                "publisher": row[6],
                "url": row[7]
            }
            books.append(bookInfo)
            response = Response(books)
    elif request.method == "DELETE":
        cur.execute('''delete from books where b_id = (%s);''', (pk,))
        response = Response(status=status.HTTP_204_NO_CONTENT)

    cur.close()
    con.commit()
    con.close()

    return response

@api_view(["PATCH"])
def updateBookQuantity(request):
    con = psycopg2.connect(
    database='bookstore',
    user=os.environ['POSTGRESUSERNAME'],
    password=os.environ['POSTGRESPASSWORD']
    )

    cur = con.cursor()
    jsonForm = request.data

    cur.execute('''update books
                    set quantity = quantity - (%s) where isbn = (%s)
                    returning isbn''', (jsonForm["quantity"], jsonForm["isbn"]))
    
    cur.close()
    con.commit()
    con.close()

    return Response(status=status.HTTP_200_OK)
