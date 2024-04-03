(final: prev: {
  systemd-wslfix = final.systemd.overrideAttrs ({patches, ...}: {
    patches =
      patches
      ++ [
        ./patches/systemd-wslfix.patch
      ];
  });
})
