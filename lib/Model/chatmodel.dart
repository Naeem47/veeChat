class Message {
  final String sender;
  final String receiver;
  final String messege;
  final String timeStamp;

  Message({required this.sender, required this.receiver, required this.messege, required this.timeStamp});

  Map <String ,dynamic> toMap(){
   return {
    'senderid':sender,
    'receiverid':receiver,
    'messege' : messege,
    'timestamp' : timeStamp

   };
  }

}