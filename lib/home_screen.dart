import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsive_login_ui/bloc/auth_bloc.dart';
import 'package:flutter_responsive_login_ui/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // we are using "as AuthSuccess coz, the only way we can reach to this screen"
    // is when we hit a AuthSuccess state

    return Scaffold(
        // now to render uid of the logged in user, we can use
        // BlocBuilder, but instead of that I can use ,
        // context.watch() which will continuously listen to the
        // Provider(in this case a bloc) for any state changes
        body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // we can remove this since we are using BlocConsumer
        // final authState = context.watch<AuthBloc>().state as AuthSuccess;
        if (state is AuthSuccess) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((state as AuthSuccess).uid),
                ElevatedButton(
                    onPressed: () {
                      // we'll use context.read() coz it is just a one time event
                      context.read<AuthBloc>().add(AuthLogoutRequested());
                    },
                    child: Text('Logout'))
              ],
            ),
          );
        }

        return Container();
      },
    ));
  }
}
