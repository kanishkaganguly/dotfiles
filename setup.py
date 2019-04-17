import argparse
import os
import sys

parser = argparse.ArgumentParser()
parser.add_argument("--setup_all", action="store_true", help="Setup config files for zsh, oh-my-zsh, tmux and nvim")
parser.add_argument("--setup_zsh", action="store_true", help="Setup config files for zsh")
parser.add_argument("--setup_tmux", action="store_true", help="Setup config files for tmux")
parser.add_argument("--setup_nvim", action="store_true", help="Setup config files for nvim")
args = parser.parse_args()

user = os.environ.get("USER")
path_zsh = "/home/{}/.zshrc".format(user)
path_tmux = "/home/{}/.tmux.conf".format(user)
path_nvim = "/home/{}/.config/nvim".format(user)

def get_path():
    return os.path.dirname(os.path.realpath(sys.argv[0]))

def setup_symlink(src, dst):
    os.symlink(src,dst)
    print("Symlink created")
    return

def main():
    if args.setup_all:
        # Setup nvim
        if os.path.islink(path_nvim):
            print("nvim already set up")
        else:
            setup_symlink(get_path()+"/nvim",path_nvim)
        
        # Setup tmux
        if os.path.islink(path_tmux):
            print("tmux already set up")
        else:
            setup_symlink(get_path()+"/tmux/.tmux.conf",path_tmux)
        
        # Setup zsh
        if os.path.islink(path_zsh):
            print("zsh already set up")
        else:
            setup_symlink(get_path()+"/zsh/.zshrc",path_zsh)

        print("All setup completed")
    
    if args is None:
        print("Please select something to set up")

    return

if __name__ == '__main__':
    main()
