import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  static const String routeName = 'chatscreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> _messages = [];

  void _sendMessage(String message) async {
    setState(() {
      _messages.add(message);
    });

    // Send message to backend
    var response = await http.post(
      Uri.parse('YOUR_BACKEND_API_URL'),
      body: jsonEncode({'message': message}),
      headers: {'Content-Type': 'application/json'},
    );

    // Handle response from backend
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        _messages.add(data['response']);
      });
    } else {
      // Handle error
      print('Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Bot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    String message = _controller.text.trim();
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                      _controller.clear();
                    }
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}