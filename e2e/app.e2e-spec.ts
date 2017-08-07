import { Brianwilgus.ComPage } from './app.po';

describe('brianwilgus.com App', () => {
  let page: Brianwilgus.ComPage;

  beforeEach(() => {
    page = new Brianwilgus.ComPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
