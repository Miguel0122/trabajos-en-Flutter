import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType teclado;
  final bool esPassword;
  final bool verPassword;
  final VoidCallback? onTogglePassword;

  const CampoTexto({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.teclado = TextInputType.text,
    this.esPassword = false,
    this.verPassword = false,
    this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: teclado,
      obscureText: esPassword && !verPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.amber[800]),
        suffixIcon: esPassword
            ? IconButton(
                icon: Icon(
                  verPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: onTogglePassword,
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.amber[800]!, width: 2),
        ),
      ),
    );
  }
}
