import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../application/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 class LoginPage extends ConsumerStatefulWidget {
   const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
   final emailController = TextEditingController();
   final passwordController = TextEditingController();

   @override
   void dispose() {
     emailController.dispose();
     passwordController.dispose();
     super.dispose();
   }

   @override
   Widget build(BuildContext context) {

     final authController = ref.read(authControllerProvider.notifier);
     final authState = ref.watch(authControllerProvider);

     ref.listen(authControllerProvider, (prev, next) {
       next.whenOrNull(
         data: (user) {
           if (user != null) {
             Navigator.pushReplacementNamed(context, '/home');
           }
         },
         error: (err, _) {
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('Erro: ${err.toString()}')),
           );
         },
       );
     });

     final theme = Theme.of(context);

     return Scaffold(
       backgroundColor: theme.colorScheme.background,
       body: Center(
         child: Padding(
             padding: EdgeInsets.all(24.0),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Icon(Icons.security, size: 72,),
               SizedBox(height: 16,),
               Text('BANK', style: theme.textTheme.headlineLarge,),
               SizedBox(height: 16,),
               Text('Please sign in to continue', style: theme.textTheme.bodyMedium,),
               SizedBox(height: 24,),

               TextField(controller: emailController,decoration: InputDecoration( labelText: 'Email', prefixIcon: Icon(Icons.email), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),),
               SizedBox(height: 16,),
               TextField(controller: passwordController,decoration: InputDecoration( labelText: 'Password', prefixIcon: Icon(Icons.lock), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),),
               SizedBox(height: 24,),

               SizedBox(
                 width: double.infinity,
                 child: ElevatedButton(
                   onPressed: authState.isLoading
                       ? null
                       : () {
                     final email = emailController.text.trim();
                     final password = passwordController.text.trim();
                     authController.login(email, password);
                   },
                   child: authState.isLoading
                       ? const SizedBox(
                     width: 20,
                     height: 20,
                     child: CircularProgressIndicator(
                       color: Colors.white,
                       strokeWidth: 2,
                     ),
                   )
                       : const Text('Login'),
                 ),
               ),
               SizedBox(height: 16,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text("Don't have an account?", style: theme.textTheme.bodySmall,),
                   SizedBox(width: 4,),
                   GestureDetector(
                     onTap: (){},
                     child: Text('Sign up', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),),
                   )
                 ],
               )
             ],
           ),
         ),
       ),
     );
   }
}
 