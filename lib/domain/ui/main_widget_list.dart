import 'package:cript_kst/domain/blocs/bloc/cript_list_bloc.dart';
import 'package:cript_kst/domain/data/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainWidgetList extends StatelessWidget {
  final api = ApiClient();
  MainWidgetList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => CriptListBloc()..add(const FetchData()),
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: BlocConsumer<CriptListBloc, CriptListState>(
            listener: (context, state) {
              if (state is Loading) {
                if (state.isLoading) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(child: CircularProgressIndicator());
                      });
                } else {
                  Navigator.pop(context);
                }
              }
              if (state is ErrorState) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Ошибка'),
                        content: Text(state.errorMessage),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'))
                        ],
                      );
                    });
              }
            },
            buildWhen: (previous, current) => current is Loaded,
            builder: (context, state) {
              if (state is Loaded) {
                return ListView.builder(
                  itemCount: state.tickerWithPrices.length,
                  itemBuilder: (context, index) {
                    final tickerWithPrices = state.tickerWithPrices[index];
                    return ListTile(
                      leading: Text(
                          '${tickerWithPrices.ticker.baseCurrencySymbol}/${tickerWithPrices.ticker.currencySymbol}'), //'BTC/USD'
                      title: const Text('35656'),
                      trailing: Column(
                        children: const [Text('+4,5'), Text('+0,37')],
                      ),
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
