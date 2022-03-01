import 'package:flutter/material.dart';
import 'package:flutter_provider/feature/login/viewmodel/login_view_model.dart';
import 'package:flutter_provider/product/constant/image_enum.dart';
import 'package:flutter_provider/product/padding/page_padding.dart';
import 'package:flutter_provider/product/utility/input_decoration.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String data = 'Remember Me';
  final String data2 = 'Login';
  final String title2 = 'Name';
  final String data3 = 'Login';

  late final LoginViewModel _loginViewModel;

  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, child) {
        return _bodyView(context);
      },
    );
  }

  Scaffold _bodyView(BuildContext _context) {
    return Scaffold(
      appBar: AppBar(
        leading: _loadingWidget(),
      ),
      body: Padding(
        padding: const PagePadding.allLow(),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          AnimatedContainer(
            duration: context.durationLow,
            child: SizedBox(
              height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.25),
              width: context.dynamicWidth(0.4),
              child: ImageEnums.door.toImage,
            ),
          ),
          Text(
            data3,
            style: context.textTheme.headline3,
          ),
          TextField(
            decoration: ProjectInputs(title2),
          ),
          ElevatedButton(
              onPressed: _context.watch<LoginViewModel>().isLoading
                  ? null
                  : () {
                      _loginViewModel.controlTextValue();
                    },
              child: Text(data2)),
          CheckboxListTile(
              value: _context.watch<LoginViewModel>().isCheckBox,
              title: Text(data),
              onChanged: (value) {
                // context.read<LoginViewModel>().checkBoxChange(value ?? false);
                _loginViewModel.checkBoxChange(value ?? false);
              }),
        ]),
      ),
    );
  }

  Widget _loadingWidget() {
    return Selector<LoginViewModel, bool>(selector: (context, viewModel) {
      return viewModel.isLoading == true;
    }, builder: (context, value, child) {
      return value
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox();
    });

    /*  return Consumer<LoginViewModel>(builder: (context, value, child) {
      return value.isLoading
          ? const Center(child: CircularProgressIndicator())
          : const SizedBox();
    });*/
  }
}
