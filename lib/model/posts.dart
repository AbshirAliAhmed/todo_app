class Post{
   final  int userID;
   final int id;
   final String title;
   final String body;

   Post({required this.id,required this.userID, required this.title, required this.body});
   factory Post.FromJson(Map<String,dynamic> json){
     return Post(id: json['id'], userID: json['userId'], title: json['title'], body: json['body']);
   }

}