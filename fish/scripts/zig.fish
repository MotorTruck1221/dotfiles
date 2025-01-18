#!/bin/fish
# Handy little helper script to install zig properly and fast without doing much (aliased as zigging)

function listVersions
    echo $(curl -s https://api.github.com/repos/ziglang/zig/releases | jq [.[].tag_name] | jq '. + ["latest (git)"]' | jq .[])
end

function clean
    echo "Removing all build files"
    rm -rf ~/Downloads/llvm-project-19
    rm -rf ~/zig
    echo "Done!"
end

function installLLVM
    cd ~/Downloads
    git clone --depth 1 --branch release/19.x https://github.com/llvm/llvm-project llvm-project-19
    cd llvm-project-19
    git checkout release/19.x
    mkdir build-release
    cd build-release
    cmake ../llvm \
        -DCMAKE_INSTALL_PREFIX=$HOME/local/llvm19-assert \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_ENABLE_PROJECTS="lld;clang" \
        -DLLVM_ENABLE_LIBXML2=OFF \
        -DLLVM_ENABLE_TERMINFO=OFF \
        -DLLVM_ENABLE_LIBEDIT=OFF \
        -DLLVM_ENABLE_ASSERTIONS=ON \
        -DLLVM_PARALLEL_LINK_JOBS=1 \
        -G Ninja
    ninja install
    echo "LLVM Installed!"
    echo "Now, onto building Zig"
end

function getCertainVersion
    argparse 'c/clean' -- $argv
    echo "Installing latest version of LLVM..."
    installLLVM
    git clone https://github.com/ziglang/zig.git ~/zig
    cd ~/zig/ && mkdir build/ && cd build/ && cmake .. && make install && cd ~/
    echo "Zig Installed!"
    echo "TIP: to clean the build files pass --clean to zigging install OR run zigging clean"
    if set -ql _flag_c
        clean
    end
    return 0
end

function getLatest
    argparse 'c/clean' -- $argv
    echo "Installing latest version of LLVM..."
    installLLVM
    git clone https://github.com/ziglang/zig.git ~/zig
    cd ~/zig/ && mkdir build/ && cd build/ && cmake .. && make install && cd ~/
    echo "Zig Installed!"
    echo "TIP: to clean the build files pass --clean to zigging install OR run zigging clean"
    if set -ql _flag_c
        clean
    end
    return 0
end

function install
    argparse -i 'v/version' -- $argv 
    if set -ql _flag_v
        if test -z "$argv[2]"
            echo "Install: flag -v/--version requires an argument!"
            return 1
        end
        echo "Installing Zig version:" $argv[2]
        if contains "latest" $argv[2]
            getLatest $argv
        else
           getCertainVersion $argv 
        end
    else
        echo "Installing latest version of Zig from git..."
        getLatest
    end
end

function main
    argparse -i 'h/help' -- $argv
    or return
    if set -ql _flag_help
        if contains "install" $argv[1]
            echo "Example with version: zigging install -v 2.0.0"
            echo "Example with latest: zigging install"
            echo "or: zigging install -v latest"
            echo "Example to clean after build: ziggin install -v latest -c"
            return 0
        else if contains "list" $argv[1]
            echo "Example: zigging list"
            return 0
        else
            echo "zigging [-h|--help] - Display this prompt"
            echo "zigging [-h|--help] command - Display a help prompt for a certain command"
            echo "zigging install [-v|--version, -c|--clean] - Install either the latest version of zig OR a specific version"
            echo "zigging list - List all versions available to install"
            return 0
        end
    end 
    if contains "install" $argv[1]
        install $argv
    else if contains "list" $argv[1]
        echo "Versions available to install:"
        listVersions | jq
    else if contains "clean" $argv[1]
        clean
    end
end

main $argv
