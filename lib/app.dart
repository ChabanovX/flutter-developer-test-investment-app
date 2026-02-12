import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_investment_app/core/di/di.dart';
import 'package:stock_investment_app/core/theme/theme.dart';
import 'package:stock_investment_app/stocks/presentation/state/stock_cubit.dart';
import 'package:stock_investment_app/stocks/presentation/ui/stock_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      builder: (context, child) {
        return Theme(
          data: ThemeData(extensions: [AppTheme.light()]),
          child: child!,
        );
      },
      title: 'Stock Investment',
      home: BlocProvider(
        create: (context) {
          final cubit = getIt<StockCubit>();
          unawaited(cubit.init());
          return cubit;
        },
        child: const StockPage(),
      ),
    );
  }
}
