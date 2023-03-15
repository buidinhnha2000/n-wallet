enum AppFlavor {
  staging('http://10.10.23.33:3001/api/'),
  production('https://631eb73e58a1c0fe9f562cec.mockapi.io/');

  final String baseUrl;
  const AppFlavor(this.baseUrl);
}
