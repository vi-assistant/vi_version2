
class Actions {
  // Splash screen
  static const splash = [
    "LOGIN (nextMessage = Enter User ID)",
    "SIGNUP (nextMessage = Enter your name)",
  ];

  // Login screen
  static List<String> login(int pageIndex) {
    List<String> login = ["SIGNUP (nextMessage = Login or Signup)"];
    List<String> subPages = [
      "ENTER_USERID (nextMessage = Enter Password)",
      "ENTER_PASSWORD (nextMessage = Please Wait, nextAction = CHECK_DETAILS)",
    ];
    login.add(subPages[pageIndex]);
    pageIndex > 0 ? login.add("GO_BACK (Optional)") : login.add("NEXT_PAGE");
    return login;
  }

  // Signup Screen
  static List<String> signup(int pageIndex) {
    List<String> signin = ["LOGIN (nextMessage = Login or Signup)"];
    List<String> subPages = [
      "ENTER_USERNAME (nextMessage = Enter User ID)",
      "ENTER_USERID (nextMessage = Enter Department)",
      "ENTER_DEPARTMENT (nextMessage = Enter Password)",
      "ENTER_PASSWORD (nextMessage = Please Wait, nextAction = CHECK_DETAILS)",
    ];
    signin.add(subPages[pageIndex]);
    pageIndex > 0 ? signin.add("GO_BACK (Optional)") : signin.add("NEXT_PAGE");
    return signin;
  }

  // Reader Screen
  static List<String> reader(int pageIndex) {
    List<String> signin = ["LOGIN (nextMessage = Login or Signup)"];
    List<String> subPages = [
      "ENTER_USERNAME (nextMessage = Enter User ID)",
      "ENTER_USERID (nextMessage = Enter Department)",
      "ENTER_DEPARTMENT (nextMessage = Enter Phone Number)",
      "ENTER_PASSWORD (nextMessage = Confirm Password)",
      "CONFIRM_PASSWORD (nextMessage = Please Wait, nextAction = CHECK_DETAILS)",
    ];
    signin.add(subPages[pageIndex]);
    pageIndex > 0 ? signin.add("GO_BACK (Optional)") : signin.add("NEXT_PAGE");
    return signin;
  }
}
