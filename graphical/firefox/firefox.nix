{ pkgs, home-manager, config, ... }:
{
	programs.firefox = {
		enable = true;
		profiles.aeg = {
			userChrome = builtins.readFile ./firefox.css;
			userContent = builtins.readFile ./firefox.css;
			id = 0;
			settings = {
				"browser.aboutConfig.showWarning" = false;
				"extensions.pocket.enabled" = false;
				"extensions.InstallTriggerImpl.enabled" = true;
				"browser.theme.content-theme" = 2;
				"browser.tabs.closeWindowWithLastTab" = false;
				"browser.tabs.firefox-view" = false;
				"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
				"layers.acceleration.force-enabled" = true;
				"gfx.webrender.all" = true;
				"layout.css.backdrop-filter.enabled" = true;
				"svg.context-properties.content.enabled" = true;
				"browser.homepage_welcome_url" = "https://ahmetemregurdal.github.io/newtabpage/index.html";
				"browser.homepage_override_url" = "https://ahmetemregurdal.github.io/newtabpage/index.html";
				"startup.homepage_override_url" = "https://ahmetemregurdal.github.io/newtabpage/index.html";
				"startup.homepage_welcome_url" = "https://ahmetemregurdal.github.io/newtabpage/index.html";
				"browser.startup.homepage" = "https://ahmetemregurdal.github.io/newtabpage/index.html";
			};
			extensions = with pkgs.nur.repos.rycee.firefox-addons; [
				darkreader
				web-archives
				vimium
				ublock-origin
				torrent-control
				sponsorblock
				search-by-image
				notifier-for-github
				no-pdf-download
				greasemonkey
				github-file-icons
				fastforwardteam
				bitwarden
				sidebery
				clearurls
				decentraleyes
				disconnect
				don-t-fuck-with-paste
			];
			isDefault = true;
			name = "aeg";
			search = {
				force = true;
				default = "Brave";
				privateDefault = "Brave";
				engines = {
					"Nix Packages" = {
						urls = [{
							template = "https://search.nixos.org/packages";
							params = [
							{
								name = "type";
								value = "packages";
							}
							{
								name = "query";
								value = "{searchTerms}";
							}
							];
						}];
						icon =
							"${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
						definedAliases = [ "@np" ];
					};
					"NixOS Wiki" = {
						urls = [{
							template = "https://nixos.wiki/index.php?search={searchTerms}";
						}];
						iconUpdateURL = "https://nixos.wiki/favicon.png";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@nw" ];
					};
					"Wikipedia".metaData.alias = "@w";
					"Google".metaData.alias = "@g";
					"Brave" = {
						urls = [{
							template = "https://search.brave.com/search?q={searchTerms}";
						}];
						iconUpdateURL =
							"https://cdn.search.brave.com/serp/v2/_app/immutable/assets/brave-logo-dark.62301cdf.svg";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@b" ];
					};
					"Home Manager" = {
						urls = [{
							template =
								"https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";
						}];
						iconUpdateURL = "https://nixos.wiki/favicon.png";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@hm" ];
					};
					"Arch Wiki" = {
						urls = [{
							template = "https://wiki.archlinux.org/?search={searchTerms}";
						}];
						iconUpdateURL = "https://archlinux.org/static/logos/archlinux-logo-light-1200dpi.7ccd81fd52dc.png";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@aw" ];
					};
					"Gentoo Wiki" = {
						urls = [{
							template = "https://wiki.gentoo.org/?search={searchTerms}";
						}];
						iconUpdateURL = "https://www.gentoo.org/assets/img/logo/gentoo-signet.png";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@gw" ];
					};
					"Subreddit" = {
						urls = [{
							template = "https://reddit.com/r/{searchTerms}";
						}];
						iconUpdateURL = "https://www.redditinc.com/assets/images/site/reddit-logo.png";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@rr" ];
					};
					"Reddit User" = {
						urls = [{
							template = "https://reddit.com/u/{searchTerms}";
						}];
						iconUpdateURL = "https://www.redditinc.com/assets/images/site/reddit-logo.png";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@ru" ];
					};
					"The Pirate Bay" = {
						urls = [{
							template = "http://thepiratebay.org/?search={searchTerms}";
						}];
						iconUpdateURL = "https://torrindex.net/images/tpb.jpg";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@pb" ];
					};
					"Youtube" = {
						urls = [{
							template = "https://youtube.com/results?search_query={searchTerms}";
						}];
						iconUpdateURL = "https://www.gstatic.com/youtube/img/branding/youtubelogo/svg/youtubelogo.svg";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@yt" ];
					};
					"GitHub Repository" = {
						urls = [{
							template = "https://github.com/search?q={searchTerms}&type=repositories";
						}];
						iconUpdateURL = "https://github.githubassets.com/assets/GitHub-Mark-ea2971cee799.png";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@gh" ];
					};
					"PyPi" = {
						urls = [{
							template = "https://pypi.org/search/?q={searchTerms}";
						}];
						iconUpdateURL = "https://pypi.org/static/images/logo-small.2a411bc6.svg";
						updateInterval = 24 * 60 * 60 * 1000;
						definedAliases = [ "@py" ];
					};
				};
			};
		};
	};
}
