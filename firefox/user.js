///  NATURAL SMOOTH SCROLLING V3 - AveYo, 2020-2021                     preset     [default]
user_pref("apz.allow_zooming",                                          true);//NSS   [true]
user_pref("apz.force_disable_desktop_zooming_scrollbars",              false);//NSS  [false]
user_pref("apz.paint_skipping.enabled",                                 true);//NSS   [true]
user_pref("apz.windows.use_direct_manipulation",                        true);//NSS   [true]
user_pref("dom.event.wheel-deltaMode-lines.always-disabled",            true);//NSS  [false]
user_pref("general.smoothScroll.currentVelocityWeighting",             "1.0");//NSS ["0.25"]
user_pref("general.smoothScroll.durationToIntervalRatio",               1000);//NSS    [200]
user_pref("general.smoothScroll.lines.durationMaxMS",                    100);//NSS    [150]
user_pref("general.smoothScroll.lines.durationMinMS",                      0);//NSS    [150]
user_pref("general.smoothScroll.mouseWheel.durationMaxMS",               100);//NSS    [200]
user_pref("general.smoothScroll.mouseWheel.durationMinMS",                 0);//NSS     [50]
user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS",   12);//NSS    [120]
user_pref("general.smoothScroll.msdPhysics.enabled",                    true);//NSS  [false]
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant",   175);//NSS   [1250]
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant",      1500);//NSS   [1000]
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS",           10);//NSS     [12]
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaRatio",     "1.1");//NSS    [1.3]
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant",     1000);//NSS   [2000]
user_pref("general.smoothScroll.other.durationMaxMS",                    100);//NSS    [150]
user_pref("general.smoothScroll.other.durationMinMS",                      0);//NSS    [150]
user_pref("general.smoothScroll.pages.durationMaxMS",                    100);//NSS    [150]
user_pref("general.smoothScroll.pages.durationMinMS",                      0);//NSS    [150]
user_pref("general.smoothScroll.pixels.durationMaxMS",                   100);//NSS    [150]
user_pref("general.smoothScroll.pixels.durationMinMS",                     0);//NSS    [150]
user_pref("general.smoothScroll.scrollbars.durationMaxMS",               100);//NSS    [150]
user_pref("general.smoothScroll.scrollbars.durationMinMS",                 0);//NSS    [150]
user_pref("general.smoothScroll.stopDecelerationWeighting",            "1.0");//NSS  ["0.4"]
user_pref("layers.async-pan-zoom.enabled",                              true);//NSS   [true]
user_pref("layout.css.scroll-behavior.spring-constant",                "250");//NSS    [250]
user_pref("mousewheel.acceleration.factor",                               10);//NSS     [10]
user_pref("mousewheel.acceleration.start",                                -1);//NSS     [-1]
user_pref("mousewheel.default.delta_multiplier_x",                       100);//NSS    [100]
user_pref("mousewheel.default.delta_multiplier_y",                       100);//NSS    [100]
user_pref("mousewheel.default.delta_multiplier_z",                       100);//NSS    [100]
user_pref("mousewheel.min_line_scroll_amount",                             0);//NSS      [5]
user_pref("mousewheel.system_scroll_override.enabled",                  true);//NSS   [true]
user_pref("mousewheel.system_scroll_override_on_root_content.enabled", false);//NSS   [true]
user_pref("mousewheel.system_scroll_override.horizontal.factor",         200);//NSS    [200]
user_pref("mousewheel.system_scroll_override.vertical.factor",           200);//NSS    [200]
user_pref("mousewheel.transaction.timeout",                             1500);//NSS   [1500]
user_pref("toolkit.scrollbox.horizontalScrollDistance",                    4);//NSS      [5]
user_pref("toolkit.scrollbox.verticalScrollDistance",                      3);//NSS      [3]
///  this preset will reset couple extra variables for consistency
///  copy into your firefox profile as user.js, add to existing one or edit via about:config

/// AveYo: uncomment if scroll too fast
//user_pref("mousewheel.system_scroll_override.enabled", false);            

/// AveYo: uncomment if you prefer even more smoothness than V3 
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant",   125);//NSS+  [1250]
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant",       500);//NSS+  [1000]

// AveYo: uncomment for something more sharper, then fiddle with these going lower for smoothness:
//user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant",  1250);
//user_pref("general.smoothScroll.msdPhysics.regularSpringConstant",      1000);

user_pref("browser.newtabpage.activity-stream.showSponsored", false);                      // o Sponsored content
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);              // o Sponsored Top Sites
user_pref("browser.search.suggest.enabled", true);                                         // o Search suggestions master toggle

user_pref("browser.taskbar.lists.enabled", false);                                         // o Windows jumplist recent
user_pref("browser.taskbar.lists.frequent.enabled", false);                                // o Windows jumplist frequent
user_pref("browser.taskbar.lists.tasks.enabled", false);                                   // o Windows jumplist tasks
user_pref("browser.toolbars.bookmarks.showOtherBookmarks", false);                         // o Other Bookmarks on toolbar - long awaited pref
//user_pref("browser.toolbars.bookmarks.visibility", "always");                            // / Show bookmarks toolbar: newtab / always / never
user_pref("browser.urlbar.clickSelectsAll", false);                                        // o Select all url on Click
user_pref("browser.urlbar.ctrlCanonizesURLs", false);                                      // x Ctrl+Enter opens new tab instead of lame canonize
user_pref("browser.urlbar.decodeURLsOnCopy", true);                                        // x Decode urlencoded link on copy
user_pref("browser.urlbar.doubleClickSelectsAll", true);                                   // x Select all url on doubleClick
user_pref("browser.urlbar.formatting.enabled", false);                                     // o Domain highlight that makes full url hard to read
//user_pref("browser.urlbar.switchTabs.adoptIntoActiveWindow", true);                      // / Search in active tabs pulls tab from all windows
user_pref("browser.urlbar.trimURLs", false);                                               // o Display all parts of the url in the urlbar
user_pref("browser.urlbar.update2.engineAliasRefresh", true);                              // x Enable Add button in Search engines options
user_pref("browser.xul.error_pages.expert_bad_cert", true);                                // x Display advanced info on Insecure Connection
user_pref("browser.zoom.siteSpecific", true);                                           // / Disable remembering zoom per site
//user_pref("dom.confirm_repost.testing.always_accept", true);                             // / Hide confirm dialog when reloading a POST request
user_pref("dom.disable_beforeunload", true);                                               // x Confirm you want to leave dialog on page close
