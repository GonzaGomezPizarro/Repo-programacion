import pika #this is the Python client recommended by the RabbitMQ team

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

# We're connected now, to a broker on the local machine - hence the localhost.
# If we wanted to connect to a broker on a different machine we'd simply specify its name or IP address here.

# Next, before sending we need to make sure the recipient queue exists. 
# If we send a message to non-existing location, RabbitMQ will just drop the message. 
# Let's create a hello queue to which the message will be delivered:

channel.queue_declare(queue='hello')

# At this point we're ready to send a message. 

channel.basic_publish(exchange='', #todavia no nos metemos con el exchange
                      routing_key='hello', #nombre de la cola
                      body='Hello World!') #mensaje a mandar
print(" [x] Sent 'Hello World!'")

# Before exiting the program we need to make sure the network buffers were flushed and our message was actually delivered to RabbitMQ.
# We can do it by gently closing the connection.

connection.close()
