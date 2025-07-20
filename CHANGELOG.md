# Change Log (since version 0.17)

## 20250720 (2025-07-20)

* OS: **Ubuntu 24.04.2 LTS (Noble Numbat, noble-20250714)**
* Main software versions:
  - **Git v2.50.1**
  - **Vim v9.1.1566**
  - **GNU Nano 8.5**
* Improve Docker Scout health score:
  - Add non-root user
  - Add SBOM and Provenance options to build command and extract it into independent `buildx` script
  - Remove `gosu` and `software-properties-common`, compile `git` from source to avoid "Fixable critical or high vulnerabilities" compliance issues
* Add independent `test` script for image testing
* Extract shared arguments from `buildx` and `test` scripts into `.env` file as environment variables

## 20250713 (2025-07-13)

* OS: **Ubuntu 24.04.2 LTS (Noble Numbat, noble-20250619)**
* Main software versions:
  - **Vim v9.1.1538**
  - **GNU Nano 8.5**

## 20250511 (2025-05-11)

* OS: **Ubuntu 24.04.2 LTS (Noble Numbat, noble-20250415.1)**
* Main software versions:
  - **Vim 9.1.1381**
  - **GNU Nano 8.4**

## 20250315 (2025-03-15)

* Starting from this version, we use the build date as the version number.
* OS: **Ubuntu 24.04.2 LTS (Noble Numbat)**
* Main software versions:
  - **Vim 9.1.1202**
  - **GNU Nano 8.3**

## 3.8 (2025-02-06)

* OS: **Ubuntu 24.04 LTS (Noble Numbat)**
* Main software versions:
  - **Vim 9.1.1077**
  - **GNU Nano 8.3**

## 3.7 (2025-01-26)

* OS: **Ubuntu 24.04 LTS (Noble Numbat)**
* Main software versions:
  - **Vim 9.1.1054**
  - **GNU Nano 8.3**

## 3.6 (2025-01-02)

* OS: **Ubuntu 24.04 LTS**
* Main software versions:
  - **Vim 9.1.0983**
  - **GNU Nano 8.3**

## 3.5 (2024-11-09)

* OS: **Ubuntu 24.04 LTS**
* Main software versions:
  - **Vim 9.1.0847**
  - **GNU Nano 8.2**
* User `user` has been removed, leaving only the `root` user to consolidate the RUN commands into a single layer, simplifying the overall structure.
* Replaced all `;` connectors with `&&` to catch errors during the build process.

## 3.4 (2024-10-05)

* OS: **Ubuntu 24.04 LTS**
* Main software versions:
  - **Vim 9.1.0758**
  - **GNU Nano 8.2**

## 3.3 (2024-09-01)

* OS: **Ubuntu 24.04 LTS**
* Main software versions:
  - **Vim 9.1.0707**
  - **GNU Nano 8.1**

## 3.2 (2024-08-08)

* OS: **Ubuntu 24.04 LTS**
* Main software versions:
  - **Vim 9.1.0664**
  - **GNU Nano 8.1**

## 3.1 (2024-07-17)

* OS: **Ubuntu 24.04 LTS**
* Main software versions:
  - **Vim 9.1.0591**
  - **GNU Nano 8.1**

## 3.0 (2024-05-04)

* OS: **Ubuntu 24.04 LTS**
  - Great version number of the image jumps to **3** for upgrading from 22.04 LTS to **24.04 LTS**.
* Main software versions:
  - **Vim 9.1.0391**
  - **GNU Nano 8.0**

## 2.15 (2024-04-02)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.1.0252**
  - **GNU Nano 7.2**

## 2.14 (2024-02-01)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.1.0067**
  - **GNU Nano 7.2**

## 2.13 (2024-01-06)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.1.0015**
  - **GNU Nano 7.2**

## 2.12 (2023-12-09)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.2153**
  - **GNU Nano 7.2**

## 2.11 (2023-11-01)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.2081**
  - **GNU Nano 7.2**

## 2.10 (2023-10-02)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1968**
  - **GNU Nano 7.2**

## 2.9 (2023-09-12)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1897**
  - **GNU Nano 7.2**

## 2.8 (2023-08-03)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1677**
  - **GNU Nano 7.2**

## 2.7 (2023-07-01)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1671**
  - **GNU Nano 7.2**

## 2.6 (2023-06-01)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1595**
  - **GNU Nano 7.2**

## 2.5.2 (2023-05-11)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1539**
  - **GNU Nano 7.2**

## 2.5.1 (2023-05-10)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1536**
  - **GNU Nano 7.2**

## 2.5 (2023-05-01)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1503**
  - **GNU Nano 7.2**

## 2.4 (2023-04-01)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1433**
  - **GNU Nano 7.2**

## 2.3 (2023-02-16)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1313**
  - **GNU Nano 7.2**
* `docker buildx` is used to build multiarch images since this version.

## 2.2, 2.2-arm (2022-12-30)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1108**
  - **GNU Nano 7.1**

## 2.1, 2.1-arm (2022-12-07)

* OS: **Ubuntu 22.04 LTS**
* Main software versions:
  - **Vim 9.0.1025**
  - **GNU Nano 7.0**
* Comments in the Dockerfile are changed as output while building.

## 2.0, 2.0-arm (2022-10-29)

* OS: **Ubuntu 22.04 LTS**
  - Great version number of the image jumps to **2** for upgrading from **20.04 LTS**.
* Main software versions:
  - **Vim 9.0.749**
  - **GNU Nano 6.4**

## 1.2 (2022-03-22)

* **gpg-agent** is installed.

## 1.1, 1.1-arm (2022-02-19)

* Based on **Ubuntu 20.04 LTS**.
* Building environment is like **wujidadi/ap:2.3**.
* Image of `arm` architecture is also built since this version.
* Default passwords of `root` and `user` are changed just like **wujidadi/ap** version **1.4** and **2.2**.

## 1.0 (2021-08-07; 2022-01-20 little changes)

* Based on **Ubuntu 20.04 LTS**.
* Building environment is like **wujidadi/ap:2.1**.
