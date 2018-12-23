# Open Croquet for Squeak 5.x

Original Open Croquet running on the latest versions of Squeak 5.x

## Install
This repository is using [Squot](https://github.com/hpi-swa/Squot) for Git connectivity.

For Squeak 5.2 (and newer) do the following:

1. Install **Squot**

``` Installer installGitInfrastructure. ```

2. Load **Open Croquet** (with FFI, OpenGL and Croquet)

```
Metacello new
  baseline: 'Croquet';
  repository: 'github://nikolaysuslov/croquet-squeak';
 load.
 ```
 
 3. **[Download](https://www.krestianstvo.org/sdk/croquet/Content.zip)** Models/Textures content and place it to Contents/Resources Squeak folder

---

(Based on Monticello packages from https://sdk.krestianstvo.org/sdk/croquet.html)
