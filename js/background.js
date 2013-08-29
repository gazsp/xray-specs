var ColoursExtension;

ColoursExtension = (function() {

  ColoursExtension.name = 'ColoursExtension';

  ColoursExtension.active = false;

  function ColoursExtension() {
    console.log("Started background script");
    chrome.browserAction.onClicked.addListener(function(tab) {
      this.active = !this.active;
      console.log(this.active);
      return chrome.tabs.sendMessage(tab.id, {
        action: "actionClicked",
        state: this.active
      }, function(response) {});
    });
  }

  return ColoursExtension;

})();

new ColoursExtension;
