{
  description = "AlexanderCurl's Dotfiles";

  outputs = { self }: let
    # Read the contents of the .config directory inside your GitHub repository
    configDir = builtins.readDir "${self}/.config";

    # Automatically iterate through every folder/file in that directory
    # and map it to Home Manager's xdg.configFile attribute set.
    mappedConfigs = builtins.listToAttrs (map (name: {
      name = name;
      value = { source = "${self}/.config/${name}"; };
    }) (builtins.attrNames configDir));

  in {
    homeManagerModules.default = { config, lib, pkgs, ... }: {
      
      # Apply the automatically generated mappings
      xdg.configFile = mappedConfigs;
      
    };
  };
}
