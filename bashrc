alias cm="chmod -R a+rw"
alias pp='[ ${PIPESTATUS[0]} == 0 ]'
alias hg='history | grep'

alias bd='rm dist -rf && python setup.py bdist_wheel |& tee build.log && pp && pip install dist/*whl --force-reinstall'

alias drun_amd='docker run -it --privileged=true --network=host -v $HOME:/host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --shm-size=16G --ulimit memlock=-1 --ulimit stack=67108864'
alias drun_nv='docker run -it --privileged=true --network host -v $HOME:/host --gpus all --shm-size=4G'

export HF_ENDPOINT=https://hf-mirror.com

ps1() {
  export PS1="$1) $PS1"
}

left() {
  awk -F' ' "{print \$$1}" "$2"
}

ev() {
  [[ ":${!1}:" == *":${2}:"* ]] || export "${1}=${2}:${!1}"
}

ev PATH $HOME/.rust/usr/local/bin

if [ -f /.dockerenv ]; then
  export PS1="in_docker) $PS1"
else
  export PS1="out_docker) $PS1"
fi
