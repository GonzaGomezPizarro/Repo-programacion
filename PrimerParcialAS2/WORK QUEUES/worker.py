import pika
import time

connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.queue_declare(queue='task_queue', durable=True) #hace que el contenido de la cola no se pierda si se cierra RABBIT
print(' [*] Waiting for messages. To exit press CTRL+C')


def callback(ch, method, properties, body):
    print(" [x] Received %r" % body.decode())
    time.sleep(body.count(b'.'))
    print(" [x] Done")
    ch.basic_ack(delivery_tag=method.delivery_tag) #responde que la tarea fue realizada y puede eliminar el mensaje de la cola
    #si se llegase a cortar el mensaje en medio del proceso, este no se elimina de la cola, por que no recibio el acknowledgment


channel.basic_qos(prefetch_count=1) #para que no envie + de una tarea a un trabajor (mientras esta procesando una)
channel.basic_consume(queue='task_queue', on_message_callback=callback)

channel.start_consuming()