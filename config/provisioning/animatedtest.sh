#!/bin/false

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/animated.sh
printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
function download() {
    wget -q --show-progress -e dotbytes="${3:-4M}" -O "$2" "$1"
}

## Set paths
nodes_dir=/opt/ComfyUI/custom_nodes
models_dir=/opt/ComfyUI/models
checkpoints_dir=${models_dir}/checkpoints
vae_dir=${models_dir}/vae
controlnet_dir=${models_dir}/controlnet
loras_dir=${models_dir}/loras
upscale_dir=${models_dir}/upscale_models

### Install custom nodes

# ComfyUI-Manager
this_node_dir=${nodes_dir}/ComfyUI-Manager
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/ltdrdata/ComfyUI-Manager $this_node_dir
else
    (cd $this_node_dir && git pull)
fi

# ComfyUI-AnimateDiff-Evolved
this_node_dir=${nodes_dir}/ComfyUI-AnimateDiff-Evolved
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved $this_node_dir
else
    (cd $this_node_dir && git pull)
fi

animated_models_dir=${nodes_dir}/ComfyUI-AnimateDiff-Evolved/models

# ComfyUI-Advanced-ControlNet
this_node_dir=${nodes_dir}/ComfyUI-Advanced-ControlNet
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet $this_node_dir
else
    (cd $this_node_dir && git pull)
fi

this_node_dir=${nodes_dir}/ComfyUI-VideoHelperSuite
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite $this_node_dir
else
    (cd $this_node_dir && git pull)
fi

this_node_dir=${nodes_dir}/ComfyUI_Noise
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/BlenderNeko/ComfyUI_Noise $this_node_dir
else
    (cd $this_node_dir && git pull)
fi

this_node_dir=${nodes_dir}/comfyui-workspace-manager
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/11cafe/comfyui-workspace-manager $this_node_dir
else
    (cd $this_node_dir && git pull)
fi

this_node_dir=${nodes_dir}/ComfyUI-Impact-Pack
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/ltdrdata/ComfyUI-Impact-Pack $this_node_dir
else
    (cd $this_node_dir && git pull)
fi


this_node_dir=${nodes_dir}/comfyui_controlnet_aux
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/Fannovel16/comfyui_controlnet_aux $this_node_dir
else
    (cd $this_node_dir && git pull)
fi


this_node_dir=${nodes_dir}/ComfyUI-KJNodes
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/kijai/ComfyUI-KJNodes $this_node_dir
else
    (cd $this_node_dir && git pull)
fi


this_node_dir=${nodes_dir}/ComfyUI_essentials
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/cubiq/ComfyUI_essentials $this_node_dir
else
    (cd $this_node_dir && git pull)
fi


this_node_dir=${nodes_dir}/rgthree-comfy
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/rgthree/rgthree-comfy $this_node_dir
else
    (cd $this_node_dir && git pull)
fi


this_node_dir=${nodes_dir}/was-node-suite-comfyui
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/WASasquatch/was-node-suite-comfyui $this_node_dir
else
    (cd $this_node_dir && git pull)
fi


this_node_dir=${nodes_dir}/Derfuu_ComfyUI_ModdedNodes
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes $this_node_dir
else
    (cd $this_node_dir && git pull)
fi


this_node_dir=${nodes_dir}/ComfyUI-Crystools
if [[ ! -d $this_node_dir ]]; then
    git clone https://github.com/crystian/ComfyUI-Crystools $this_node_dir
else
    (cd $this_node_dir && git pull)
fi




### Download checkpoints

#model_file=${dir}/
#model_url=
#if [[ ! -e ${model_file} ]]; then
#    printf "...\n"
#    download ${model_url} ${model_file}
#fi

model_file=${checkpoints_dir}/baseAnimeStyle_v10LCM.safetensors
model_url=https://civitai.comanimated_models_dir/api/download/models/251092
if [[ ! -e ${model_file} ]]; then
    printf "baseAnimeStyle_v10LCM.safetensors...\n"
    download ${model_url} ${model_file}
fi

model_file=${checkpoints_dir}/aamAnyloraAnimeMixAnime_v1LCM.safetensors
model_url=https://civitai.com/api/download/models/253090
if [[ ! -e ${model_file} ]]; then
    printf "aamAnyloraAnimeMixAnime_v1LCM.safetensors...\n"
    download ${model_url} ${model_file}
fi

model_file=${checkpoints_dir}/aamXLAnimeMix_v10HalfturboEulera.safetensors
model_url=https://civitai.com/api/download/models/330157
if [[ ! -e ${model_file} ]]; then
    printf "aamXLAnimeMix_v10HalfturboEulera.safetensors...\n"
    download ${model_url} ${model_file}
fi

model_file=${checkpoints_dir}/anyloraCheckpoint_lcm.safetensors
model_url=https://civitai.com/api/download/models/256685
if [[ ! -e ${model_file} ]]; then
    printf "anyloraCheckpoint_lcm.safetensors...\n"
    download ${model_url} ${model_file}
fi

model_file=${checkpoints_dir}/noisyElement_noisyElement.safetensors
model_url=https://civitai.com/api/download/models/309689
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

model_file=${checkpoints_dir}/dreamshaper_8LCM.safetensors
model_url=https://civitai.com/api/download/models/252914
if [[ ! -e ${model_file} ]]; then
    printf "dreamshaper_8LCM.safetensors...\n"
    download ${model_url} ${model_file}
fi

model_file=${checkpoints_dir}/cetusMix_Whalefall2.safetensors
model_url=https://civitai.com/api/download/models/105924
if [[ ! -e ${model_file} ]]; then
    printf "xenoxtcLCMEditionArtToon_v10.safetensors...\n"
    download ${model_url} ${model_file}
fi

model_file=${animated_models_dir}/animatelcmFastVideo_v10beta.zip
model_url=https://civitai.com/api/download/models/326487
if [[ ! -e ${model_file} ]]; then
    printf "animatelcmFastVideo_v10beta.zip...\n"
    download ${model_url} ${model_file}
fi

model_file=${controlnet_dir}/controlnet_checkpoint.ckpt
model_url=https://huggingface.co/crishhh/animatediff_controlnet/resolve/main/controlnet_checkpoint.ckpt
if [[ ! -e ${model_file} ]]; then
    printf "controlnet_checkpoint.ckpt...\n"
    download ${model_url} ${model_file}
fi

model_file=${controlnet_dir}/control_v11f1e_sd15_tile.pth
model_url=https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

model_file=${controlnet_dir}/diff_control_sd15_temporalnet_fp16.safetensors
model_url=https://huggingface.co/CiaraRowles/TemporalNet/resolve/main/diff_control_sd15_temporalnet_fp16.safetensors
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

model_file=${controlnet_dir}/control_v11f1p_sd15_depth.pth
model_url=https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1p_sd15_depth.pth
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

model_file=${controlnet_dir}/control_v11p_sd15_softedge.pth
model_url=https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_softedge.pth
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

model_file=${controlnet_dir}/control_v11p_sd15_openpose.pth
model_url=https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose.pth
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

model_file=${controlnet_dir}/control-lora-depth-rank128.safetensors
model_url=https://huggingface.co/stabilityai/control-lora/resolve/main/control-LoRAs-rank128/control-lora-depth-rank128.safetensors
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

model_file=${controlnet_dir}/OpenPoseXL2.safetensors
model_url=https://huggingface.co/thibaud/controlnet-openpose-sdxl-1.0/resolve/main/OpenPoseXL2.safetensors
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

model_file=${controlnet_dir}/controlnet-sd-xl-1.0-softedge-dexined.safetensors
model_url=https://huggingface.co/SargeZT/controlnet-sd-xl-1.0-softedge-dexined/resolve/main/controlnet-sd-xl-1.0-softedge-dexined.safetensors
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

model_file=${loras_dir}/tifa-nvwls-v1-final.safetensors
model_url=https://civitai.com/api/download/models/92744
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

model_file=${loras_dir}/tifa-nvwls-v2.safetensors
model_url=https://civitai.com/api/download/models/311382
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

model_file=${loras_dir}/3DMM_V12.safetensors
model_url=https://civitai.com/api/download/models/107366
if [[ ! -e ${model_file} ]]; then
    printf "...\n"
    download ${model_url} ${model_file}
fi

