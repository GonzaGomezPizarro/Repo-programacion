import pika
import sys

connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.queue_declare(queue='tareas', durable=True) #hace que el contenido de la cola no se pierda si se cierra RABBIT

message = ' '.join(sys.argv[1:]) or "Hello World!"
channel.basic_publish(
    exchange='',
    routing_key='tareas',
    body=message,
    properties=pika.BasicProperties(
        delivery_mode=pika.spec.PERSISTENT_DELIVERY_MODE  #hace que el mensaje sea durable en la cola
    ))
print(" -> Se envio: %r" % message)
connection.close()