import 'package:extilo_carioca/helpers/validators.dart';
import 'package:extilo_carioca/model/user/user.dart';
import 'package:extilo_carioca/model/user/user_manager.dart';
import 'package:extilo_carioca/style/style_screen_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {

  static final _UsNumberTextInputFormatter _birthDate = new _UsNumberTextInputFormatter();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final UserUser user = UserUser();

  @override
  Widget build(BuildContext context) {
    return styleScreenPattern(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: scaffoldKey,
        body: Center(
          child: SingleChildScrollView(
            child: Consumer<UserManager>(
              builder: (_, userManager, __){
                return Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      child: Center(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                    height: 50,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 60,
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: Colors.white,
                                              )
                                          ),
                                          Text(
                                            'Cadastro',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontFamily: 'Principal'
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      color: Theme.of(context).primaryColor,
                                    )
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child: TextFormField(
                                          keyboardType: TextInputType.name,
                                          autocorrect: false,
                                          enabled: !userManager.loading,
                                          validator: (name) {
                                            if(name.isEmpty)
                                              return 'Campo obrigatório';
                                            else if(name.trim().split(' ').length <= 1)
                                              return 'Preencha seu nome e sobrenome';
                                            return null;
                                          },
                                          onSaved: (name) => user.name = name,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.black)
                                              ),
                                              labelText: 'Nome Completo',
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontFamily: 'Principal'
                                              )
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.datetime,
                                          autocorrect: false,
                                          enabled: !userManager.loading,
                                          maxLength: 10,
                                          validator: (nasc){
                                            if(nasc.isEmpty)
                                              return 'Campo obrigatório';
                                            if(nasc.length < 10)
                                              return 'Formato inválido';
                                            return null;
                                          },
                                          inputFormatters: [
                                            // ignore: deprecated_member_use
                                            WhitelistingTextInputFormatter.digitsOnly,
                                            _birthDate,
                                          ],
                                          onSaved: (nasc) => user.datanasc = nasc,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.black)
                                              ),
                                              labelText: 'Data de nascimento',
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontFamily: 'Principal'
                                              )
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          autocorrect: false,
                                          enabled: !userManager.loading,
                                          validator: (email) {
                                            if(email.isEmpty)
                                              return 'Campo obrigatório';
                                            else if(!emailValid(email))
                                              return 'E-mail inválido';
                                            return null;
                                          },
                                          onSaved: (email) => user.email = email,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.black)
                                              ),
                                              labelText: 'Email',
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontFamily: 'Principal'
                                              )
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                        child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          autocorrect: false,
                                          obscureText: true,
                                          enabled: !userManager.loading,
                                          validator: (pass) {
                                            if(pass.isEmpty)
                                              return 'Campo obrigatório';
                                            else if(pass.length < 6)
                                              return 'Senha muito curta';
                                            return null;
                                          },
                                          onSaved: (pass) => user.password = pass,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.black)
                                              ),
                                              labelText: 'Senha',
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontFamily: 'Principal'
                                              )
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                        child: TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          autocorrect: false,
                                          obscureText: true,
                                          enabled: !userManager.loading,
                                          validator: (pass) {
                                            if(pass.isEmpty)
                                              return 'Campo obrigatório';
                                            else if(pass.length < 6)
                                              return 'Senha muito curta';
                                            return null;
                                          },
                                          onSaved: (pass) => user.confirmPassword = pass,
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.black)
                                              ),
                                              labelText: 'Confirma Senha',
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontFamily: 'Principal'
                                              )
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          // TODO: IMPLEMENTAR ENTRAR COM FACEBOOK
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage('images/Icone face.png'),
                                                        fit: BoxFit.contain
                                                    )
                                                ),
                                              ),
                                              SizedBox(width: 10,),
                                              Text(
                                                'Entrar com o facebook',
                                                style: TextStyle(
                                                    color: Theme.of(context).primaryColor,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Principal'
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 54,
                                            width: 200,
                                            child: RaisedButton(
                                              onPressed: userManager.loading ? null : (){
                                                if(formKey.currentState.validate()){
                                                  formKey.currentState.save();
                                                  if(user.password != user.confirmPassword){
                                                    scaffoldKey.currentState.showSnackBar(
                                                      SnackBar(
                                                        content: const Text('Senhas não coincidem!',
                                                             style: TextStyle(fontSize: 16, color: Colors.red),
                                                        ),
                                                        backgroundColor: Colors.black,
                                                      ),
                                                    );
                                                    return;
                                                  }
                                                  userManager.signUp(
                                                    user: user,
                                                    onSuccess: (){
                                                      Navigator.of(context).pushNamed('/base');
                                                    },
                                                    onFail: (e){
                                                      scaffoldKey.currentState.showSnackBar(
                                                        SnackBar(
                                                          content: Text('Falha ao cadastrar: $e',
                                                            style: TextStyle(fontSize: 16, color: Colors.red),
                                                          ),
                                                          backgroundColor: Colors.black,
                                                        )
                                                      );
                                                    }
                                                  );
                                                }
                                              },
                                              color: Theme.of(context).primaryColor,
                                              child: userManager.loading ?
                                              CircularProgressIndicator(
                                                valueColor: AlwaysStoppedAnimation(Colors.white),
                                              ) : Text(
                                                'Concluir',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 20,
                                                    fontFamily: 'Principal'
                                                ),
                                              ),
                                              elevation: 0,
                                              disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(30)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight: Radius.circular(20)),
                                            color: Colors.white,
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    )
                  ],
                );
              },
            )
          ),
        ),
      ),
    );
  }
}

class _UsNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 3) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 2) + "/");
      if (newValue.selection.end >= 2)
        selectionIndex ++;
    }
    if (newTextLength >= 5) {
      newText.write(newValue.text.substring(2, usedSubstringIndex = 4) + "/");
      if (newValue.selection.end >= 4)
        selectionIndex++;
    }
    if (newTextLength >= 9) {
      newText.write(newValue.text.substring(4, usedSubstringIndex = 8));
      if (newValue.selection.end >= 8)
        selectionIndex++;
    }
// Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
