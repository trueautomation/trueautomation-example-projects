const ta = require('trueautomation-helper').ta;

describe('TrueAutomation.IO page WebdirverIO + TrueAutomation', () => {
  it('Test example', () => {
    browser.setTimeout({ 'implicit': 5000 });

    browser.url('https://trueautomation.io');
    $(ta('loginBtn', "//div[./span[text()='Login']]")).click();
    $(ta('signUpBtn', 'div.sign-up-container > a')).click();
    $(ta('emailFld', "[name='email']")).setValue('your@gmail.com');
  });
});
