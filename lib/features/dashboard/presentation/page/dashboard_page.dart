import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_qr_app/core/themes/bloc/theme_bloc.dart';
import 'package:flutter_qr_app/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter_qr_app/features/qr/presentation/qr_page.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.welcome});
  final String welcome;
  static const routeName = '/dashboard';
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {},

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(widget.welcome),
          forceMaterialTransparency: true,

          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.logout),
            ),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    if (state.isDarkMode) {
                      context.read<ThemeBloc>().add(
                        const ThemeEvent.switchLightMode(),
                      );
                    } else {
                      context.read<ThemeBloc>().add(
                        const ThemeEvent.switchDarkMode(),
                      );
                    }
                  },
                  icon: Icon(
                    !state.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  ),
                );
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Listado de QR Registrados',
                  style: TextStyle(fontSize: 24),
                ),
              ),

              BlocBuilder<DashboardBloc, DashboardState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            state.getQrScan[index].qrData,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            'Fecha y Hora: ${DateFormat('dd/MM/yyyy – HH:mm:ss').format(DateTime.fromMillisecondsSinceEpoch(state.getQrScan[index].date))}',
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Dato escaneado'),
                                  content: Text(state.getQrScan[index].qrData),
                                  actions: [
                                    TextButton.icon(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(Icons.close),
                                      label: const Text('Cerrar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                      itemCount: state.getQrScan.length,
                      separatorBuilder: (context, index) => Divider(height: 1),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(QrPage.routeName).then((
              value,
            ) async {
              _getData();
            });
          },
          tooltip: 'Escanear QR',
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          child: Icon(Icons.qr_code_scanner, color: Colors.white, size: 32),
        ),
      ),
    );
  }

  Future<void> _getData() async {
    context.read<DashboardBloc>().add(DashboardEvent.getAllQrScan());
  }
}
