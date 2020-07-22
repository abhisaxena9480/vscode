global class SomeFutureClass {
  @future
  public static void someFutureMethod() {
    List<Account> accounts = [Select Id, Name from Account];
      System.debug('dekho:'+accounts);
    // process account records to do awesome stuff
  }
}