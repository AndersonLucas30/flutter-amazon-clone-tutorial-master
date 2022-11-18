import 'package:flutter/material.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/global_variables.dart';
import '../services/auth_service.dart';

enum Auth {
  signin,
  signup,
  vazio,
}

class CadNovoUsuario extends StatefulWidget {
  const CadNovoUsuario({key});

  @override
  State<CadNovoUsuario> createState() => _CadNovoUsuarioState();
}

class _CadNovoUsuarioState extends State<CadNovoUsuario> {
  Auth _auth = Auth.vazio;
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String category_user = 'Qual é a categoria do seu serviço ?';

  List<String> productCategories = [
    'Qual é a categoria do seu serviço ?',
    'Serviços Gerais',
    'Construções',
    'Encanamento',
    'Elétrica',
    'Marcenaria',
    'Mecânica'
  ];

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      category_user: category_user,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      appBar: AppBar(
        backgroundColor: GlobalVariables.greyBackgroundCOlor,
        title: const Text(
          'Cadastro',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(10),
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _nameController,
                        hintText: 'Nome',
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Senha',
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "Que tipo de usuário deseja ser ?",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: ListTile(
                              tileColor: _auth == Auth.signup
                                  ? GlobalVariables.greyBackgroundCOlor
                                  : GlobalVariables.greyBackgroundCOlor,
                              title: const Text(
                                'Contratante',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              leading: Radio(
                                activeColor: Colors.white,
                                value: Auth.signup,
                                groupValue: _auth,
                                onChanged: (Auth? val) {
                                  setState(() {
                                    _auth = val!;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              tileColor: _auth == Auth.signin
                                  ? GlobalVariables.greyBackgroundCOlor
                                  : GlobalVariables.greyBackgroundCOlor,
                              title: const Text(
                                'Prestador(a) de Serviços',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              leading: Radio(
                                activeColor: Colors.white,
                                hoverColor: Colors.white,
                                value: Auth.signin,
                                groupValue: _auth,
                                onChanged: (Auth? val) {
                                  setState(() {
                                    _auth = val!;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      if (_auth == Auth.signin)
                        SizedBox(
                          width: double.infinity,
                          child: DropdownButton(
                            dropdownColor: GlobalVariables.greyBackgroundCOlor,
                            value: category_user,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            iconEnabledColor: Colors.white,
                            underline: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 1),
                              ),
                            ),
                            isExpanded: true,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17),
                            items: productCategories.map((String item) {
                              return DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (String? newVal) {
                              setState(() {
                                category_user = newVal!;
                              });
                            },
                          ),
                        ),
                      const SizedBox(height: 45),
                      CustomButton(
                        text: 'Cadastrar',
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            signUpUser();
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
