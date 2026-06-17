import os
import glob

def get_plugins():
    plugins = []
    for f in glob.glob('/home/runner/work/nvim/nvim/lua/plugins/*.lua'):
        plugins.append(f)
    return plugins

def get_core():
    core = []
    for f in glob.glob('/home/runner/work/nvim/nvim/lua/core/*.lua'):
        core.append(f)
    return core

def get_keys():
    keys = []
    for f in glob.glob('/home/runner/work/nvim/nvim/lua/core/key/*.lua'):
        keys.append(f)
    return keys

print("Plugins:", len(get_plugins()))
print("Core:", len(get_core()))
print("Keys:", len(get_keys()))
