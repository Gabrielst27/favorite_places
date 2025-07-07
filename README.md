# Sobre

Um projeto no qual o usuário pode criar uma lista de lugares, acessando **recursos nativos** do dispositivo como **câmera**, **localização** e **memória** do dispositivo para salvar os lugares. Além disso, são consumidas as API's **Nominatim** e **Openstreet Map** para renderizar um web map mostrando a localização escolhida pelo usuário, de acordo com a latitude e longitude enviadas ao acessar ao localização do dispositivo.

Projeto inteiramente Open Source, desenvolvido para fins de aprendizagem em **Flutter**.

## Importante

Para que o projeto funcione, é preciso criar o arquivo environment.dart, contendo as variáveis **nominatimUrl**, **openStreetMapUrlTemplate** e **openStreetMapUserAgentPackageName**.

Para saber mais sobre as API's consumidas, consulte as seguintes documentações:

- [Nominatim documentation](https://nominatim.org/release-docs/latest/)
- [flutter_map documentation](https://docs.flutter.dev/cookbook)
