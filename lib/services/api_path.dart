class APIPath {
  static String userdata({String? uid}) => 'users/$uid';
  static String userdatas({String? uid}) => 'users/$uid';
  static String collagedata({String? id}) => 'Engineering Courses/$id';
  static String collages() => 'Engineering Courses';
  static String transaction(String uid, String txnId) =>'users/$uid/transaction/$txnId';
  static String transactions(String uid) => 'users/$uid/transaction';
}
