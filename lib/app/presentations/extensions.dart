extension ASSETS on String {
  String toPNG() {
    return 'assets/images/png/$this.png';
  }

  String toSVG() {
    return 'assets/images/svg/$this.svg';
  }
}
