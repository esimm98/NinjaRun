# NinjaRun
A vertically-scrolling ninja themed game, where you jump from side to side to avoid enemies and obstacles

# Setup
Copy this in the console to start
```sh
    $ git clone https://github.com/esimm98/NinjaRun.git
```
This copies the repository into a folder where all the files are placed.
Now enter the folder by typing:
```sh
    $ cd NinjaRun
```
Make sure that gosu is downloaded:
```sh
	$ gem install gosu
```
And install FastImage, which was just used to get picture dimensions:
```sh
	$ gem install fastimage
```
Lastly, to run the game:
```sh
    $ ruby game.rb
```
### Instructions
Once you run the code, you will start immediately on the right wall.
You start with 3 lives and lose one if you run into anything
Press **Space** to jump to the other side and avoid the enemies && obstacles
You can pick up the shields to protect you from a single hit
Once you lose all your lives, press **Enter** to restart
