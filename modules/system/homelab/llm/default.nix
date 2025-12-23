{config, pkgs, lib, ...}:

{
	options = {
		selfhosting.llm.enable = lib.mkEnableOption "Enable LLMs";
	};
}
