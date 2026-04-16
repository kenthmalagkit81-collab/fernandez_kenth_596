import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/student_model.dart';

class StudentController {
  final supabase = Supabase.instance.client;

  Future<List<Student>> getStudents() async {
    final data = await supabase.from('students').select();
    return data.map((item) => Student.fromMap(item)).toList();
  }

  Future<void> addStudent(Student student) async {
    await supabase.from('students').insert(student.toMap());
  }

  Future<void> deleteStudent(int id) async {
    await supabase.from('students').delete().eq('id', id);
  }

  // TO DO: Filter students by name (case-insensitive search) c
  // If query is empty, return all students
  // Hint: Use .where() and .contains()
  List<Student> searchStudents(List<Student> students, String query) {
    if (query.isEmpty) return students;
    return students
        .where(
          (student) => student.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  // TO DO: Calculate the class average c
  // Sum all student averages and divide by total students
  // Return 0 if list is empty
  double getClassAverage(List<Student> students) {
    double classAverage = 0;
    if (students.isEmpty) return 0;
    for (var student in students) {
      classAverage += student.average;
    }
    return classAverage / students.length;
  }

  // Count students who passed
  int countPassed(List<Student> students) {
    int count = 0;
    for (var student in students) {
      if (student.status == 'Passed') count++;
    }
    return count;
  }

  // TO DO: Count students who failed c
  // Similar to countPassed but check for 'Failed' status
  int countFailed(List<Student> students) {
    int count = 0;
    for (var student in students) {
      if (student.status == 'Failed') count++;
    }
    return count;
  }
}
