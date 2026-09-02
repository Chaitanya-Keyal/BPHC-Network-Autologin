# BPHC-Network-Autologin

Automatically login to the BPHC network instead of manually logging in every time you connect to the network.

## Usage

1. Clone the repository

    ```bash
    git clone https://github.com/Chaitanya-Keyal/BPHC-Network-Autologin.git
    ```

2. Follow platform specific instructions:

### Windows

1. Open [login.bat](login.bat) in a text editor and set your credentials in the `CRED_1` line (format: `username|password`). To try multiple accounts in order, add `CRED_2`, `CRED_3`, ... and update `CRED_COUNT`.

2. Run `create_task.bat` as administrator

3. Input the path of the xml file (`task.xml`) when prompted.

> The script will run automatically every time you log in to your device, and on every network change. Credentials are tried in order — if one fails, the next is used.

### MacOS/ Linux

1. Open [login.bash](login.bash) in a text editor and replace the credentials in the `CREDENTIALS` array with your own credentials. The format is `username|password`. You can add multiple credentials, and the script will try them in order.

2. Make the script executable:

    ```bash
    chmod +x login.bash
    ```

3. Add a cron job:

    ```bash
    crontab -e
    ```

    - Add the following lines:

        ```bash
        @reboot /path/to/your/login.bash
        0 */6 * * * /path/to/your/login.bash
        ```

> The script will run automatically every time your device boots up, and every 6 hours thereafter.
