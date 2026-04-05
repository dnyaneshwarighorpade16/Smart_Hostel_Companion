import 'package:flutter/material.dart';
import 'package:smart_hostel_app/app_colours.dart';
import 'package:smart_hostel_app/screens/dashboards/issue_service.dart';

class IssuesScreen extends StatefulWidget {
  const IssuesScreen({super.key});

  @override
  State<IssuesScreen> createState() => _IssuesScreenState();
}

class _IssuesScreenState extends State<IssuesScreen> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _roomController = TextEditingController();

  String selectedCategory = "Plumbing";
  bool isLoading = false;

  final IssueService _issueService = IssueService();

  void submitIssue() async {
    if (_titleController.text.isEmpty || _roomController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill required fields")),
      );
      return;
    }

    setState(() => isLoading = true);

    final result = await _issueService.submitIssue(
      title: _titleController.text,
      description: _descController.text,
      roomNo: _roomController.text,
      studentName: "JD", // 🔥 later dynamic
      hostelType: "boys", // 🔥 later dynamic
    );

    setState(() => isLoading = false);

    if (result == "success") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Issue Submitted")),
      );

      _titleController.clear();
      _descController.clear();
      _roomController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result)),
      );
    }
  }

  Widget categoryButton(String title, IconData icon) {
    bool isSelected = selectedCategory == title;

    return GestureDetector(
      onTap: () => setState(() => selectedCategory = title),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.black),
            const SizedBox(height: 6),
            Text(title,
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black)),
          ],
        ),
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "resolved":
        return Colors.green;
      case "in_progress":
        return Colors.blue;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔹 TITLE
              const Text("Report an Issue",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

              const SizedBox(height: 20),

              const SizedBox(height: 20),

              // 🔹 FORM
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: "Issue Title",
                ),
              ),

              const SizedBox(height: 12),

              const SizedBox(height: 12),

              TextField(
                controller: _descController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: "Description",
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 SUBMIT BUTTON
              ElevatedButton(
                onPressed: isLoading ? null : submitIssue,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Submit Report"),
              ),

              const SizedBox(height: 30),

              // 🔥 REAL-TIME ISSUES LIST
              const Text(
                "Recent Reports",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              StreamBuilder(
                stream: _issueService.getIssues(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }

                  final issues = snapshot.data!.docs;

                  if (issues.isEmpty) {
                    return const Text("No issues reported yet");
                  }

                  return Column(
                    children: issues.map((doc) {
                      final data = doc.data() as Map<String, dynamic>;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['title'] ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              data['roomNo'] ?? '',
                              style:
                                  const TextStyle(color: Colors.grey),
                            ),

                            const SizedBox(height: 6),

                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: getStatusColor(
                                            data['status'])
                                        .withOpacity(0.1),
                                    borderRadius:
                                        BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    data['status'],
                                    style: TextStyle(
                                      color: getStatusColor(
                                          data['status']),
                                    ),
                                  ),
                                ),
                                Text(
                                  data['studentName'] ?? '',
                                  style: const TextStyle(
                                      fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}