class Transaction {
  int id;
  String amount;
  String transaction_date;
  int category_id;
  String category_name;
  String description;
  String created_at;


  Transaction({
    required this.id,
    required this.amount,
    required this.transaction_date,
    required this.category_id,
    required this.category_name,
    required this.description,
    required this.created_at
  });
  factory Transaction.fromJson(Map<String, dynamic> json){
    return Transaction(
        id: json['id'],
        amount: json['amount'],
        transaction_date: json['transaction_date'],
        category_id: json['category_id'],
        category_name: json['category_name'],
        description: json['description'],
        created_at: json['created_at'],

    );
  }
}