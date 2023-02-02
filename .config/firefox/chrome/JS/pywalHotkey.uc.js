const pywalUtils = {
    updateSheet(win, _key) {
        if (win !== window) return;
        if (this.sss.sheetRegistered(this.ssUri, this.sss.USER_SHEET))
            this.sss.unregisterSheet(this.ssUri, this.sss.USER_SHEET);
        this.sss.loadAndRegisterSheet(this.ssUri, this.sss.USER_SHEET);
        console.log(
            this.sss.sheetRegistered(this.ssUri, this.sss.USER_SHEET)
                ? "stylesheet registered"
                : "stylesheet not registered"
        );
    },

    init() {
        console.log("script loaded, initializing");
        this.sss = Cc["@mozilla.org/content/style-sheet-service;1"].getService(
            Ci.nsIStyleSheetService
        );
        var io = Cc["@mozilla.org/network/io-service;1"].getService(Ci.nsIIOService);
        var ds = Cc["@mozilla.org/file/directory_service;1"].getService(Ci.nsIProperties);
          
        // Get the chrome directory in the current profile
        var chromepath = ds.get("UChrm", Ci.nsIFile);

        // Specific file: userChrome.css or userContent.css
        chromepath.append("userChrome.css");

        // Morph to a file URI 
        this.ssUri = io.newFileURI(chromepath);
        this.key = document.getElementById("bookmarkAllTabsKb");

        this.key.setAttribute("oncommand", "pywalUtils.updateSheet(window);");
        this.updateSheet(window);
    },
};

if (gBrowserInit.delayedStartupFinished) {
    pywalUtils.init();
} else {
    let delayedListener = (subject, topic) => {
        if (topic == "browser-delayed-startup-finished" && subject == window) {
            Services.obs.removeObserver(delayedListener, topic);
            pywalUtils.init();
        }
    };
    Services.obs.addObserver(delayedListener, "browser-delayed-startup-finished");
}

