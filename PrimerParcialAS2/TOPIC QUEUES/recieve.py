import pika
import sys

connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='topicss', exchange_type='topic') #debe coincidir el nombre del exchange

help = channel.queue_declare('', exclusive=True)
nombreCola = help.method.queue

claves = sys.argv[1:]
if not claves:
    print("   \n\n **** no se especifico ningun TOPIC ****\n")
    sys.exit(1)

for clave in claves:
    channel.queue_bind(exchange='topicss', queue=nombreCola, routing_key=clave)

    if clave == "#":
        print (" -> Escuchando todos los TOPICs")
    else:
        print(' -> Escuchando TOPIC: "' + clave + '"')

print(' -> Esperando mensajes. To exit press CTRL+C')


def callback(ch, canal, properties, mensaje):
    print(" -> Canal: %r - Mensaje: %r" % (canal.routing_key, mensaje))


channel.basic_consume(
    queue=nombreCola, on_message_callback=callback, auto_ack=True)

channel.start_consuming()