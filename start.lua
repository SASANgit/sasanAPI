sudos = dofile('config.lua')
os.execute('./tg -s ./Main.lua $@ --bot='..token)
