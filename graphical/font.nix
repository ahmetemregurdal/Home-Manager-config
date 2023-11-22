{ pkgs, home-manager, config, ... }:
{
	fonts.fontconfig.enable = true;
	home.packages = with pkgs; [
		(nerdfonts.override {
		 fonts = [
			 "FiraCode"
			 "3270"
			 "FiraMono"
			 "Agave"
			 "AnonymousPro"
			 "Arimo"
			 "IBMPlexMono"
			 "CascadiaCode"
			 "ComicShannsMono"
			 "Cousine"
			 "DaddyTimeMono"
			 "DejaVuSansMono"
			 "EnvyCodeR"
			 "FantasqueSansMono"
			 "Go-Mono"
			 "Gohu"
			 "Hack"
			 "Hasklig"
			 "Hermit"
			 "iA-Writer"
			 "Inconsolata"
			 "InconsolataGo"
			 "InconsolataLGC"
			 "IntelOneMono"
			 "Iosevka"
			 "IosevkaTerm"
			 "JetBrainsMono"
			 "Lekton"
			 "LiberationMono"
			 "Lilex"
			 "Meslo"
			 "Monoid"
			 "Mononoki"
			 "MPlus"
			 "Noto"
			 "OpenDyslexic"
			 "Overpass"
			 "ProFont"
			 "RobotoMono"
			 "SourceCodePro"
			 "ShareTechMono"
			 "SpaceMono"
			 "Terminus"
			 "Tinos"
			 "Ubuntu"
			 "UbuntuMono"
			 "VictorMono"
			 "AurulentSansMono"
			 "BigBlueTerminal"
			 "BitstreamVeraSansMono"
			 "CodeNewRoman"
			 "DroidSansMono"
			 "HeavyData"
			 "Monofur"
			 "ProggyClean"
		 ];
		})
		rPackages.fontawesome
		whatsapp-emoji-font
	];
}

