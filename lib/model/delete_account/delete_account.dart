enum DeleteAccountReasons {
  iHaveAnotherAccount('I have another account'),
  iWantToCreateANewAccount('I want to create a new account'),
  iDoNotUseThisAccountAnymore('I do not use this account anymore'),
  iGetTooManyForgotPasswordEmails('I get too many forgot password emails'),
  securityConcerns('Security Concerns'),
  privacyConcerns('Privacy Concerns'),
  noneOfTheAbove('None of the above');

  const DeleteAccountReasons(this.value);
  final String value;
}
