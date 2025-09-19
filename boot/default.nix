{
  lib,
  config,
  pkg,
  ...
}:

{
  boot.consoleLogLevel = 3;

  # tmpfs (a filesystem stored in RAM) settings for the NixOS boot process.
  # Clean tmpfs on system boot, useful for ensuring a clean state.
  # NOTE:  boot.tmp can not be nested, must stay as toplevel as they are part of the global system configuration
  # boot.tmp.cleanOnBoot = true;

  # Enable tmpfs for the specified directories.
  boot.tmp.useTmpfs = true;

  # NEW: set to auto to dynamically grow    OLD:Allocate 35% of RAM for tmpfs. You can adjust this percentage to your needs...
  # boot.tmp.tmpfsSize = "50%";
  boot.tmp.tmpfsSize = "35%";
}
