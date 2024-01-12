from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
import psycopg2
import os
import uuid

@api_view(["GET", "POST"])
def retrieveInfoForAllCustomers(request):
    con = psycopg2.connect(
    database='bookstore',
    user=os.environ['POSTGRESUSERNAME'],
    password=os.environ['POSTGRESPASSWORD']
    )

    cur = con.cursor()
    response = None

    if request.method == "GET":      
        cur.execute('''select * from customers''')

        rows = cur.fetchall()
        customers = []

        for row in rows:
            customerInfo = {
                "firstName": row[1],
                "lastName": row[2],
                "phone": row[4],
            }
            customers.append(customerInfo)
        
        response = Response(customers)
    elif request.method == "POST":
        customerInfo = request.data

        #if we are also adding in addresses, you will have to start a transaction
        cur.execute('''insert into customers (c_id, first_name, last_name, cellphone)
                        values ((%s), (%s), (%s), (%s))
                        returning c_id''', (str(uuid.uuid4()), customerInfo["firstName"], customerInfo["lastName"], customerInfo["phone"]))

        response = Response(cur.fetchone()[0], status=status.HTTP_200_OK)
    else:
        response = Response(request.method, status=status.HTTP_400_BAD_REQUEST)

    cur.close()
    con.commit()
    con.close()

    return response