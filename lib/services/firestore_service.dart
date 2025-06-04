import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/task_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _tasks => _db.collection('tasks');

  Stream<List<Task>> streamTasks(DateTime date) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return const Stream.empty();
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return _tasks
        .where('userId', isEqualTo: user.uid)
        .where('date', isGreaterThanOrEqualTo: start.toIso8601String())
        .where('date', isLessThan: end.toIso8601String())
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Task.fromMap(doc.id, doc.data()))
            .toList())
        .map((list) {
      list.sort((a, b) {
        if (a.completed != b.completed) return a.completed ? 1 : -1;
        return a.name.compareTo(b.name);
      });
      return list;
    });
  }

  Future<void> addTask(String name, DateTime date) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    await _tasks.add({
      'name': name,
      'completed': false,
      'date': date.toIso8601String(),
      'userId': user.uid,
    });
  }

  Future<void> updateStatus(String id, bool completed) async {
    await _tasks.doc(id).update({'completed': completed});
  }

  Future<void> deleteTask(String id) async {
    await _tasks.doc(id).delete();
  }
}
