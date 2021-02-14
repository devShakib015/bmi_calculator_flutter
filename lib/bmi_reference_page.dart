import 'package:flutter/material.dart';

class BmiReferenePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI References'),
      ),
      body: Center(
        child: DataTable(
          columns: [
            DataColumn(label: Text("BMI")),
            DataColumn(label: Text("Nutritional status")),
          ],
          rows: [
            DataRow(
              cells: [
                DataCell(
                  Text("Below 18.5"),
                ),
                DataCell(
                  Text("Underweight"),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text("18.5–24.9"),
                ),
                DataCell(
                  Text("Normal weight"),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text("25.0–29.9"),
                ),
                DataCell(
                  Text("Pre-obesity"),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text("30.0–34.9"),
                ),
                DataCell(
                  Text("Obesity class I"),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text("35.0–39.9"),
                ),
                DataCell(
                  Text("Obesity class II"),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text("Above 40"),
                ),
                DataCell(
                  Text("Obesity class III"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
