# BPHC-Network-Autologin

Automatically login to the BPHC network instead of manually logging in every time you connect to the network.

## Requirements:

- Python 3.9 or higher

## Usage:

1. Clone the repository

```
git clone https://github.com/Chaitanya-Keyal/BPHC-Network-Autologin.git
```

2. Install the required packages:

```
pip install -r requirements.txt
```

3. Open `script.pyw` in a text editor and replace `username` and `password` with your BPHC Network username and password
4. Options to run the script:
   - To login just once:
     ```
     python script.pyw
     ```
   - Windows:
     - Run the script using Task Scheduler to login everytime you connect to the network:
       1. Run `create_task.bat` as administrator.
       2. Input the path of the script(`script.pyw`) and the xml file(`task.xml`) when prompted.
     - Create a shortcut to the script and place it in the `startup` folder (`shell:startup`) to automatically login on startup
   - Linux:
     - Create a shortcut to the script and place it in the `startup` folder (`~/.config/autostart`) to automatically login on startup
