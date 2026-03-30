import 'package:flutter/material.dart';
import '../../core/constants/app_colours.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Fee Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.receipt_long, color: Colors.black),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔵 TOP CARD
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total Annual Fee",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "\$4,800.00",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Divider(color: Colors.white24),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Paid", style: TextStyle(color: Colors.white70)),
                          SizedBox(height: 5),
                          Text(
                            "\$2,400",
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Remaining", style: TextStyle(color: Colors.white70)),
                          SizedBox(height: 5),
                          Text(
                            "\$2,400",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 📊 PAYMENT PROGRESS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Payment Progress",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "50%",
                  style: TextStyle(color: AppColors.primary),
                )
              ],
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.5,
                minHeight: 8,
                backgroundColor: Colors.grey.shade300,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 25),

            // 💳 INSTALLMENTS TITLE
            const Text(
              "Installments",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            // INSTALLMENTS LIST
            _buildInstallment(
              title: "1st Installment",
              date: "Due: 10 Aug 2023",
              amount: "\$1,200",
              status: "Paid",
              isPaid: true,
            ),

            _buildInstallment(
              title: "2nd Installment",
              date: "Due: 10 Oct 2023",
              amount: "\$1,200",
              status: "Paid",
              isPaid: true,
            ),

            _buildInstallment(
              title: "3rd Installment",
              date: "Due: 10 Jan 2024",
              amount: "\$1,200",
              status: "Pending",
              isPaid: false,
            ),

            _buildInstallment(
              title: "4th Installment",
              date: "Due: 10 Mar 2024",
              amount: "\$1,200",
              status: "Upcoming",
              isPaid: false,
            ),

            const SizedBox(height: 25),

            // 🟡 INSTRUCTIONS
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.yellow.shade100,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.orange),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info, color: Colors.black),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Payment Instructions",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Fees should be paid at the reception in front of the warden. Ensure you collect your physical receipt after every transaction.",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 🔹 INSTALLMENT CARD
  Widget _buildInstallment({
    required String title,
    required String date,
    required String amount,
    required String status,
    required bool isPaid,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            spreadRadius: 2,
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor:
                isPaid ? Colors.green : Colors.grey.shade300,
            child: Icon(
              isPaid ? Icons.check : Icons.access_time,
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(date, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isPaid
                      ? Colors.green.shade100
                      : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: isPaid ? Colors.green : Colors.grey,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}