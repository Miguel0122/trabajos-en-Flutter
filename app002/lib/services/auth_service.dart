import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static User? get currentUser => _auth.currentUser;
  static Stream<User?> get authStateChanges => _auth.authStateChanges();

  static Future<String?> registrar({
    required String nombre,
    required String email,
    required String password,
    required String telefono,
  }) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await cred.user!.updateDisplayName(nombre);
      await _guardarUsuarioEnFirestore(
        uid: cred.user!.uid,
        nombre: nombre,
        email: email,
        telefono: telefono,
        fotoUrl: '',
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return _mensajeError(e.code);
    }
  }

  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return _mensajeError(e.code);
    }
  }

  static Future<String?> loginConGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return 'Inicio cancelado';
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final cred = await _auth.signInWithCredential(credential);
      final doc = await _db.collection('usuarios').doc(cred.user!.uid).get();
      if (!doc.exists) {
        await _guardarUsuarioEnFirestore(
          uid: cred.user!.uid,
          nombre: cred.user!.displayName ?? 'Sin nombre',
          email: cred.user!.email ?? '',
          telefono: '',
          fotoUrl: cred.user!.photoURL ?? '',
        );
      }
      return null;
    } catch (e) {
      return 'Error al iniciar con Google';
    }
  }

  static Future<void> logout() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
  }

  static Future<Map<String, dynamic>?> obtenerPerfil() async {
    final uid = currentUser?.uid;
    if (uid == null) return null;
    final doc = await _db.collection('usuarios').doc(uid).get();
    return doc.data();
  }

  static Future<String?> actualizarPerfil({
    required String nombre,
    required String telefono,
    File? nuevaFoto,
  }) async {
    final uid = currentUser?.uid;
    if (uid == null) return 'No hay usuario activo';
    try {
      String? fotoUrl;
      if (nuevaFoto != null) {
        final ref = _storage.ref().child('fotos_perfil/$uid.jpg');
        await ref.putFile(nuevaFoto);
        fotoUrl = await ref.getDownloadURL();
        await currentUser!.updatePhotoURL(fotoUrl);
      }
      await currentUser!.updateDisplayName(nombre);
      final data = <String, dynamic>{
        'nombre': nombre,
        'telefono': telefono,
        'updatedAt': FieldValue.serverTimestamp(),
      };
      if (fotoUrl != null) data['fotoUrl'] = fotoUrl;
      await _db.collection('usuarios').doc(uid).update(data);
      return null;
    } catch (e) {
      return 'Error al actualizar el perfil';
    }
  }

  static Future<void> _guardarUsuarioEnFirestore({
    required String uid,
    required String nombre,
    required String email,
    required String telefono,
    required String fotoUrl,
  }) async {
    await _db.collection('usuarios').doc(uid).set({
      'nombre': nombre,
      'email': email,
      'telefono': telefono,
      'fotoUrl': fotoUrl,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  static String _mensajeError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Este correo ya está registrado';
      case 'invalid-email':
        return 'Correo inválido';
      case 'weak-password':
        return 'La contraseña debe tener al menos 6 caracteres';
      case 'user-not-found':
        return 'No existe una cuenta con este correo';
      case 'wrong-password':
        return 'Contraseña incorrecta';
      case 'too-many-requests':
        return 'Demasiados intentos. Intenta más tarde';
      default:
        return 'Error de autenticación. Intenta de nuevo';
    }
  }
}
