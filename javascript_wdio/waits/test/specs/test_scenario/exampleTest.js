const { ta } = require('trueautomation-helper');

describe('TrueAutomation.IO WebdirverIO example', () => {
  beforeEach(function() {
  });

  it('Test example (not run)', () => {
    browser.url('https://trueautomation.io');
    $(ta('homePage:loginBtn', "//a[.//span[text()='Login']]")).click();
    // $(ta('signinPage:signupBtn', 'div.sign-up-container > a')).click();
    // $(ta('signupPage:emailField', "[name='email']")).setValue('your@gmail.com');
  });

  it('Test example', () => {
    browser.url('https://trueautomation.io');
    $(ta('homePage:loginBtn', "//a[.//span[text()='Login']]")).click();
    // $(ta('signinPage:signupBtn', 'div.sign-up-container > a')).click();
    // $(ta('signupPage:emailField', "[name='email']")).setValue('your@gmail.com');
  });
});
