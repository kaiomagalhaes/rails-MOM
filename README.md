# Rails MOM
Este serviço tem como objetivo o recebimento e envio de mensagens entre
aplicações distribuidas, com ele é possivel:
- Enviar mensagens de forma assíncrona de forma que caso o alvo não
  esteja disponivel no momento tão logo quanto possivel a mensagem será
reenviada até que o mesmo responda com um status 200.
- Armazenar mensagens de forma que um serviço qualquer poderá
  requisita-la sabendo o id do cliente em questão.

*Formato de envio*
- As mensagens deverão ser enviadas no seguinte formato:
  IP:PORT/send_message?for_send=true&client_id=idClient&message=myMessage

*Formato de busca*
IP:PORT/get_messages?client_id=1

#Sobre o envio
Durante o envio duas respostas são esperadas: status 200 e status 400
- 200: O sistema irá considerar que a mesma foi entregue ao destinatário
  e não estará mais disponivel para a busca, sendo assim caso o mesmo
tente busca-la no sistema será considerado que ela não existe.
- 400: O sistema irá considerar que a URL do cliente é inválida ou seja,
  não é possivel entregar a mensagem e sendo assim a mesma não será
enviada, porém caso o cliente tente busca-la irá encontra-la.

#Sobre o cliente
- Para enviar uma mensagem é necessário criar um cliente no sistema no
  seguinte formato: IP:PORT/create_client?url=urlDoCliente
- Será para essa url que a mensagem será enviada no seguinte formato: 
url?mensagem=mensagemParaOCliente

