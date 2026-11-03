import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<String> _titles = [
    'Inicio',
    'Peoples',
    'Calls',
    'Chats',
    'Configuration',
    'Exit',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menú Espectacular',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.indigo,
        fontFamily: 'sans-serif',
      ),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Text(
            _titles[_selectedIndex],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 22,
              letterSpacing: 1.2,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        drawer: Drawer(
          child: Container(
            color: const Color(0xFFF8F9FA),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                // ENCABEZADO ESPECTACULAR CON IMAGEN Y DEGRADADO
                DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Imagen de fondo con overlay oscuro
                      Image.network(
                        'https://imgs.search.brave.com/ldFh-BLdd9wiDnViQn0Y9FTZvjYVltWp3JOihSK1VOk/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2U3LzVj/L2JhL2U3NWNiYTcz/ZjI2ZTFmMGFlZDg5/YzQ5YzBkZGNiYmU3/LmpwZw',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Colors.black.withOpacity(0.85),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      // Contenido del perfil
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [Color(0xFF00FFED), Color(0xFF00B8D4)],
                                  ),
                                ),
                                child: const CircleAvatar(
                                  radius: 32,
                                  backgroundImage: NetworkImage('https://picsum.photos/200'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              '¡Hola, Bienvenido!',
                              style: TextStyle(
                                color: Color(0xFF00FFED),
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 10),

                // ITEMS DEL MENÚ REFORZADOS CON ESTILO
                _buildMenuItem(
                  index: 0,
                  icon: Icons.home_rounded,
                  title: 'Inicio',
                  color: const Color(0xFF6A11CB),
                ),
                _buildMenuItem(
                  index: 1,
                  icon: Icons.people_alt_rounded,
                  title: 'Peoples',
                  color: const Color(0xFFFF416C),
                ),
                _buildMenuItem(
                  index: 2,
                  icon: Icons.phone_in_talk_rounded,
                  title: 'Calls',
                  color: const Color(0xFF11998E),
                ),
                _buildMenuItem(
                  index: 3,
                  icon: Icons.forum_rounded,
                  title: 'Chats',
                  color: const Color(0xFFFF4E50),
                ),
                _buildMenuItem(
                  index: 4,
                  icon: Icons.settings_rounded,
                  title: 'Configuration',
                  color: const Color(0xFFFC4A1A),
                ),
                const Divider(indent: 20, endIndent: 20, height: 30),
                _buildMenuItem(
                  index: 5,
                  icon: Icons.power_settings_new_rounded,
                  title: 'Exit',
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
        ),
        
        // CUERPO DE PANTALLAS DINÁMICAS Y VISTOSAS
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF3F4F6), Color(0xFFE5E7EB)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              _buildFeaturePage(
                title: 'Bienvenido de Nuevo',
                subtitle: 'Explora todas las novedades que tenemos para ti hoy.',
                icon: Icons.rocket_launch_rounded,
                accentColor: const Color(0xFF6A11CB),
              ),
              _buildFeaturePage(
                title: 'Comunidad & Personas',
                subtitle: 'Conecta con tus amigos y expande tu red.',
                icon: Icons.people_alt_rounded,
                accentColor: const Color(0xFFFF416C),
              ),
              _buildFeaturePage(
                title: 'Historial de Llamadas',
                subtitle: 'Revisa tus llamadas perdidas y llamadas recientes.',
                icon: Icons.phone_in_talk_rounded,
                accentColor: const Color(0xFF11998E),
              ),
              _buildFeaturePage(
                title: 'Salas de Chat',
                subtitle: 'Mensajes en tiempo real con cifrado de extremo a extremo.',
                icon: Icons.forum_rounded,
                accentColor: const Color(0xFFFF4E50),
              ),
              _buildFeaturePage(
                title: 'Ajustes de Cuenta',
                subtitle: 'Personaliza tu privacidad, temas y notificaciones.',
                icon: Icons.settings_rounded,
                accentColor: const Color(0xFFFC4A1A),
              ),
              _buildFeaturePage(
                title: 'Cerrar Sesión',
                subtitle: '¿Estás seguro de que deseas salir de la aplicación?',
                icon: Icons.power_settings_new_rounded,
                accentColor: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Creador de items del menú lateral estilizados
  Widget _buildMenuItem({
    required int index,
    required IconData icon,
    required String title,
    required Color color,
  }) {
    final isSelected = _selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: isSelected
              ? LinearGradient(
                  colors: [color.withOpacity(0.85), color],
                )
              : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          leading: Icon(
            icon,
            color: isSelected ? Colors.white : color,
            size: 26,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              fontSize: 16,
            ),
          ),
          trailing: isSelected
              ? const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 16)
              : null,
          onTap: () => _onItemTapped(index),
        ),
      ),
    );
  }

  // Creador de contenido llamativo para cada pantalla
  Widget _buildFeaturePage({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color accentColor,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: accentColor.withOpacity(0.18),
                blurRadius: 25,
                spreadRadius: 5,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: accentColor.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 64,
                  color: accentColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Colors.grey[900],
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 28),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  foregroundColor: Colors.white,
                  elevation: 6,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Explorar Sección',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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