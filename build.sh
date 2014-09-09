#! /bin/bash
export USE_CCACHE=1
dir=$(pwd)
continue=0
warning="\e[1;31m \
        [Warning] \
        \e[0;0m"

_echo(){
    if [ $log == 1 ]; then
        echo -e $@ | tee terminal.log
    else
        echo -e $@
    fi
}
_bashtrap() {
    _echo "\n \
            $warning \t \
            You can't stop this script right now!"
}
_make_sudo() {
    command=$1
    if [ "$(whoami)" != "root" ];then
        sudo $command
    else
        $command
    fi
    if [ $? -eq 0 ];then
        return 0
    else
        return 1
    fi
}
_d_repo_tool() {
    if [ ! -e repo_tool ]; then
        mkdir repo_tool
    fi
    curl https://storage.googleapis.com/git-repo-downloads/repo > repo_tool/repo
    if [ -f repo_tool/repo ]; then
        chmod a+x repo_tool/repo
        export PATH=${dir}/repo_tool:$PATH
        return 0
    else
        return 1
    fi
}
_require() {
    _echo "\n... Checking requirements ..."
    _echo -n "\tgit..."
    if [ -x "/usr/bin/git" ]; then
        _echo "ok"
        _echo -n "\trepo tool..."
        if [ -e repo_tool/repo ]; then
            _echo "ok"
        else
            _echo "no"
            _echo -n "\tDownloading..."
            _d_repo_tool
            if [ $? -eq 0 ]; then
                _echo "ok"
            else
                _echo "no"
                _echo -n "Would you like to install curl? [Y/n] (Root access needed)"
                read curl_install
                if [ "$curl_install" = "" ]; then
                    curl_install="Y"
                fi
                case "$curl_install" in
                    "[Yy]") _make_sudo "apt-get -y install curl"
                            if [ $? == 0 ]; then
                                _d_repo_tool
                                _echo "repo tool...ok"
                            fi
                            ;;
                    "[Nn]") 
                        _echo "$warning \
                                We can't get repo tool, so, please, install it yourself by executing \
                               \n\t \e[1;32m curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo \e[0;0m \
                               \n Or get more info on: http://source.android.com/ \
                               \n And rerun this script."
                        exit 1
                        ;;
                esac
            fi

        fi
    else
        _echo "no \n"
        _echo "$warning Please, install git and rerun this script."
        exit 1
    fi
}
_clear_dir() {
    rm -fr *.log .repo out
}
sync_repo() {
    _repo=$1
    _require
    if [ "$?" = "0" ]; then
        case $_repo in
            "aosp")
                _echo "AOSP rom was chosen. \
                    \tSyncing repos..."
                repo_tool/repo init -u https://github.com/TeamHackDroid/aosp_manifest -b aosp
                repo_tool/repo sync
                ;;
            "b2g")
                _echo "$warning B2G isn't currently fully supported. In next release there we will add this rom."
                exit 0
                ;;
        esac
    else
        _echo "$warning Something went wrong. Please, contact us on Github \
              page by adding new issue and enclose your console output. \n\t \
                \e[1;32m \
                https://github.com/TeamHackDroid/buildscript/issues \
                \e[0m"
        exit 1
    fi
}


#########################
#
#   greeting with colors :-D
#

log=0
_clear_dir
_echo "\t\e[0;31;46m \
        === Welcome to Team Hack Droid === \
        \e[0m \n\n \
        We will guide you through the process of building custom ROM for your phone.\n \
        Would you like to log the output? [Y/n]"
read log_
if [ "$log_" = "[Yy]" ] || [ "$log_" = "" ]; then
    log=1
    _echo "\r [Log] started $(date +'%T %D')"
fi

#########################
#
#   choosing PHONE section
#

	_echo "\n \
        Please, choose your phone by its codename:"
        
        select device in "ancora" "ancora_tmo" "s2ve" "s2vep"
        do
            break
        done

#########################
#
#   Check if repo is already synced
#   else choose rom for building and sync
#

if [ -f "build/envsetup.sh" ]; then
    _echo "Ok, now we will build the ROM for you. \n \
         Please, sit down and wait. It will take some time."
    repo=""
    sleep 3
    trap _bashtrap SIGKILL SIGTERM
    ./build/envsetup.sh
else
    _echo "\n \
    Which ROM would you like to build? \n \
    Choose from those below:"

    select repo in "aosp" "b2g"
    do
        break
    done
    _echo ""
    sync_repo $repo
    trap _bashtrap SIGKILL SIGTERM
    ./build/envsetup.sh
fi

#########################
#
#   Check if rom is aosp or b2g
#   as @sirmordred mentioned, aosp doesn't have brunch
#

case $repo in
    "aosp")
        make otapackage
        ;;
    "b2g")
        _echo "$warning This ROM isn't supported yet."
        brunch "$device"
        ;;
    *) 
        _echo "$warning Unsupported ROM. This means we aren't responsible for stability of building."
        brunch "$device"
        ;;
esac

exit 0