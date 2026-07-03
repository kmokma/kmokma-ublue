# kmokma-ublue&nbsp; [![bluebuild build badge](https://github.com/kmokma/kmokma-ublue/actions/workflows/build.yml/badge.svg)](https://github.com/kmokma/kmokma-ublue/actions/workflows/build.yml)

See the [BlueBuild docs](https://blue-build.org/how-to/setup/) for quick setup instructions for setting up your own repository based on this template.

After setup, it is recommended you update this README to describe your custom image.

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  NVIDIA:
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/kmokma/kmokma-bazzite-nvidia-open:latest
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/kmokma/kmokma-bazzite-gnome-nvidia-open:latest
  AMD:
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/kmokma/kmokma-bazzite-amd:latest
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/kmokma/kmokma-bazzite-gnome-amd:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  NVIDIA:
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/kmokma/kmokma-bazzite-nvidia-open:latest
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/kmokma/kmokma-bazzite-gnome-nvidia-open:latest
  AMD:
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/kmokma/kmokma-bazzite-amd:latest
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/kmokma/kmokma-bazzite-gnome-amd:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe`, so you won't get accidentally updated to the next major version.

## ISO

If build on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/how-to/generate-iso/#_top). These ISOs cannot unfortunately be distributed on GitHub for free due to large sizes, so for public projects something else has to be used for hosting.

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
NVIDIA:
cosign verify --key cosign.pub ghcr.io/kmokma/kmokma-ublue
AMD:
cosign verify --key cosign.pub ghcr.io/kmokma/kmokma-ublue
```
