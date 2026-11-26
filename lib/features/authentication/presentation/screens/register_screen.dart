import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset('assets/images/logo.jpeg', fit: BoxFit.cover),

          // Background Overlay
          Container(color: Colors.black.withValues(alpha: 0.20)),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: AppColors.cream.withValues(alpha: 0.94),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        'Create Account',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              color: AppColors.forest,
                              fontWeight: FontWeight.bold,
                            ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'Join NUTRIVERSE and start your healthy journey.',
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(color: AppColors.darkText),
                      ),

                      const SizedBox(height: 25),

                      // Full Name
                      _buildLabel('Full Name'),
                      _buildField(
                        controller: _nameController,
                        hint: 'Enter your full name',
                        icon: Icons.person_outline,
                      ),

                      const SizedBox(height: 18),

                      // Email
                      _buildLabel('Email Address'),
                      _buildField(
                        controller: _emailController,
                        hint: 'Enter your email',
                        icon: Icons.email_outlined,
                        keyboardType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 18),

                      // Password
                      _buildLabel('Password'),
                      _buildField(
                        controller: _passwordController,
                        hint: 'Create a password',
                        icon: Icons.lock_outline,
                        obscure: _obscurePassword,
                        suffix: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Confirm Password
                      _buildLabel('Confirm Password'),
                      _buildField(
                        controller: _confirmPasswordController,
                        hint: 'Confirm your password',
                        icon: Icons.lock_outline,
                        obscure: _obscureConfirmPassword,
                        suffix: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Create Account Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Firebase registration will be added later.
                          },
                          child: const Text('Create Account'),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Login Navigation
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text('Already have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Login',
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(
                                      color: AppColors.forest,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Label Widget
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium
            ?.copyWith(fontWeight: FontWeight.w600, color: AppColors.darkText),
      ),
    );
  }

  // Text Field Widget
  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    Widget? suffix,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
