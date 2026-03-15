{
  lib,
  pkgs,
  ...
}: let
  lock-false = {
    Value = false;
    Status = "locked";
  };
  lock-true = {
    Value = true;
    Status = "locked";
  };
in {
  home-manager.sharedModules = [
    (_: {
      programs = {
        firefox = {
          enable = true;
          package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
            extraPolicies = {
              DisableTelemetry = true;
              DisablePocket = true;
              DisableFirefoxAccounts = false;
              DisableFeedbackCommands = true;
              DisableFirefoxStudies = true;
              OfferToSaveLogins = false;
              OffertosaveloginsDefault = false;
              PasswordManagerEnabled = false;
              EncryptedMediaExtensions.Enabled = true;
              OverrideFirstRunPage = "";
              OverridePostUpdatePage = "";
              EnableTrackingProtection = {
                Value = true;
                Cryptomining = true;
                Fingerprinting = true;
                EmailTracking = true;
              };
              UserMessaging = {
                ExtensionRecommendations = false;
                FeatureRecommendations = false;
                MoreFromMozilla = false;
                SkipOnboarding = true;
                WhatsNew = false;
              };
              # SanitizeOnShutdown = {
              #   Cache = true;
              #   Cookies = false;
              #   Downloads = true;
              #   FormData = true;
              #   History = false;
              #   Sessions = false;
              #   SiteSettings = false;
              #   OfflineApps = true;
              #   Locked = true;
              # };

              # "3rdparty".Extensions = {
              #   "addon@darkreader.org" = {
              #     enabled = true;
              #     automation = {
              #       enabled = true;
              #       behavior = "OnOff";
              #       mode = "system";
              #     };
              #     detectDarkTheme = true;
              #     enabledByDefault = true;
              #     changeBrowserTheme = false;
              #     enableForProtectedPages = true;
              #     fetchNews = false;
              #     previewNewDesign = true;
              #   };
              #   "uBlock0@raymondhill.net" = {
              #     advancedSettings = [
              #       [
              #         "userResourcesLocation"
              #         "https://raw.githubusercontent.com/pixeltris/TwitchAdSolutions/master/video-swap-new/video-swap-new-ublock-origin.js"
              #       ]
              #     ];
              #     adminSettings = {
              #       userFilters = lib.concatMapStrings (x: x + "\n") [
              #         "twitch.tv##+js(twitch-videoad)"
              #         "||1337x.vpnonly.site"
              #       ];
              #       userSettings = rec {
              #         uiTheme = "dark";
              #         uiAccentCustom = true;
              #         uiAccentCustom0 = "#CA9EE6";
              #         cloudStorageEnabled = lib.mkForce false; # Security liability?
              #         advancedUserEnabled = true;
              #         userFiltersTrusted = true;
              #         importedLists = [
              #           "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
              #           "https://gitflic.ru/project/magnolia1234/bypass-paywalls-clean-filters/blob/raw?file=bpc-paywall-filter.txt"
              #           "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/BrowseWebsitesWithoutLoggingIn.txt"
              #           "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs for uBo/clear_urls_uboified.txt"
              #           "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Dandelion Sprout's Anti-Malware List.txt"
              #           "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt"
              #           "https://raw.githubusercontent.com/OsborneLabs/Columbia/master/Columbia.txt"
              #           "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt?_=rawlist"
              #           "https://raw.githubusercontent.com/iam-py-test/my_filters_001/main/antimalware.txt"
              #           "https://raw.githubusercontent.com/liamengland1/miscfilters/master/antipaywall.txt"
              #           "https://raw.githubusercontent.com/yokoffing/filterlists/main/annoyance_list.txt"
              #           "https://raw.githubusercontent.com/yokoffing/filterlists/main/privacy_essentials.txt"
              #         ];
              #         externalLists = lib.concatStringsSep "\n" importedLists;
              #         popupPanelSections = 31;
              #       };
              #       selectedFilterLists = [
              #         "ublock-filters"
              #         "ublock-badware"
              #         "ublock-privacy"
              #         "ublock-quick-fixes"
              #         "ublock-unbreak"
              #         "easylist"
              #         "adguard-generic"
              #         "adguard-mobile"
              #         "easyprivacy"
              #         "adguard-spyware"
              #         "adguard-spyware-url"
              #         "block-lan"
              #         "urlhaus-1"
              #         "curben-phishing"
              #         "plowe-0"
              #         "dpollock-0"
              #         "fanboy-cookiemonster"
              #         "ublock-cookies-easylist"
              #         "adguard-cookies"
              #         "ublock-cookies-adguard"
              #         "fanboy-social"
              #         "adguard-social"
              #         "fanboy-thirdparty_social"
              #         "easylist-chat"
              #         "easylist-newsletters"
              #         "easylist-notifications"
              #         "easylist-annoyances"
              #         "adguard-mobile-app-banners"
              #         "adguard-other-annoyances"
              #         "adguard-popup-overlays"
              #         "adguard-widgets"
              #         "ublock-annoyances"
              #         "DEU-0"
              #         "FRA-0"
              #         "NLD-0"
              #         "RUS-0"
              #         "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/LegitimateURLShortener.txt"
              #         "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/BrowseWebsitesWithoutLoggingIn.txt"
              #         "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Dandelion Sprout's Anti-Malware List.txt"
              #         "https://raw.githubusercontent.com/yokoffing/filterlists/main/privacy_essentials.txt"
              #         "https://raw.githubusercontent.com/yokoffing/filterlists/main/annoyance_list.txt"
              #         "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
              #         "https://raw.githubusercontent.com/liamengland1/miscfilters/master/antipaywall.txt"
              #         "https://gitflic.ru/project/magnolia1234/bypass-paywalls-clean-filters/blob/raw?file=bpc-paywall-filter.txt"
              #         "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/ClearURLs for uBo/clear_urls_uboified.txt"
              #         "https://raw.githubusercontent.com/iam-py-test/my_filters_001/main/antimalware.txt"
              #         "https://raw.githubusercontent.com/OsborneLabs/Columbia/master/Columbia.txt"
              #         "https://raw.githubusercontent.com/bogachenko/fuckfuckadblock/master/fuckfuckadblock.txt?_=rawlist"
              #         "user-filters"
              #       ];
              #     };
              #   };
              # };

              /*
              ---- PREFERENCES ----
              */
              # Set preferences shared by all profiles.
              Preferences = {
                # enable custom userchrome
                "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                "svg.context-properties.content.enabled" = true;
                "layout.css.color-mix.enabled" = true;
                "browser.tabs.delayHidingAudioPlayingIconMS" = 0;
                "layout.css.backdrop-filter.enabled" = true;
                "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;
                "privacy.userContext.enabled" = true;
                "privacy.userContext.ui.enabled" = true;
                "privacy.userContext.longPressBehavior" = 2;

                # Performance settings
                "gfx.webrender.all" = true; # Force enable GPU acceleration
                "media.ffmpeg.vaapi.enabled" = true;
                "widget.dmabuf.force-enabled" = true; # Required in recent Firefoxes
                "reader.parse-on-load.force-enabled" = true;
                "privacy.webrtc.legacyGlobalIndicator" = false;

                # Use cloudflare for better security/privacy
                "network.trr.mode" = 3; # 2 if your havng DNS problems
                "network.trr.custom_uri" = "https://cloudflare-dns.com/dns-query";
                "network.trr.uri" = "https://cloudflare-dns.com/dns-query";

                # Remove trackers
                "privacy.purge_trackers.enabled" = lock-true;
                "privacy.trackingprotection.enabled" = lock-true;
                "privacy.trackingprotection.fingerprinting.enabled" = lock-true;
                "privacy.resistFingerprinting" = lock-true;
                "privacy.trackingprotection.socialtracking.enabled" = lock-true;
                "privacy.trackingprotection.cryptomining.enabled" = lock-true;
                "privacy.globalprivacycontrol.enabled" = lock-true;
                "privacy.globalprivacycontrol.functionality.enabled" = lock-true;
                "privacy.donottrackheader.enabled" = lock-true;
                "privacy.donottrackheader.value" = 1;
                "privacy.query_stripping.enabled" = lock-true;
                "privacy.query_stripping.enabled.pbmode" = lock-true;

                # Clear on shutdown (Only locks the options to true. Manually enable in firefox settings)
                "privacy.sanitize.sanitizeOnShutdown" = lock-true;
                "privacy.clearOnShutdown.cache" = lock-true;
                # "privacy.clearOnShutdown.cookies" = lock-true;
                # "privacy.clearOnShutdown.downloads" = lock-true;
                # "privacy.clearOnShutdown.formdata" = lock-true;
                # "privacy.clearOnShutdown.history" = lock-true;
                # "privacy.clearOnShutdown.offlineApps" = lock-true;
                # "privacy.clearOnShutdown.sessions" = lock-true;
                # "privacy.clearOnShutdown.siteSettings" = lock-true;

                # Block more unwanted stuff
                "dom.block_multiple_popups" = lock-true;
                "browser.privatebrowsing.forceMediaMemoryCache" = lock-true;
                "browser.contentblocking.category" = {
                  Value = "strict";
                  Status = "locked";
                };
                "browser.search.suggest.enabled" = lock-false;
                "browser.search.suggest.enabled.private" = lock-false;
                "privacy.popups.disable_from_plugins" = 3;
                "extensions.pocket.enabled" = lock-false;
                "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
                "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
                "browser.newtabpage.activity-stream.feeds.topsites" = lock-false;
                "browser.newtabpage.activity-stream.showSponsored" = lock-false;
                "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
                "layout.word_select.eat_space_to_next_word" = lock-false;
                "browser.shell.checkDefaultBrowser" = lock-false;
                "signon.rememberSignons" = lock-false;
                "toolkit.telemetry.unified" = lock-false;
                "toolkit.telemetry.enabled" = lock-false;
                "toolkit.telemetry.server" = "data:,";
                "toolkit.telemetry.archive.enabled" = lock-false;
                "toolkit.telemetry.coverage.opt-out" = lock-true;
                "toolkit.coverage.opt-out" = lock-true;
                "toolkit.coverage.endpoint.base" = "";
                "experiments.supported" = lock-false;
                "experiments.enabled" = lock-false;
                "experiments.manifest.uri" = "";
                "browser.ping-centre.telemetry" = lock-false;
                "datareporting.healthreport.uploadEnabled" = lock-false;
                "datareporting.healthreport.service.enabled" = lock-false;
                "datareporting.policy.dataSubmissionEnabled" = lock-false;
                "breakpad.reportURL" = "";
                "browser.tabs.crashReporting.sendReport" = lock-false;
                "browser.crashReports.unsubmittedCheck.autoSubmit2" = lock-false;
                "browser.formfill.enable" = lock-false;
                "extensions.formautofill.addresses.enabled" = lock-false;
                "extensions.formautofill.available" = "off";
                "extensions.formautofill.creditCards.available" = lock-false;
                "extensions.formautofill.creditCards.enabled" = lock-false;
                "extensions.formautofill.heuristics.enabled" = lock-false;
                "app.normandy.enabled" = lock-false;
                "app.normandy.api_url" = "";
                "dom.webnotifications.enabled" = lock-false;
                "dom.webnotifications.serviceworker.enabled" = lock-false;

                # General settings
                "ui.key.accelKey" = 17; # Set CTRL as master key
                "browser.aboutConfig.showWarning" = lock-false;
                "browser.aboutwelcome.enabled" = lock-false;
                "browser.tabs.firefox-view" = lock-false;
                "browser.startup.homepage_override.mstone" = "ignore";
                "trailhead.firstrun.didSeeAboutWelcome" = true; # Disable welcome splash
                "browser.newtab.url" = "about:blank";
                "browser.newtabpage.activity-stream.enabled" = lock-false;
                "browser.newtabpage.activity-stream.telemetry" = lock-false;
                "browser.newtabpage.enhanced" = lock-false;
                "browser.newtabpage.introShown" = lock-true;
                "browser.newtabpage.pinned" = false;
                "browser.bookmarks.defaultLocation" = "toolbar";
                "browser.startup.page" = 3;
                "app.shield.optoutstudies.enabled" = lock-false;
                "dom.security.https_only_mode" = lock-true;
                "dom.security.https_only_mode_ever_enabled" = lock-true;
                "identity.fxaccounts.enabled" = lock-false;
                "app.update.auto" = false;
                "browser.startup.homepage" = "";
                "browser.bookmarks.restore_default_bookmarks" = false;
                "browser.ctrlTab.recentlyUsedOrder" = false;
                "browser.discovery.enabled" = false;
                "browser.laterrun.enabled" = false;
                "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
                "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
                "browser.newtabpage.activity-stream.feeds.snippets" = false;
                "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
                "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";
                "browser.protections_panel.infoMessage.seen" = true;
                "browser.ssb.enabled" = true;
                "browser.toolbars.bookmarks.visibility" = "newtab";
                #"browser.urlbar.placeholderName" = "Google";
                "browser.urlbar.suggest.openpage" = false;
                "datareporting.policy.dataSubmissionEnable" = false;
                "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;

                "extensions.screenshots.disabled" = lock-true;
                "extensions.getAddons.showPane" = lock-false;
                "extensions.htmlaboutaddons.recommendations.enabled" = lock-false;
                # "extensions.update.enabled" = false;
                "extensions.webcompat.enable_picture_in_picture_overrides" = true;
                "extensions.webcompat.enable_shims" = true;
                "extensions.webcompat.perform_injections" = true;
                "extensions.webcompat.perform_ua_overrides" = true;

                "extensions.autoDisableScopes" = {
                  Value = 0;
                  Status = "locked";
                };
                "extensions.enabledScopes" = {
                  Value = 15;
                  Status = "locked";
                };
                "extensions.allowPrivateBrowsingByDefault" = lock-true;
                "extensions.webextensions.restrictedDomains" = {
                  Value = "";
                  Status = "locked";
                };

                "browser.uiCustomization.state" = builtins.toJSON {
                  currentVersion = 23;
                  newElementCount = 7;
                  placements = {
                    widget-overflow-fixed-list = [];
                    unified-extensions-area = [];
                    nav-bar = [
                      "back-button"
                      "forward-button"
                      "stop-reload-button"
                      "urlbar-container"
                      "downloads-button"
                      "ublock0_raymondhill_net-browser-action"
                      "addon_darkreader_org-browser-action"
                      "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
                      "foxyproxy_eric_h_jung-browser-action"
                      "wappalyzer_crunchlabz_com-browser-action"
                      "unified-extensions-button"
                    ];
                    toolbar-menubar = ["menubar-items"];
                    TabsToolbar = [
                      "firefox-view-button"
                      "tabbrowser-tabs"
                      "new-tab-button"
                      "alltabs-button"
                    ];
                    vertical-tabs = [];
                    PersonalToolbar = ["personal-bookmarks" "managed-bookmarks"];
                  };
                  seen = [
                    "developer-button"
                    "save-to-pocket-button"
                    "ublock0_raymondhill_net-browser-action"
                    "addon_darkreader_org-browser-action"
                    "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
                    "foxyproxy_eric_h_jung-browser-action"
                    "wappalyzer_crunchlabz_com-browser-action"
                    "_c2ecdf60-7077-4bfa-b9c2-4892a8ded8c6_-browser-action"
                    "jid1-ZAdIEUB7XOzOJw_jetpack-browser-action"
                    "simple-tab-groups_drive4ik-browser-action"
                  ];
                  dirtyAreaCache = [
                    "nav-bar"
                    "PersonalToolbar"
                    "toolbar-menubar"
                    "TabsToolbar"
                    "unified-extensions-area"
                    "widget-overflow-fixed-list"
                    "vertical-tabs"
                  ];
                };

                # Do not tell what plugins we have enabled: https://mail.mozilla.org/pipermail/firefox-dev/2013-November/001186.html
                "plugins.enumerable_names" = "";
                "plugin.state.flash" = 0;
                "browser.search.update" = false;
                "extensions.getAddons.cache.enabled" = lock-false;
                "extensions.ui.sitepermission.hidden" = lock-true;
                "extensions.ui.locale.hidden" = lock-true;

              };
            };
          };

          profiles.default = {
            id = 0;
            name = "default";
            isDefault = true;
            path = "default";
            settings = {
              "browser.startup.homepage" = "about:home";
              "browser.newtabpage.enabled" = true;
              "browser.toolbars.bookmarks.visibility" = "always";
              "browser.uidensity" = 1;
              "browser.compactmode.show" = true;
              "sidebar.revamp" = false;
              "browser.tabs.tabmanager.enabled" = false;
              "browser.tabs.closeWindowWithLastTab" = false;
              "browser.urlbar.trimURLs" = false;
              "browser.urlbar.suggest.quickactions" = false;
              "browser.urlbar.showSearchSuggestionsFirst" = false;
              "extensions.activeThemeID" = "default-theme@mozilla.org";
              "layout.css.prefers-color-scheme.content-override" = 2;
            };
            userChrome = ''
              :root {
                --fx-bg: #11111b;
                --fx-surface: rgba(30, 30, 46, 0.86);
                --fx-surface-2: rgba(49, 50, 68, 0.82);
                --fx-border: rgba(180, 190, 254, 0.18);
                --fx-text: #cdd6f4;
                --fx-subtle: #a6adc8;
                --fx-accent: #89b4fa;
                --fx-accent-2: #cba6f7;
                --fx-glow: rgba(137, 180, 250, 0.16);
                --toolbar-bgcolor: transparent !important;
                --toolbar-field-background-color: transparent !important;
                --toolbar-field-focus-background-color: transparent !important;
                --lwt-accent-color: var(--fx-bg) !important;
                --lwt-text-color: var(--fx-text) !important;
                --arrowpanel-background: #1e1e2e !important;
                --arrowpanel-color: var(--fx-text) !important;
                --arrowpanel-border-color: var(--fx-border) !important;
                --tab-border-radius: 16px !important;
              }

              #main-window {
                background: linear-gradient(180deg, #0b1020 0%, #11111b 100%) !important;
              }

              #navigator-toolbox {
                background: transparent !important;
                border: none !important;
                padding: 10px 14px 0 !important;
              }

              #nav-bar,
              #PersonalToolbar,
              #TabsToolbar {
                background: var(--fx-surface) !important;
                border: 1px solid var(--fx-border) !important;
                border-radius: 20px !important;
                box-shadow:
                  0 18px 40px rgba(0, 0, 0, 0.30),
                  inset 0 1px 0 rgba(255, 255, 255, 0.04) !important;
                margin-bottom: 10px !important;
              }

              #nav-bar {
                padding: 8px 10px !important;
              }

              #TabsToolbar {
                padding: 6px 8px !important;
              }

              .tab-background {
                border-radius: 14px !important;
                margin-block: 4px !important;
                transition: background-color 120ms ease, box-shadow 120ms ease !important;
              }

              .tabbrowser-tab:hover .tab-background {
                background: rgba(69, 71, 90, 0.72) !important;
              }

              .tabbrowser-tab[selected] .tab-background {
                background: linear-gradient(135deg, rgba(137, 180, 250, 0.20), rgba(203, 166, 247, 0.18)) !important;
                box-shadow: 0 0 0 1px rgba(137, 180, 250, 0.22) inset !important;
              }

              .tab-label,
              #PersonalToolbar .toolbarbutton-text {
                color: var(--fx-text) !important;
              }

              #urlbar,
              #searchbar {
                background: rgba(17, 17, 27, 0.66) !important;
                border: 1px solid transparent !important;
                border-radius: 16px !important;
                min-height: 42px !important;
                box-shadow: none !important;
              }

              #urlbar:hover,
              #searchbar:hover {
                background: rgba(24, 24, 37, 0.90) !important;
              }

              #urlbar[open],
              #urlbar:focus-within,
              #searchbar:focus-within {
                background: rgba(17, 17, 27, 0.96) !important;
                border-color: rgba(137, 180, 250, 0.50) !important;
                box-shadow: 0 0 0 4px var(--fx-glow) !important;
              }

              #urlbar-background {
                border: none !important;
                background: transparent !important;
              }

              #urlbar-input::placeholder {
                color: var(--fx-subtle) !important;
              }

              #urlbar-input,
              #searchbar .searchbar-textbox,
              #searchbar input {
                color: var(--fx-text) !important;
                caret-color: var(--fx-accent) !important;
              }

              #urlbar-input::selection,
              #searchbar .searchbar-textbox::selection,
              #searchbar input::selection {
                background: rgba(137, 180, 250, 0.34) !important;
                color: #f5f7ff !important;
              }

              .urlbar-input-box {
                color: var(--fx-text) !important;
              }

              #urlbar[open] #urlbar-input,
              #urlbar:focus-within #urlbar-input {
                color: #f5f7ff !important;
              }

              toolbarbutton,
              .toolbarbutton-1 {
                border-radius: 14px !important;
                transition: background-color 120ms ease, transform 120ms ease !important;
              }

              toolbarbutton:hover,
              .toolbarbutton-1:hover {
                background: rgba(69, 71, 90, 0.70) !important;
              }

              toolbarbutton[open],
              .toolbarbutton-1[open] {
                background: rgba(137, 180, 250, 0.18) !important;
              }

              #urlbar-results {
                background: rgba(30, 30, 46, 0.98) !important;
                border: 1px solid var(--fx-border) !important;
                border-radius: 18px !important;
                overflow: hidden !important;
              }

              .urlbarView-row[selected] {
                background: linear-gradient(90deg, rgba(137, 180, 250, 0.18), rgba(203, 166, 247, 0.14)) !important;
                color: var(--fx-text) !important;
              }

              .urlbarView-title,
              .urlbarView-url,
              .search-one-offs button {
                color: var(--fx-text) !important;
              }

              #sidebar-box,
              #sidebar-header {
                background: rgba(17, 17, 27, 0.92) !important;
                color: var(--fx-text) !important;
                border-color: var(--fx-border) !important;
              }

              #tabbrowser-tabbox,
              #appcontent,
              browser[type="content-primary"],
              #browser {
                background: #0b1020 !important;
              }
            '';
            userContent = ''
              @-moz-document url("about:newtab"), url("about:home") {
                body {
                  background:
                    radial-gradient(circle at top, rgba(137, 180, 250, 0.14), transparent 38%),
                    radial-gradient(circle at 80% 20%, rgba(203, 166, 247, 0.12), transparent 26%),
                    #11111b !important;
                }

                .search-handoff-button,
                .top-site-outer .tile,
                .card,
                .personalize-button {
                  border-radius: 20px !important;
                  border: 1px solid rgba(180, 190, 254, 0.16) !important;
                  background: rgba(30, 30, 46, 0.78) !important;
                  box-shadow: 0 14px 32px rgba(0, 0, 0, 0.22) !important;
                }

                .logo,
                .wordmark,
                .top-site-outer .title,
                .search-inner-wrapper,
                .top-site-button .title {
                  color: #cdd6f4 !important;
                }
              }
            '';
          };

          /*
          ---- PROFILES ----
          */
          # Switch profiles via about:profiles page.
          # For options that are available in Home-Manager see
          # https://nix-community.github.io/home-manager/options.html#opt-programs.firefox.profiles
          # profiles = {
            # default = {
            #   # choose a profile name; directory is /home/<user>/.mozilla/firefox/profile_0
            #   id = 0; # 0 is the default profile; see also option "isDefault"
            #   name = "default"; # name as listed in about:profiles
            #   isDefault = true; # can be omitted; true if profile ID is 0
            #   extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            #     ublock-origin
            #     violentmonkey
            #     darkreader
            #     betterttv
            #     sponsorblock
            #     return-youtube-dislikes
            #   ];
            #   settings = {};
            #   bookmarks = [
            #     {
            #       name = "Bookmarks Toolbar";
            #       toolbar = true;
            #       bookmarks = [
            #         {
            #           name = "Youtube";
            #           url = "https://www.youtube.com";
            #         }
            #         {
            #           name = "Twitch";
            #           url = "https://www.twitch.tv";
            #         }
            #         {
            #           name = "Github";
            #           url = "https://github.com/";
            #         }
            #         {
            #           name = "NixOS pkgs";
            #           url = "https://search.nixos.org/packages";
            #         }
            #         {
            #           name = "NixOS Wiki";
            #           url = "https://nixos.wiki";
            #         }
            #         {
            #           name = "NixOS Configs";
            #           url = "https://nixos.wiki/wiki/Configuration_Collection";
            #         }
            #         {
            #           name = "Search Engines";
            #           bookmarks = [
            #             {
            #               name = "Startpage";
            #               url = "https://www.startpage.com/do/mypage.pl?prfe=358f0310b1c47c53e468bbed228d921438352de61d9ea4fcad92c335685a8e4de5118de1f91f06960587d38d76310c444d27766f935be9bb7dfa8fbc7f0b8207fbcd0a23600e2f957b79e6b3";
            #             }
            #             {
            #               name = "SearX";
            #               url = "https://searx.aicampground.com";
            #             }
            #           ];
            #         }
            #       ];
            #     }
            #   ];
            #   search = {
            #     force = true;
            #     default = "Google";
            #     privateDefault = "Startpage";
            #     order = [
            #       "Startpage"
            #       "Searx"
            #       "Brave"
            #       "NixOS Packages"
            #       "NixOS Options"
            #       "NixOS Wiki"
            #       "Home Manager Options"
            #       "Google"
            #     ];
            #     engines = {
            #       "Startpage" = {
            #         urls = [
            #           {
            #             template = "https://www.startpage.com/sp/search?query={searchTerms}&prfe=dea8b8a2e1126185da987128a196ee5c47cdf324dce146f96b3b9157ab1f9e7166ae05d134c935eccc20f54e46222c8f1bb60faece00557b02e7a4e1fe397bc0f6750fbd3f7f580b241188&abp=-1";
            #           }
            #         ];
            #         icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            #         definedAliases = ["@sp"];
            #       };
            #       "Brave" = {
            #         urls = [
            #           {
            #             template = "https://search.brave.com/search";
            #             params = [
            #               {
            #                 name = "q";
            #                 value = "{searchTerms}";
            #               }
            #             ];
            #           }
            #         ];
            #         definedAliases = ["@br"];
            #       };
            #       "Searx" = {
            #         urls = [{template = "https://searx.aicampground.com/?q={searchTerms}";}];
            #         iconUpdateURL = "https://nixos.wiki/favicon.png";
            #         updateInterval = 24 * 60 * 60 * 1000; # every day
            #         definedAliases = ["@sx"];
            #       };
            #       "NixOS Packages" = {
            #         urls = [
            #           {
            #             template = "https://search.nixos.org/packages";
            #             params = [
            #               {
            #                 name = "type";
            #                 value = "packages";
            #               }
            #               {
            #                 name = "query";
            #                 value = "{searchTerms}";
            #               }
            #             ];
            #           }
            #         ];
            #         icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            #         definedAliases = ["@np"];
            #       };
            #       "NixOS Options" = {
            #         urls = [
            #           {
            #             template = "https://search.nixos.org/options";
            #             params = [
            #               {
            #                 name = "type";
            #                 value = "packages";
            #               }
            #               {
            #                 name = "query";
            #                 value = "{searchTerms}";
            #               }
            #             ];
            #           }
            #         ];
            #         icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            #         definedAliases = ["@no"];
            #       };
            #       "NixOS Wiki" = {
            #         urls = [{template = "https://nixos.wiki/index.php?search={searchTerms}";}];
            #         iconUpdateURL = "https://nixos.wiki/favicon.png";
            #         updateInterval = 24 * 60 * 60 * 1000; # every day
            #         definedAliases = ["@nw"];
            #       };
            #       "Home Manager Options" = {
            #         urls = [{template = "https://home-manager-options.extranix.com/?query={searchTerms}";}];
            #         # urls = [
            #         #   {
            #         #     template = "https://mipmip.github.io/home-manager-option-search";
            #         #     params = [
            #         #       {
            #         #         name = "query";
            #         #         value = "{searchTerms}";
            #         #       }
            #         #     ];
            #         #   }
            #         # ];
            #         iconUpdateURL = "https://avatars.githubusercontent.com/u/33221035";
            #         updateInterval = 24 * 60 * 60 * 1000; # Update every day.
            #         definedAliases = ["@hm"];
            #       };
            #       "Bing".metaData.hidden = true;
            #       "Ebay".metaData.hidden = true;
            #       "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
            #     };
            #   };
            #   # userChrome = ''
            #   # '';
            #   # userContent = ''
            #   # '';
            # };
          # };
        };
      };
    })
  ];
}
