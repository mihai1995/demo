import 'dart:convert';
import 'dart:math';

import 'package:demo_app/app/data/package.dart';
import 'package:demo_app/app/data/transaction.dart';
import 'package:demo_app/app/services/sqllite.dart';
import 'package:get/get.dart';

const transactionsSqlite = 'transactionsSqlite';
const activePlanSqlite = 'currentPlanSqlite';

class HomeController extends GetxController {
  final SqlLite _sqLite = SqlLite.inst;
  RxList transactions = [].obs;
  Rx<TransactionModel> activePlan = TransactionModel(
    totalCoins: 0,
    coins: 0,
    currency: '\$',
    price: 0,
    state: 'unknown',
    expireDate: DateTime.now().millisecondsSinceEpoch,
    date: DateTime.now().millisecondsSinceEpoch,
    name: '---',
  ).obs;
  RxInt coins = 0.obs;

  @override
  void onInit() {
    _getActivePlan();
    _getTransactionsSql();
    super.onInit();
  }

  void _getActivePlan() async {
    // _sqLite.removeOption(activePlanSqlite); // easy TEST
    // _sqLite.removeOption(transactionsSqlite);// easy TEST
    String? sqliteActivePlan = await _sqLite.getOption(activePlanSqlite);
    if (sqliteActivePlan != null) {
      Map<String, dynamic> decodedSqliteActivePlan = json.decode(sqliteActivePlan);

      activePlan.value = TransactionModel.fromJson(decodedSqliteActivePlan);
      activePlan.value.coins--;

      if (activePlan.value.coins <= 0) {
        await buyExtra();
      } else {
        decodedSqliteActivePlan['coins'] = activePlan.value.coins;
        await _sqLite.saveOption(activePlanSqlite, json.encode(decodedSqliteActivePlan));
      }
    } else {
      await buyExtra();
    }
  }

  Future<void> _getTransactionsSql() async {
    String? sqliteTransactions = await _sqLite.getOption(transactionsSqlite);
    if (sqliteTransactions != null) {
      List sqliteTransactionsLocal = json.decode(sqliteTransactions);
      List<TransactionModel> modelTransactionsLocal = [];

      for (int i = 0; i < sqliteTransactionsLocal.length; i++) {
        modelTransactionsLocal.add(TransactionModel.fromJson(sqliteTransactionsLocal[i]));
      }

      transactions.value = modelTransactionsLocal;
    }
  }

  Future<void> buyExtra() async {
    await _getTransactionsSql();
    Random rng = Random();
    int localCoins = rng.nextInt(8);
    TransactionModel extra = TransactionModel(
      totalCoins: localCoins + 1,
      coins: localCoins + 1,
      state: 'Success',
      date: DateTime.now().millisecondsSinceEpoch,
      expireDate: DateTime.now().add(const Duration(days: 30)).millisecondsSinceEpoch,
      price: 0,
      name: 'EXTRA',
      currency: '\$',
    );
    activePlan.value = extra;
    transactions.insert(0, extra);
    coins.value = localCoins;

    await _sqLite.saveOption(transactionsSqlite, json.encode(transactions));
    await _sqLite.saveOption(activePlanSqlite, json.encode(activePlan));
  }

  void buyPlan(PackageModel plan) async {
    coins.value = plan.coins;
    activePlan.value = TransactionModel(
      totalCoins: plan.coins,
      coins: plan.coins,
      state: 'Success',
      date: DateTime.now().millisecondsSinceEpoch,
      expireDate: DateTime.now().add(const Duration(days: 30)).millisecondsSinceEpoch,
      price: plan.price,
      name: plan.name,
      currency: plan.currency,
    );
    transactions.insert(0, activePlan.value);

    List jsonTransactionsList = [];
    for (int i = 0; i < transactions.length; i++) {
      jsonTransactionsList.add(transactions[i].toJson());
    }

    await _sqLite.saveOption(transactionsSqlite, json.encode(jsonTransactionsList));
    await _sqLite.saveOption(activePlanSqlite, json.encode(activePlan.toJson()));
  }
}
