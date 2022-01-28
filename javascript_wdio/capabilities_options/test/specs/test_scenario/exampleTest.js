const ta = require('trueautomation-helper').ta;

describe('TrueAutomation.IO page WebdirverIO + TrueAutomation', () => {
  it('Test example', () => {
    browser.setTimeout({ 'implicit': 5000 });

    browser.url('https://trueautomation.io');
    const el1 = $('//div[./span[text()="Login"]]');

    // browser.url('https://trueautomation.io');
    const el2 = $('//div[./span[text()="Login"]]');
    const el3 = $("//a[contains(.,'Get A Trial')]");

    console.log(el1.getProperty('tagName'));
    console.log(el2.getProperty('innerHTML'));
    console.log(el3.getProperty('href'));
    // console.log(el2.isEqual(el1));
    // console.log(el3.isEqual(el1));


    // $(ta('loginBtn', "//div[./span[text()='Login']]")).click();
    // $(ta('signUpBtn', 'div.sign-up-container > a')).click();
    // $(ta('emailFld', "[name='email']")).setValue('your@gmail.com');
  });
});
