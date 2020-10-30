import 'package:flutter/material.dart';

class StudioScreen extends StatefulWidget {
  List data;
  StudioScreen({Key key, this.data}) : super(key: key);

  @override
  _StudioScreenState createState() => _StudioScreenState(data);
}

class _StudioScreenState extends State<StudioScreen> {
  List data;
  _StudioScreenState(this.data);

  //split - inicio
  List<String> split(String string, String separator, {int max = 0}) {
    var result = List<String>();

    if (separator.isEmpty) {
      result.add(string);
      return result;
    }

    while (true) {
      var index = string.indexOf(separator, 0);
      if (index == -1 || (max > 0 && result.length >= max)) {
        result.add(string);
        break;
      }

      result.add(string.substring(0, index));
      string = string.substring(index + separator.length);
    }

    return result;
  }
  //split - fin

  @override
  Widget build(BuildContext context) {
    List<String> date = split(data[2], '/');
    String name = data[0];
    String lastName = data[1];
    int day = int.parse(date[0]);
    int month = int.parse(date[1]);
    int year = int.parse(date[2]);

    int urgInt = urgenciaInterior(day, month, year);
    int tonicaFund = tonicaFundamental(name, lastName, urgInt);
    int tonicaDelDia = tonicaDia(urgInt, tonicaFund);
    int acontDia = acontecimientoDia(urgInt, tonicaFund);
    String cabala = cabalaYear(year);

    List<String> significadosTonicaDia = [
      'Marca un destino y un aprendizaje de vida para desarrollar la cualidad de líder, para arriesgarse por lo nuevo, plasmando los propios sueños y proyectos. Marcara una vida llena de inicios tanto laborales, vocacionales, vinculares o amorosos',
      'Tu vida te conducirá hacia  temas ligados a maternidad, hogar, familia, cuidados, protección, permanencia y seguridad; tanto como hacia la necesidad de desarrollar la paciencia y capacidad de espera, entrando en contacto con la siempre presente protección espiritual más allá de la propia conciencia',
      'Tu vida te conducirá hacia  temas ligados a la autoestima y la propia valoración, poniéndote a prueba en tus  verdaderos  talentos de valerte por ti mismo y confiar en tu propia creatividad tanto como en tu capacidad para disfrutar del amor y del profundo encuentro con otros',
      'Tu vida te conducirá hacia  temas ligados a exigentes mandatos paternos, situaciones que obligan a sostener o a hacerse responsable en donde habrá que estar atento a no responder de maneras extremadamente rígidas',
      'Tu vida te conducirá a enfrentarte con temas “tabúes” no resueltos por la humanidad, como el manejo del poder y del dinero, lo oculto y la sexualidad',
      'Tu vida te pedirá estar abierto siempre a nuevasopciones no planeadas, animándote siempre a abrir nuevos caminos e incluir nuevas miradas a tus creencias o a tu forma de entender la vida',
      'Tu vida te conducirá hacia  situaciones en donde deberás asumir riesgos e independizarte. Pide desarrollar cada vez mayor valor y coraje personal, ya que será difícil delegar en otros los temas importantes de la propia existencia, suele marcar que casi todo dependerá de la propia voluntad y esfuerzo',
      'Tu vida te conducirá a situaciones en donde deberás poner orden y asumir responsabilidades propias y ajenas. Habrá que aprender a desarrollar sensatez y objetividad para poder actuar con imparcialidad y equidad',
      'Tu vida te conducirá hacia  temas de desapego de las formas externas, y a continuos cuestionamientos de los logros tanto profesionales como materiales. La persona delibera y se replantea el sentido de la existencia a través de pruebas espirituales a lo largo de toda su vida',
    ];

    List<String> significadoAcontecimientos = [
      'Comenzar tu día con una sonrisa hará que tu destino se pinte de colores',
      'Tu tiempo es limitado, de modo que no lo malgastes viviendo la vida de alguien más. Así que ten el coraje para hacer lo que te dicen tu corazón y tu intuición',
      'El éxito nunca será un gran paso en el futuro, el éxito es un pequeño paso que tomamos ahora',
      'Todos tus sueños se pueden convertir en realidad, mientras tengas el coraje para perseguirlos',
      '4 nuncas para tu vida: nunca agaches la cabeza, nunca digas que no puedes, nunca te limites, y nunca dejes de creer en ti',
      '5 cosas para hacer antes de salir de tu cama: da las gracias por un nuevo día, piensa en tus intenciones del día, toma 5 profundas respiraciones, sonríe sin razón alguna, y perdónate por los errores cometidos ayer',
      'El fracaso es una buena oportunidad para empezar de nuevo con más inteligencia',
      'La felicidad no está ahí fuera para que la encontremos, sino que se encuentra dentro de todos nosotros',
      'Cuando la vida te presente razones para llorar, demuéstrale que tienes mil y una razones para reír',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Estudio Numerológico Gratuito'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  '$lastName $name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: double.infinity,
                child: Text(
                  'Tu urgencia interior es: ' + urgInt.toString() + '\n' +
                  '\nTu tónica fundamental es: ' + tonicaFund.toString() + '\n' +
                  '\nTu tónica del dia es: ' + tonicaDelDia.toString() + '\n' + significadosTonicaDia[tonicaDelDia] + '\n' +
                  '\nTu acontecimiento del dia es:\n' + significadoAcontecimientos[acontDia] + '\n' +
                  '\nTu Cábala del Año es:\n' + cabala,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  //rehace la suma para que sea de un digito
  int checkOneDigit( int number ) {
    while (number > 9){
      number = sumDigits(number);
    }
    return number;
  }
  // obtiene los digitos de un numero
  List<int> getDigits(int number) {
    List<int> digits = [];

    while (number > 0) {
      digits.add(number % 10);
      number = ((number - number % 10) / 10).round();
    }

    return digits;
  }
  // suma los digitos de un numero
  int sumDigits(int number) {
    List<int> digits = getDigits(number);
    int result = 0;

    for (int i = 0; i < digits.length; i++) {
      result += digits[i];
    }
    return result;
  }
  //calcula la urgencia interior
  int urgenciaInterior( int day, int month, int year ){
    int sumDigitsDay = checkOneDigit(sumDigits(day));
    int sumDigitsMonth = checkOneDigit(sumDigits(month));
    int sumDigitsYear = checkOneDigit(sumDigits(year));

    return checkOneDigit(sumDigits(sumDigitsDay + sumDigitsMonth + sumDigitsYear));
  }

  int characterCount( String str ) {
    String res = str.trim();
    return res.length;
  }

  int tonicaFundamental( String name, String lastName, int ui ) {
    int sumCharacters = checkOneDigit(sumDigits(characterCount(name) + characterCount(lastName)));
    return checkOneDigit(sumDigits(sumCharacters + ui));
  }

  int tonicaDia( int ui, int tf ) {
    return checkOneDigit(sumDigits(ui + tf));
  }

  int acontecimientoDia( int ui, int tf) {
    int result = tonicaDia(ui, tf);
    int horaClave = 9;

    horaClave = sumDigits(horaClave);
    result = result + horaClave;
    result = checkOneDigit(sumDigits(result));

    return result; 
  }

  String cabalaYear( int year ) {
    String cabala = ''; //lista de cabalas
    int sumDigitsYear = sumDigits(year);

    year = year + sumDigitsYear;
    for (int i = 0; i < 4 ; i++) {
      cabala += 'Año: '+ year.toString() + ', número regente: ' + checkOneDigit(sumDigits(year)).toString() + '\n';
      sumDigitsYear = sumDigits(year);
      year = year + sumDigitsYear;
    }

    return cabala;
  }
}