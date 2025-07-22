{ config, pkgs, ... }:

{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    # Optional: preload models, see https://ollama.com/library
    loadModels = [ "llama3.3:70b" ];
    # "deepseek-r1:1.5b"

  };
}
