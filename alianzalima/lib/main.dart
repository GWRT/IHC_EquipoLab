import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:alianzalima/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alianzalima/blocs/preferences_bloc.dart';
import 'package:alianzalima/repositories/preferences_repository_impl.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'recovery.dart';
import 'usuarios.dart';
import 'register.dart';
import 'package:alianzalima/widgets/widgets.dart';
import 'package:alianzalima/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferencesRepository = PreferencesRepositoryImpl();

  final preferencesBloc = PreferencesBloc(
    preferencesRepository: preferencesRepository,
    initialLocale: await preferencesRepository.locale,
  );

  runApp(
    BlocProvider(
      create: (context) => preferencesBloc,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themes,
          routes: <String, WidgetBuilder>{
            '/Recovery': (BuildContext context) => new RecoveryPage(),
            '/Users': (BuildContext context) => new Usuarios(),
            '/Register': (BuildContext context) => new MyHome(),
          },
          home: new MyHomePage(),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate,
            LocaleNamesLocalizationsDelegate(),
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text('Alianza Lima',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                    child: Text(S.of(context).textLogIn,
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold)),
                  ),

                ],
              ),
            ),
            //LanguageCard(),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: S.of(context).textWithPlaceholderUserLogin,
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: S.of(context).textWithPlaceholderUserPassword,
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/Recovery');
                        },
                        child: Text(
                          S.of(context).questionForPassword,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(    
                          onTap: (){
                            Navigator.of(context).pushNamed('/Users');
                          },         
                          child: Center(
                            child: Text(
                              S.of(context).textButtonLogIn,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(//ingresar por email
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                                //child:
                              //ImageIcon(AssetImage('assets/facebook.png')),
                            ),
                            SizedBox(width: 10.0),
                            Center(
                              child: Text(S.of(context).textButtonLogInByEmail,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  S.of(context).questionForAccount,
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/Register');
                  },
                  child: Text(
                    S.of(context).textRegister,
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

class LanguageCard extends StatelessWidget {
  const LanguageCard({Key key}) : super(key: key);

  String _localizeLocale(BuildContext context, Locale locale) {
    if (locale == null) {
      return S.of(context).systemLanguage;
    } else {
      final localeString = LocaleNames.of(context).nameOf(locale.toString());
      return localeString[0].toUpperCase() + localeString.substring(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final preferencesBloc = context.bloc<PreferencesBloc>();

    return ExpansionListCard<Locale>(
      title: S.of(context).language,
      subTitle: _localizeLocale(context, preferencesBloc.state.locale),
      leading: Icon(Icons.language, size: 48),
      items: [
        null,
        ...S.delegate.supportedLocales,
      ],
      itemBuilder: (locale) {
        return ExpansionCardItem(
          text: _localizeLocale(context, locale),
          onTap: () => preferencesBloc.add(ChangeLocale(locale)),
        );
      },
    );
  }
}
