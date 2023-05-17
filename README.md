# mRNA-code


Source code to reproduce results in the paper "RNAdegformer: Accurate Prediction of mRNA Degradation at Nucleotide Resolution with Deep Learning".
<div align="center">
  <h2> <a href= >[paper]</a >, <a href=https://academic.oup.com/bib/article/24/1/bbac581/6986359?login=false>[project hompage]</a ></h2>
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/Shujun-He/RNAdegformer/main/graphics/RNAdegformer.png?token=GHSAT0AAAAAABRGHIRII6LFDFJ7KPWZWBEAYY6X33Q"/>
</p>



## Requirements
I included a file (environment.yml) to recreate the exact environment I used. Since I also use this environment for computer vision tasks, it includes some other packages as well. This should take around 10 minutes. After installing anaconda:


```
conda env create -f environment.yml
```

Then to activate the environment

```
conda activate torch
```

Additionally, you will need Nvidai Apex: https://github.com/NVIDIA/apex

```
git clone https://github.com/NVIDIA/apex
cd apex
pip install .
```

Also you need to install the Ranger optimizer

```bash
git clone https://github.com/lessw2020/Ranger-Deep-Learning-Optimizer
cd Ranger-Deep-Learning-Optimizer
pip install -e .
```

## Repo file structure

The src folder includes all the code needed to reproduce results in the paper and the OpenVaccine competition. Additional instructions are in the folder


```src/OpenVaccine``` includes all the code needed to run a ten-fold model for the openvaccine dataset



## Datasets

### OpenVaccine dataset

For original dataset, see https://www.kaggle.com/c/stanford-covid-vaccine/data

In addition to the secondary structure features given by Das Lab, I also generated additional secondary structure features at 2 temperatures with 6 biophysical packages (12x), for these features, see https://www.kaggle.com/shujun717/openvaccine-12x-dataset

## How to run
```
python pretrain.py --gpu_id -1 --kmer_aggregation --nmute 0 --epochs 200 --nlayers 5 --batch_size 96 --kmers 5 --lr_scale 0.1   --workers
0 --dropout 0.1 --nclass 5 --ntoken 15 --nhead 32 --ninp 256 --nhid 1024 --warmup_steps 600 --fold 1 --weight_decay 0.1
```
```
python train.py --gpu_id -1 --kmer_aggregation --nmute 0 --epochs 1 --nlayers 5  --batch_size 16 --kmers 5 --lr_scale 0.1  --workers 0 --d
ropout 0.1 --nclass 5 --ntoken 15 --nhead 32 --ninp 256 --nhid 1024 --warmup_steps 600 --fold 1 --weight_decay 0.1 --nfolds 10 --error_alpha 0.5 --noise_filter 0.25
```

