import pika
import sys

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost',))
channel = connection.channel()

channel.exchange_declare(exchange='topicss', exchange_type='topic',) 

clave = sys.argv[1] if len(sys.argv) > 2 else 'anonymous.info'
mensaje = ' '.join(sys.argv[2:]) or 'Hello World!'

channel.basic_publish(exchange='topicss', routing_key=clave, body=mensaje)

print(" -> Se envio %r:%r" % (clave, mensaje))
connection.close()